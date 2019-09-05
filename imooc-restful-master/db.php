<?php
$pdo = new PDO('mysql:host=127.0.0.1;dbname=mydb','root','123456',[PDO::ATTR_EMULATE_PREPARES=>false]);
return $pdo;
