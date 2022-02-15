<?php
    include "./lib/myfunction.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>함수</title>
</head>
<body>
    <?php
        include "./layout/header.php";
        // 반복되는 html 코드가 길 때 유용
    ?>
    <h2>함수</h2>
    <?php
        hello();
        add(10,3);
        echo "<p>".getSum(10,20)."</p>"; 
        // getSum(10,20)이 30을 return하는데 php에서는 화면에 출력하려면 echo로 찍어내야 함
    ?>
    <?=getSum(10,20)?>
    <!-- echo getSum(10,20);을 표현식으로 한 번에 쓴 형태 -->
</body>
</html>