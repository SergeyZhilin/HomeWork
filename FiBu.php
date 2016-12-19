<?php 

$handle = fopen ("php://stdin","r");
$input = fgets($handle);

function FiBu ($input) {
  $kate = explode(" ", $input);
  $x = $kate[0];
  $y = $kate[1];
  $n = $kate[2];
  $a = 0;
    while ($a ++ < $n) 
	if  (($a % $x == 0) && ($a % $y == 0)) {
		echo "FizzBuzz". ' ';
	}elseif ($a % $y == 0) {
		echo "Buzz". ' ';
	}elseif ($a % $x == 0) {
		echo "Fizz". ' ';
	}else 
		echo $a. ' ';
}

FiBu ($input);

?>