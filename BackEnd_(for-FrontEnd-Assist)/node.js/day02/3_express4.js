const express = require('express');
const bp = require('body-parser'); // 'post'방식으로 날라오는 데이터를 받기 위해 필요
const app = express();

app.use(bp.urlencoded({extended:false})); 

app.use((req,resp)=>{
    const userid = req.body.userid;
    const userpw = req.body.userpw;

    console.log(`userid : ${userid} / userpw : ${userpw}`);
    resp.writeHead(200, {'content-type':'text/html;charset=utf-8'});
    resp.write('<h2>익스프레스 서버에서 응답한 메세지입니다.</h2>');
    resp.write(`<p>userid : ${userid}</p>`);
    resp.write(`<p>userpw : ${userpw}</p>`);
    resp.end();
}).listen(3000, ()=>{
    console.log('3000번 포트로 서버 실행중...');
})