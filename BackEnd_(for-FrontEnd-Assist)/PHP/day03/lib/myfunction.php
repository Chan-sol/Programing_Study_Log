<?php
    function hello(){
        echo "<p>Hello php!</p>";
    }
    function add($num1, $num2){
        echo "<p>{$num1} + {$num2} = ".($num1+$num2)."</p>"; 
        // php에서  .은 문자열을 연결하는 +랑 같음
    }
    function getSum($num1, $num2){
        return $num1+$num2;
    }
?>
<!-- html 주석 -->
<!-- 그런데 이 주석도 view 파일에 추가가 됨 -->
<!-- 이걸 응용할 수도 있음 -->