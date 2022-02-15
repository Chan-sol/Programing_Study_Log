// require() : 다른 곳에 있는 모듈을 불러오는 함수
const fs = require("fs");

// readFile('파일경로', '인코딩방식', 함수)
fs.readFile('./text1.txt', 'utf-8', (err, data)=>{
    // err : 파일 읽기 실패 시 에러에 대한 무언가가 담김
    if(err){
        console.log(err);
    }
    else {
        console.log("< 비동기식으로 파일 읽기 >\n" + data + "\n");
    }
})

const text = fs.readFileSync('./text1.txt', 'utf-8');
console.log("< 동기식으로 파일 읽기 >\n" + text + "\n");

// 파일 여는데 시간이 걸리니 비동기식 파일을 열면서 지나갔다가
// 동기식 먼저 처리하고 다시 돌아와서 콜백함수로 결과 보여줌