<?php
	
class Home
{
    public $look_kv;
    public $kvartir_na_etaje;
    public $etaj;
    public $home;

    public function wthome() // проверка дома, и присвоение квартир на этаже, и этажей в переменные
    {
        if ($this->home == "ST_5_4") {
            $this->kvartir_na_etaje = 3;
            $this->etaj = 5;
        } elseif ($this->home == "Khr_9_5") {
            $this->kvartir_na_etaje = 4;
            $this->etaj = 9;
        }

    }

    public function sumKvartir() // подсчёт квартир в подъезде
    {
        return $sumaKvartir = $this->etaj * $this->kvartir_na_etaje;

    }
    function __construct($home, $look_kv)  //передача данных из объекта в конструктор
    {
        $this->home = $home;
        $this->look_kv = $look_kv;
    }

    public function helpLook() // поиск квартиры в подъезде и на этаже
    {
         $a = ($this->look_kv - 1) / $this->sumKvartir();
         $b = floor($a);
     echo "Номер подъезда " . $padik= $b + 1 . "\n"; // Подъезд
         $c = $a - $b;
         $etajj = $c * $this->etaj;
     echo Этаж . " " . $etajj = floor($c * $this->etaj + 1 ) . "\n";
//    "Этаж " . $correct_etaj = ceil($etajj); // Этаж
//    var_dump($b);
    }

}
$object = new Home("Khr_9_5", 1);
$object->wthome();
$object->sumKvartir();
$object->helpLook();