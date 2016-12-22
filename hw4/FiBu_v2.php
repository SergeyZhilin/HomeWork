<?php
array_map(function($value){
  list($f, $b, $n) = explode(' ',(trim($value)));
   $result = array_map(function ($number, $var1, $var2){
    if (!($number % $var1) && !($number % $var2)) {
        return "FB";
    } elseif (!($number % $var1)) {
        return "F";
    } elseif (!($number % $var2)) {
        return "B";
    } else return $number;
}, range(1, $n), array_fill(1, $n, $f), array_fill(1, $n, $b));
   echo implode(" ",$result). "\n";
}, file($argv[1]));
?>