<?php
    $userid = $_POST['userid'];
    $userpw = $_POST['userpw'];
    $username = $_POST['name'];
    $userhp = $_POST['hp'];
    $useremail = $_POST['email'];
    $userhobby = $_POST['hobby']; // ['게임', '코딩']
    $hobbystr = $userhobby[0]; // "게임"
    for($i=1; $i < count($userhobby); $i++){
        $hobbystr .= ",". $userhobby[$i];
    }

    $zipcode = $_POST['zipcode'];
    $address1 = $_POST['address1'];
    $address2 = $_POST['address2'];
    $address3 = $_POST['address3'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
</head>
<body>
    <h2>회원가입 완료</h2>
    <p>아이디 : <?=$userid?></p>
    <p>비밀번호 : <?=$userpw?></p>
    <p>이름 : <?=$username?></p>
    <p>휴대폰 번호 : <?=$userhp?></p>
    <p>이메일 : <?=$useremail?></p>
    <p>취미 : <?=$userhobby[0].','.$userhobby[1]?></p>
    취미 : <?=$hobbystr?><br>
    <p>우편번호 : <?=$zipcode?></p>
    <p>주소 : <?=$address1?></p>
    <p>상세주소 : <?=$address2?></p>
    <p>참고항목 : <?=$address3?></p>
</body>
</html>