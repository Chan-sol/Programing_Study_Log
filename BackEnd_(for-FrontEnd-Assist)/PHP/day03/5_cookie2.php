<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠키 불러오기</title>
</head>
<body>
    <h2>쿠키 불러오기</h2>
    <?php
        if(isset($_COOKIE['snack'])){
            echo "<p>쿠키가 존재합니다</p>";
            echo "<p>저장된 쿠키의 값 : {$_COOKIE['snack']}</p>";
        } // 이게 세팅되어 있니?
        else {
            echo "<p>쿠키가 존재하지 않습니다.</p>";
        }
    ?>
</body>
</html>