<?php
    $tests = $_GET['test'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>foreach</title>
</head>
<body>
    <p>
    <?php
        foreach($tests as $var) { // 배열 as 그 배열 안의 변수
            # code...
            echo "{$var} ";
        }
    ?>
    </p>
</body>
</html>