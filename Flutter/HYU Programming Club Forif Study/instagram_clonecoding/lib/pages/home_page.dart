import 'package:flutter/material.dart';
import 'content_list_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // page를 바꾸기 위함
  int selectedIndex = 0;

// bottom navigation bar 로 보여질 화면들
  List<Widget> pages = [
    ContentList(),
    Visibility(
        visible: true,
        child: Center(
          child: Text("검색화면"),
        )),
    Center(
      child: Text("비디오화면"),
    ),
    Center(
      child: Text("쇼핑화면"),
    ),
    Center(
      child: Text("개인피드화면"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        // selected index
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home.png',
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/search.png',
                width: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/video.png',
                width: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/bag.png',
                width: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/profile.png',
                width: 25,
              ),
              label: ""),
        ],
      ),
    );
  }
}
