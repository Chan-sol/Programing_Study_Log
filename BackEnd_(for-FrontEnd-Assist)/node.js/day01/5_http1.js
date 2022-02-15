const http = require('http');
// req : 사용자 요청에 대한 정보
// resp : 사용자에게 응답을 하기 위한 정보
const server = http.createServer((req, resp)=>{
    // 요청을 받았을 때 실행되는 부분  
    resp.writeHead(200, {'content-type':'text/html'}); // 'text/html' 파일로 응답하겠다
    resp.end(`<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HTTP 모듈 테스트</title>
    </head>
    <body>
        <h2>HTTP 모듈 테스트</h2>
        <p>처음으로 실행하는 node.js http 서버</p>
    </body>
    </html>`);
})

server.listen(3000, ()=>{
    // localhost:3000
    console.log(`3000번 포트로 서버 실행중...`);
})