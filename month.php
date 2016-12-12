<?php

$handle = fopen ("php://stdin","r");
$number = fgets($handle);


if ($m == "Jan") {
	echo "Today January";
}
elseif ($m == "Fab") {
	echo "Today Fabruary";
}
elseif ($m == "Mar") {
	echo "Today March";
}
elseif ($m == "Apr") {
	echo "Today April";
}
elseif ($m == "May") {
	echo "Today May";
}
elseif ($m == "Jun") {
	echo "Today June";
}
elseif ($m == "Jul") {
	echo "Today July";
}
elseif ($m == "Aug") {
	echo "Today August";
}
elseif ($m == "Sep") {
	echo "Today September";
}
elseif ($m == "Oct") {
	echo "Today October";
}
elseif ($m == "Nov") {
	echo "Today November";
}
elseif ($m == "Dec") {
	echo "Today December";
}
else {
	echo "Guys dont kidding, only 12 month ;)";
}
?>