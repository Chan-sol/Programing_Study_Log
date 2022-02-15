<?php
    include "../include/logincheck.php";
    include "../include/dbconn.php";

    $userid = $_SESSION['userid'];
    $boardtitle = $_POST['boardtitle'];
    $boardcontents = $_POST['boardcontent'];

    $sql = "insert into tb_board (userid, boardtitle, boardcontents) values ('$userid', '$boardtitle', '$boardcontents')";
    $result = mysqli_query($conn, $sql);

    echo "<script>alert('작성 완료!'); location.href='./list.php';</script>"
?>