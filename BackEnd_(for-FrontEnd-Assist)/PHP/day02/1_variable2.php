<?php
    $num = 10;
    function f1() {
        $str = "PHP";
        echo "<p>함수 안에서 호출한 지역변수 str : {$str}</p>";
    }
    function f2() {
        global $num;
        echo "<p>함수 안에서 호출한 전역변수 num : {$num}</p>";
    }
    echo "<p>함수 밖에서 호출한 지역변수 str : {$str}</p>";
    echo "<p>함수 밖에서 호출한 전역변수 num : {$num}</p>";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>변수 - 2</h2>
    <?php
        f1();
        f2();
    ?>
</body>
</html>