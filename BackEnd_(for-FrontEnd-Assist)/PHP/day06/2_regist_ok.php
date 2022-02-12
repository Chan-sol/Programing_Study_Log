<?php
    include "./include/dbconn.php";

    $userid = $_POST['userid'];
    $userpw = $_POST['userpw'];
    $username = $_POST['name'];
    $userhp = $_POST['hp'];
    $useremail = $_POST['email'];
    $usergender = $_POST['usergender'];
    $userhobby = $_POST['hobby']; // ['게임', '코딩']
    $hobbystr = $userhobby[0]; // "게임"
    for($i=1; $i < count($userhobby); $i++){
        $hobbystr .= ",". $userhobby[$i];
    }

    $zipcode = $_POST['zipcode'];
    $address1 = $_POST['address1'];
    $address2 = $_POST['address2'];
    $address3 = $_POST['address3'];

    $sql = "insert into tb_user(userid, userpw, username, userphone, 
    useremail, userhobby, zipcode, address1, address2, address3, usergender) 
    values ('$userid', md5('$userpw'), '$username', '$userhp', '$useremail', '$hobbystr', '$zipcode', '$address1', '$address2', '$address3', '$usergender')";

    $result = mysqli_query($conn, $sql); // mysqli_query(다리, 쿼리문);
    echo $result; // 성공 시 1

    setcookie("joinid", $userid, time()+60*5, "/");
?>
<script>
    alert("회원가입 성공!");
    location.href="./3_login.php";
</script>