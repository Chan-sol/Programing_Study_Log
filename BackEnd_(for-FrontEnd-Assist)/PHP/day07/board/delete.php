<?php
    echo "<a href='../logout.php'>로그아웃</a>";
    include "../include/logincheck.php";
    include "../include/dbconn.php";

    // 파라미터 boardidx 유효성 검사 해야됨 (생략)

    $boardidx = $_GET['boardidx'];

    $sql = "delete from tb_board where boardidx = $boardidx";
    $result = mysqli_query($conn, $sql);
    echo "<script>alert('{$boardidx}번 게시글 삭제 완료!'); location.href='./list.php';</script>" // 'list.php'도 가능하네..
?>