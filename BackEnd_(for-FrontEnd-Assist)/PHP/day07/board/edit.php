<?php
    echo "<a href='../logout.php'>로그아웃</a>";
    include "../include/logincheck.php";
    include "../include/dbconn.php";

    // 파라미터 boardidx 유효성 검사 해야됨 (생략)

    $boardidx = $_GET['boardidx'];
    $sql = "select boardidx, boardtitle, boardcontents from tb_board where boardidx = $boardidx";
    $result = mysqli_query($conn, $sql);
    $data = mysqli_fetch_array($result);

    $boardtitle = $data['boardtitle'];
    $boardcontent = $data['boardcontents'];
    $userid = $_SESSION['userid'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정</title>
</head>
<body>
    <h2>글 수정</h2>
    <form action="./edit_ok.php" method="post">
        <input type="hidden" name="boardidx" value="<?=$boardidx?>">
        <p>아이디 : <?=$userid?></p>
        <p>제목 : <input type="text" name="boardtitle" value="<?=$boardtitle?>"></p>
        <p><textarea name="boardcontent" cols="40" rows="10"><?=$boardcontent?></textarea></p>
        <p>
            <input type="submit" value="확인">
            <input type="reset" value="다시 작성">
            <input type="button" value="리스트" onclick="location.href='list.php'">
        </p>
    </form>
</body>
</html>