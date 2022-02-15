<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajax</title>
</head>
<body>
    <h2>Ajax</h2>
    <p id="text"></p>
    <p><input type="text" id="userid"></p>
    <p><input type="password" id="userpw"></p>
    <p>
        <p><input type="button" value="요청 보내기(GET)" onclick="sendit_get()"></p>
        <p><input type="button" value="요청 보내기(POST)" onclick="sendit_post()"></p>
    </p>
</body>
<script>
    function sendit_get() {
        const xhr = new XMLHttpRequest();
        console.log(xhr.readyState);
        xhr.onreadystatechange = function() {
            console.log("함수 호출!");
            console.log(xhr.readyState);
            if(xhr.readyState == XMLHttpRequest.DONE){
                // 요청한 데이터 처리가 완료되었니?
                if(xhr.status == 200){ // 성공 : 200 or 201, 실패 : 400 ...
                    document.getElementById("text").innerHTML = xhr.responseText;
                }
            }
        }
        let userid = document.getElementById("userid").value;
        let userpw = document.getElementById("userpw").value;
        xhr.open("GET", `1_ajax_ok.php?userid=${userid}&userpw=${userpw}`, true);
        xhr.send();
    }

    function sendit_post() {
        const xhr = new XMLHttpRequest();
        console.log(xhr.readyState);
        xhr.onreadystatechange = function() {
            console.log("함수 호출!");
            console.log(xhr.readyState);
            if(xhr.readyState == XMLHttpRequest.DONE){
                if(xhr.status == 200){
                    document.getElementById("text").innerHTML = xhr.responseText;
                }
            }
        }
        xhr.open("POST", "1_ajax_ok.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        let userid = document.getElementById("userid").value;
        let userpw = document.getElementById("userpw").value;
        xhr.send(`userid=${userid}&userpw=${userpw}`);
    }
</script>
</html>