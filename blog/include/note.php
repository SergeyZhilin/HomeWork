<?php
session_start();
require_once 'db.php';

function drawComment($comment, $row_comments, $depth = 0){
    if($depth == 0){
        $depth++;
        $result = '<div class="comment">
        <p class="date">' . $comment['comment_username'] . ' ' . $comment['comment_datetime'] . ' </p>
        <p> ' . $comment['comment_text'] . '</p>
        <a href="?id='.$_GET['id'].'&comment='.$comment['comment_id'].'#comment">Ответить</a>';

        if($_SESSION['logined']){
            $result .= ' | <a href="?id=' . $_GET['id'] . '&comment_update=' . $comment['comment_id'] . '#comment">Редактировать</a>';
            $result .= ' | <a href="?id=' . $_GET['id'] . '&comment_del=' . $comment['comment_id'] . '">Удалить</a>';
        }

        $result .= '</div><div style="padding-left:20px">';

        $children_comments = $row_comments[$comment['comment_id']];
        if(!empty($children_comments)){
            foreach ($children_comments as $key=>$value){
                $r = drawComment($value, $row_comments, $depth);
                $result .= $r;
            }
        }

        $result .= '</div>';
    }else{
        $depth++;

        $result = '<div style="padding-left:'.(20*$depth).'px;">
                      <div class="Message">
                           <p class="date">' . $comment['comment_username'] . ' ' . $comment['comment_datetime'] . ' </p>
        <p> ' . $comment['comment_text'] . '</p></div>
        <a href="?id='.$_GET['id'].'&comment='.$comment['comment_id'].'#comment">Ответить</a>';

        if($_SESSION['logined']){
            $result .= ' | <a href="?id=' . $_GET['id'] . '&comment_update=' . $comment['comment_id'] . '#comment">Редактировать</a>';
            $result .= ' | <a href="?id=' . $_GET['id'] . '&comment_del=' . $comment['comment_id'] . '">Удалить</a>';
        }

        $result .= '</div><div style="padding-left:20px">';

        $children_comments = $row_comments[$comment['comment_id']];
        if(!empty($children_comments)) {
            foreach ($children_comments as $key => $value) {
                $r = drawComment($value, $row_comments, $depth);
                $result .= $r;
            }
        }

        $result .= '</div>';
    }

    return $result;
}
?>
<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="utf-8">  
		<title>Моя заметка № <?=$_GET['id']; ?></title>
		<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/styless.css">
	</head>
	<body>
		<div id="wrapper">
            <?php for($i=0;$i<count($res_select_update);$i++):?>
			<h1><?=$res_select_update[$i]['post_title']?></h1>
			<div>
				<p class="nav right">
					<a href="../index.php">на главную</a>
				</p>
				<p class="date"><?=$res_select_update[$i]['post_create_datetime']?>
				</p>
				<p>
                    <?=$res_select_update[$i]['post_text'];?>
                </p>
                <p>
                	<?php if ($res_select_update[$i]['tags']) {   // выборка тегов
					     $value['tags'] = explode(',', $res_select_update[$i]['tags']);
					        foreach ($value['tags'] as $tag) {
					     	    //print_r($tag);?>
                                <span class="print_tag">
                                    <a href='../include/posttotag.php?tag=<?=$tag?>'><?="#".$tag?></a>
                                  </span>
					     <?php  } ?>  
				<?php } ?>
                </p>
                <a href='?id=<?=$_GET['id']?>&comment=mine#comment'>Оставить комментарий</a>
                <h4>Комментарии:</h4>
            <?php endfor;

                for ($k=0; $k < count($comment_main); $k++) {
                    $result = drawComment($comment_main[$k], $row_comments, 0);
                    echo $result;
                }

                if (!empty($_GET['comment']) || !empty($_GET['comment_update'])) {
            ?>
                    <a name="comment"></a>
                    <form action="?id=<?=$_GET['id']?>" method="POST">
                        <?php
                        if(!empty($_GET['comment_update'])){
                            echo '<p>
                                <input name="comment_id" value="'.$_GET['comment_update'].'" type="hidden">
                            </p>';
                        }
                        ?>
                            <p>
                                <input name="comment_name" placeholder="ваше имя" value="<?=$_GET['comment_update'] ? $comment_name : ''?>" class="form-control">
                            </p>
                            <p>
                                <textarea placeholder="  ваш коментарий" name="comment_text" cols="77" rows="5"><?=$_GET['comment_update'] ? $comment_text : ''?></textarea>
                            </p>
                            <p>
                                <input name="save_comment" type="submit" class="btn btn-danger btn-block" value="Отправить">
                            </p>
                    </form>
                 <?php } ?>
			</div>
		</div>

	</body>
</html>



