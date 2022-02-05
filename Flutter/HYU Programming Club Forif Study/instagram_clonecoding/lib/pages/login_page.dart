import 'package:flutter/material.dart';
import 'package:instagram_clonecoding/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map loginData = {
    // 임시
    '3456': 'asdf',
    '5678': 'zxcv',
    '91011': 'qwer',
  };
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  Widget logoArea() {
    return Center(
      child: Image.asset(
        "images/instagramLogo.png",
        width: 200, // 비율이 유지가 됨
      ),
    );
  }

  Widget inputArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: TextField(
            controller: idController,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: '전화번호, 사용자 이름 또는 이메일',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              fillColor: Colors.grey[150],
              filled: true, // fillColor 사용할 때 이 코드 꼭 써야 함
            ),
          ),
          width: 350,
          height: 45,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextField(
            controller: pwController,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: '비밀번호',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              fillColor: Colors.grey[150],
              filled: true, // fillColor 사용할 때 이 코드 꼭 써야 함
            ),
          ),
          width: 350,
          height: 45,
        ),
        // TextField -> 둘러싸인 위젯의 크기만큼 확장이 됨
        SizedBox(
          height: 15,
        ),
        Text(
          "비밀번호를 잊으셨나요?",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget loginArea() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () async {
            if (idController.text == "") {
              print("아이디를 입력해주세요");
              return;
            }
            if (pwController.text == "") {
              print("비밀번호를 입력해주세요");
              return;
            }
            if (!loginData.containsKey(idController.text)) {
              print("아이디를 잘못 입력하셨습니다");
              return;
            }
            if (loginData[idController.text] != pwController.text) {
              print("비밀번호를 잘못 입력하셨습니다");
              return;
            }
            print("로그인 성공!");

            // shared preferences 얻기
            // 로그인 여부를 저장하기 위해 로그인 성공 후 데이터 저장
            final prefs = await SharedPreferences.getInstance();

            // 값 저장하기
            // 로그인 됨, 안됨 -> bool, false true
            prefs.setBool('loginData', true);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pages()));
          },
          child: Container(
            alignment: Alignment.center,
            width: 350,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.blue[300],
            ),
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // 구분선
              height: 1,
              width: 350,
              color: Colors.grey[300],
            ),
            Container(
                child: Center(child: Text("또는")),
                width: 80,
                color: Colors.white),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/facebookLogo.png",
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "facebook으로 로그인",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ],
    );
  }

  Widget signinArea() {
    return Column(
      children: [
        Container(
          height: 2,
          width: 350,
          color: Colors.grey[200],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("계정이 없으신가요?"),
            SizedBox(
              width: 5,
            ),
            Text(
              "가입하기",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [logoArea(), inputArea(), loginArea()],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            // right이랑 left 둘 다 0이면 가운데 정렬
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: signinArea(),
            ),
          ),
        ],
      ),
    );
  }
}
