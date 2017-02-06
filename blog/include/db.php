<?php
error_reporting(E_ALL & ~E_NOTICE);
 // error_reporting(E_ALL);
 // ini_set('display_errors', 1);
//подключение к базе 

try {
    $link = new PDO('mysql:host=localhost;dbname=bloger', 'root', '');
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
} 
//изъятие всех постов из базы
$sorting = '';
if(isset($_GET['sort']) && isset($_GET['direction'])){
    $sorting = " ORDER BY ".$_GET['sort']." ".$_GET['direction'];
}

$searching = '';
if(isset($_GET['search'])){
    $searching = "WHERE (post.post_title LIKE '%".$_GET['search']."%' OR post.post_text LIKE '%".$_GET['search']."%' OR tag.tag_title LIKE '%".$_GET['search']."%' OR post.post_min_text LIKE '%".$_GET['search']."%')";
}

$select = $link->query("SELECT post.* , group_concat(tag.tag_title) as tags FROM post LEFT JOIN post_to_tag USING (post_id) LEFT JOIN tag USING (tag_id) ".$searching." GROUP BY post.post_id DESC ".$sorting);
$res_select = $select->fetchAll(PDO::FETCH_ASSOC);

//добавление постов
if (!empty($_POST['post_title_add'])and !empty($_POST['post_min_text_add'])){
    if (!empty($_POST['post_text_add'])){
        $insert = $link ->query("INSERT INTO post SET post.post_title = '{$_POST['post_title_add']}',post.post_min_text = '{$_POST['post_min_text_add']}',post.post_text='{$_POST['post_text_add']}',post.post_create_datetime = NOW()");
        $insert_post_id = $link->lastInsertId();//id последней добавленной строки
        if (!empty($_POST['tag_add'])) {
            $tag_arr = explode(',', $_POST['tag_add']);
            foreach ($tag_arr as $tags) {
                    //проверяет есть ли такой тег к таблице тегов
                    $insert_valid = $link ->query("SELECT * FROM tag WHERE tag_title ='$tags'");
                    $result_valid = $insert_valid->fetchAll(PDO::FETCH_ASSOC);
                if (!empty($result_valid)) {
                    //print_r($result_valid);
                    //print_r($result_valid[0]['tag_id']);
                    $ins_tag_id = $result_valid[0]['tag_id'];
                    $insert_post_tag = $link ->query("INSERT INTO post_to_tag SET post_to_tag.post_id = '$insert_post_id', post_to_tag.tag_id = '$ins_tag_id'");
                } else {
                        $insert = $link ->query("INSERT INTO tag SET tag_title ='$tags'"); // если нет, то добавляет
                        $insert_tag_id = $link->lastInsertId(); //id последней добавленной строки
                        $insert_post_tag = $link ->query("INSERT INTO post_to_tag SET post_to_tag.post_id = '$insert_post_id', post_to_tag.tag_id = '$insert_tag_id'");
                }
            }
            header("Location:../index.php");
        }
    }
}

$comment_name = '';
$comment_text = '';
if (isset($_GET['comment_update'])) {
    $comment = $link ->query("SELECT * FROM comment WHERE comment_id=" . $_GET['comment_update']);
    $comment = $comment ->fetch(PDO::FETCH_ASSOC);

    if($comment){
        var_dump($comment);
        $comment_name = $comment['comment_username'];
        $comment_text = $comment['comment_text'];
    }
}

// добавление/редактирование комментариев
if (!empty($_POST['comment_name']) and !empty($_POST['comment_text'])) {
    if (isset($_POST['comment_id'])){
        $update = $link ->query("UPDATE comment SET comment_username = '{$_POST['comment_name']}', comment_text = '{$_POST['comment_text']}' WHERE comment_id = '{$_POST['comment_id']}'");
    }else{
        if ($_GET['comment'] == 'mine') {
            $insert = $link ->query("INSERT INTO comment SET post_id = '{$_GET['id']}', comment_username = '{$_POST['comment_name']}', comment_text = '{$_POST['comment_text']}'");

        } else {
            $insert = $link ->query("INSERT INTO comment SET post_id = '{$_GET['id']}', comment_parent_id = '{$_GET['comment']}', comment_username = '{$_POST['comment_name']}', comment_text = '{$_POST['comment_text']}'");
        }
    }
}
//удаление комментария
if (isset($_GET['comment_del'])) {
    $delete_comment = $link ->query("DELETE FROM comment WHERE comment_id=" . $_GET['comment_del']);
}
//изъятие полного поста комментов
if(isset($_GET['id'])){
    $getid = $_GET['id'];
    $select_update = $link->query("SELECT post.*, group_concat(tag.tag_title) as tags FROM post LEFT JOIN post_to_tag USING (post_id) LEFT JOIN tag USING (tag_id) WHERE post_id='$getid' group by post.post_id");
    $res_select_update = $select_update ->fetchAll(PDO::FETCH_ASSOC);
    $select_update_com = $link ->query("SELECT comment.* FROM comment LEFT JOIN post USING (post_id) WHERE post_id='$getid' ");
    $select_comment = $select_update_com ->fetchAll(PDO::FETCH_ASSOC);
    // var_dump($select_comment);
    $comment_arr_main = [];
    $comment_arr = [];
    for ($i=0; $i < count($select_comment); $i++) { 
        if (is_null($select_comment[$i]['comment_parent_id'])) {
            $comment_arr_main[$i] = $select_comment[$i];
        } else  $comment_arr[$i] = $select_comment[$i]; 
    }

    $comment_main = array_values($comment_arr_main);
    $comment_not_mine = array_values($comment_arr);
    $row_comments = [];
    foreach ($comment_not_mine as $value) {
        $row_comments[$value['comment_parent_id']][] = $value;
    }
}



//изменение поста
if(isset($_POST['save'])) {
    $update = $link->query("UPDATE post SET post_title='{$_POST['author_edit']}',post_min_text = '{$_POST['up_min_article']}',post_text = '{$_POST['full_edit']}',post_create_datetime='{$_POST['time_edit']}',post_update_datetime=NOW() WHERE post_id=" . $_GET['id']);
    if (!$update) {
        echo "PDO::errorInfo():";
        print_r($link->errorInfo());
        echo("<body><div><h3>Please enter the correct data!</div></body>");
    }

    $remove = $link->query("DELETE FROM post_to_tag WHERE post_id=" . $_GET['id']);

    if (!empty($_POST['tag_edit'])) {
        $tag_arr_edit = explode(',', $_POST['tag_edit']);
        foreach ($tag_arr_edit as $tags_edit) {
            $query = $link->query("SELECT * FROM tag WHERE tag_title='$tags_edit'");
            $tag = $query->fetch(PDO::FETCH_ASSOC);

            if($tag){
                $tag_id = $tag['tag_id'];
                $insert_edit_tag = $link ->query("INSERT INTO post_to_tag SET post_to_tag.post_id = '$getid', post_to_tag.tag_id = '$tag_id'");
            }else{
                $insert_edit = $link ->query("INSERT INTO tag SET tag_title ='$tags_edit'");
                $insert_tag_id_edit = $link->lastInsertId();
                $insert_edit_tag = $link ->query("INSERT INTO post_to_tag SET post_to_tag.post_id = '$getid', post_to_tag.tag_id = '$insert_tag_id_edit'");
            }
        }
    }
    header("Location:../index.php");
}


//извлечение постов по тегу
if(isset($_GET['tag'])) {
    $gettag = $_GET['tag'];
    $select_post_tag = $link ->query("SELECT tag_id FROM tag WHERE tag_title = '$gettag'");
    if (!$select_post_tag) {
        echo "PDO::errorInfo():";
        print_r($link->errorInfo());
    } else $insert_tag_id = $select_post_tag->fetchAll();
    // print_r($insert_tag_id);
    $tag_id_for_post = $insert_tag_id[0][0];
    $select_posts_for_tag = $link ->query("SELECT post.* from post LEFT JOIN post_to_tag USING (post_id) WHERE post_to_tag.tag_id = '$tag_id_for_post' ORDER BY post.post_create_datetime DESC");
    $result_posts_for_tag = $select_posts_for_tag ->fetchAll(PDO::FETCH_ASSOC);
    //print_r($result_posts_for_tag);
}

//удаление поста
if(isset($_GET['del'])) {
    $delete = $link->query("DELETE FROM post WHERE post_id=" . $_GET['del']);
    header("Location:index.php");
}
