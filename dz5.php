<?php

echo "If you like a cat, press 1!\n";
$handle = fopen ("php://stdin","r");
$catdog = fgets($handle);

echo ($catdog == 1) ? "Meaw" : "Woof!"; 

echo "\n";