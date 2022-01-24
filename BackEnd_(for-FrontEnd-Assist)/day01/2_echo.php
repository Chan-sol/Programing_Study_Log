<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP의 출력</title>
</head>
<body>
    <h2>PHP의 출력</h2>
    <?php
        echo(3+2); // echo() : 출력 함수
        echo ("<br>");
        echo 4+5;
        echo "<hr>";
        echo("<button>버튼</button>");
        // html에 5<br>5이 바로 써지는 것 (php의 기본 성질)
    ?>
    <hr>
    <?=3+2?> <!-- echo 3+2;을 의미하기 때문에 여기선 세미콜론(;) 쓰지 않음 -->
</body>
</html>