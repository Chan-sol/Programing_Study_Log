<?php
    function counter1() {
        $num1 = 1;
        echo "<p>지역변수 num1의 값 : {$num1}</p>";
        $num1++;
    }
    
    $num2 = 1;
    function counter2() {
        global $num2;
        echo "<p>전역변수 num2의 값 : {$num2}</p>";
        $num2++;
    }

    function counter3() {
        static $num3 = 1;
        echo "<p>static 변수 num3의 값 : {$num3}</p>";
        $num3++;
    }
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
    <h2>변수 - 3</h2>
    <?php
        counter1();
        counter1();
        counter1();
        echo "<hr>";
        counter2();
        counter2();
        counter2();
        echo "<hr>";
        counter3();
        counter3();
        counter3();
        echo "<hr>";
    ?>
</body>
</html>