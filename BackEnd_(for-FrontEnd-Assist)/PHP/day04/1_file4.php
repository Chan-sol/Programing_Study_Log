<?php
    // POST로 전송된 데이터가 있다면(댓글을 썼을 때)
    if($_POST != null){
        // $fs라는 변수에 ""reply.txt"를 "a"모드(append)로 열어서 넣어라!
        $fs = @fopen("reply.txt", "a") or exit("break");
        if($fs != null){
            // POST로 보낸 'msg'라는 이름의 데이터를 msg라는 변수에 넣어라!
            $msg = $_POST['msg'];
            // $fs 변수로 열은 파일에 msg라는 변수에 있는 데이터에 \n 연결해서 추가해라!
            fputs($fs, $msg."\n");
            // $fs 변수에 넣어둔 열린 파일 닫기!
            fclose($fs);
        }
    }
    $result = "";
    $fs = @fopen("reply.txt", "r") or exit("break");
    while(!feof($fs)){
        // $fs 파일의 end of file, 즉 마지막이 아니라면
        // 파일의 끝에 아직 도착하지 않았다면
        
        $msg = fgets($fs);
        // $fs의 한 줄을 읽어오며 커서를 아래로 내리고 내용은 $msg 변수에 넣음
        if($msg != ""){
            // $msg에 읽힌 내용이 ""이 아니라면 (내용잉 없는 줄이 아니라면)
            $result = $msg."<br>".$result;
            // result에 msg를 앞에다가 연결
        }
    }
    fclose($fs);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일을 이용한 댓글</title>
</head>
<body>
    <h2>파일을 이용한 댓글</h2>
    <form method="post"> <!-- action 지정 안 해주면 현재 페이지에 값을 저장하고 페이지 이동을 하지 않음 -->
        <p>
            <label>댓글<input type="text" name="msg"></label>
            <input type="submit" value="댓글 달기">
        </p>
    </form>
    <hr>
    <p>
        <?=$result?>
    </p>
</body>
</html>