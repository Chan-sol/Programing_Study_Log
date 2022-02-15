const fs = require('fs');
const http = require('http');

http.createServer((req, resp)=>{
  // 요청을 받았을 때 실행되는 부분
  fs.readFile('./test.html', 'utf-8', (err, data)=>{
    if(err){
        console.log(err);
    } else {
      resp.writeHead(200, {'content-type':'text/html'});
      resp.end(data);  
    }
  })
}).listen(3010, ()=>{
    // localhost: 3010
    console.log(`3010번 포트로 서버 실행중...`);
})