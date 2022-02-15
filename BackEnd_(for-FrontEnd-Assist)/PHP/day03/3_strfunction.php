<?php
    $str1 = "abcdefghijklmnopqrstuvwxyz";
    $str2 = "가나다라마바사아자차카타파하";
    $str3 = "apple/banana/cherry/durian";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문자열 함수</title>
</head>
<body>
    <h2>문자열 함수</h2>
    <?php
        echo strlen($str1)."<br>";
        echo strlen($str2)."<br>"; // 한글은 하나 당 3byte라서 14 * 3인 42가 출력됨
        // echo mb_strlen($str2, "utf-8")."<br>";
        echo "<hr>";

        // 아스키코드로 비교
        echo strcmp("abcd", "abcf")."<br>";
        echo strcmp("abcd", "ABCD")."<br>";
        echo strcmp("10", "2")."<br>";
        echo strcmp("10", "10")."<br>";
        echo "<hr>";
        
        echo strstr($str1, "cd"); // cd가 나오는 부분부터 끝까지 출력
        echo "<hr>";
        
        echo strpos("$str1", "cd"); // cd가 처음 나오는 부분의 index를 출력
        echo "<hr>";
        
        echo substr($str1,2)."<br>";
        echo substr($str1,-2)."<br>"; // 뒤에서 두 번째부터 끝까지
        echo substr($str1,2,5)."<br>";
        echo substr($str1,-5,2)."<br>"; // 뒤에서 다섯 번째 부터 두 개
        echo "<hr>";

        $arr = explode("/", $str3);
        foreach ($arr as $name) {
            echo $name." ";
        }
        echo "<hr>";
        echo str_replace("/","*",$str3)."<br>"; // '/'을 '*'로 바꾸고 문자열 출력
    ?>
</body>
</html>