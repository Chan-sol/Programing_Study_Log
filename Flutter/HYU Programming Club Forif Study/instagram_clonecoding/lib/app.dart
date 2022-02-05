import 'package:flutter/material.dart';
import 'package:instagram_clonecoding/pages.dart';
import 'package:instagram_clonecoding/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 데이터가 반환될 수도 있지만 에러가 반환될 수도 있음
            if (snapshot.hasError) {
              return Text("has error");
            } else {
              return snapshot.data!.getBool('loginData') ?? false
                  ? Pages()
                  : Login(); // nullable
            }
          } else {
            // getinstance 과정이 다 끝나지 않고 진행되고 있는 경우
            return CircularProgressIndicator();
          }
        });
  }
}
