<?php

echo "Put any kay". ' ';
$handle = fopen ("php://stdin","r");
$m = fgets($handle);


if ($m == 1) {
	echo "Now January";
}
elseif ($m == 2) {
	echo "Now Fabruary";
}
elseif ($m == 3) {
	echo "Now March";
}
elseif ($m == 4) {
	echo "Now April";
}
elseif ($m == 5) {
	echo "Now May";
}
elseif ($m == 6) {
	echo "Now June";
}
elseif ($m == 7) {
	echo "Now July";
}
elseif ($m == 8) {
	echo "Now August";
}
elseif ($m == 9) {
	echo "Now September";
}
elseif ($m == 10) {
	echo "Now October";
}
elseif ($m == 11) {
	echo "Now November";
}
elseif ($m == 12) {
	echo "Now December";
}
else {
	echo "Guys dont kidding, only 12 month ;)";
}
?>
