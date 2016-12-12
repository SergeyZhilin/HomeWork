<?php

$handle = fopen ("php://stdin","r");
$input = fgets($handle);


$kate = explode(" ", $input);

$a = $kate[0];
$b = $kate[1];
$end = $kate[2];

$x = 0;
while ($x ++ < $end) 
	if  (($x % $a == 0) && ($x % $b == 0)) {
		echo "FizzBuzz". ' ';
	}elseif ($x % $b == 0) {
		echo "Buzz". ' ';
	}elseif ($x % $a == 0) {
		echo "Fizz". ' ';
	}else 
		echo $x. ' '

?>