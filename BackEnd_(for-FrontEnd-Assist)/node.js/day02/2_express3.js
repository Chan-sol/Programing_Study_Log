const express = require('express');
const app = express();

app.use((req,resp)=>{
    console.log('첫번째 미들웨어 실행!');
    console.dir(req.header); // request 정보가 담긴 request header 출력
    const userAgent = req.header('User-Agent');
    console.log(userAgent); // user가 어떤 request를 보내고 있는 지 문자열로 확인

    resp.writeHead(200, {'content-type':'text/html;charset=utf-8'});
    resp.write(`<h2>익스프레스 서버에서 응답한 메세지입니다.</h2>`);
    resp.write(`<p>User-Agent 헤더값 : ${userAgent}</p>`);

    //PHP : $_GET['userid']
    const userid = req.query.userid;
    resp.write(`<p>아이디 : ${userid}</p>`);

    resp.end(); // write로 생성한 body 전송
}).listen(3000, ()=>{
    console.log('3000번 포트로 서버 실행중...');
})