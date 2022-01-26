<?php
    session_start(); // 세션을 사용하겠다고 선언하는 함수
    $_SESSION['userid'] = "apple";
    $_SESSION['username'] = "김사과";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>세션 - 1</title>
</head>
<body>
    <h2>세션 - 1</h2>
    <p>세션 ID : <?=session_id()?></p>
    <p>USERID 변수 : <?=$_SESSION['userid']?></p>
    <p>USERNAME 변수 : <?=$_SESSION['username']?></p>
</body>
</html>