import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clonecoding/items/instagram_content_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ContentList extends StatefulWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/instagramLogo.png',
          width: 130,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
            ),
            child: InkWell(
              onTap: () async {
                if (!await Permission.photos.request().isGranted) {
                  return;
                }

                final ImagePicker _picker = ImagePicker();
                // Pick an image, ? -> nullable
                final PickedFile? image =
                    await _picker.getImage(source: ImageSource.gallery);

                if (image == null) {
                  // 사용자가 아무것도 안 골랐을 때의 예외 처리
                  return;
                }

                setState(() {
                  items.add(Image.file(
                    File(image.path),
                    width: 50,
                    height: 50,
                  ));
                });
              },
              child: Image.asset(
                'images/plus.png',
                width: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
            ),
            child: Image.asset(
              'images/heart.png',
              width: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
            ),
            child: Image.asset(
              'images/send.png',
              width: 25,
            ),
          ),
        ],
      ),
      body: ListView(children: [
        Row(
          children: items,
        ),
        InstagramContentItem(
          userName: "chan-ssol",
          profileImg: "images/profile.png",
          contentImg: "images/facebookLogo.png",
          randomLiker: 'sbn_pnk',
          count: 20,
          content: "페이스북ㅎ",
          date: 1,
        ),
        InstagramContentItem(
          userName: "insaengmusang__",
          profileImg: "images/profile.png",
          contentImg: "images/facebookLogo.png",
          randomLiker: 'goooong_juu',
          count: 25,
          content: "페이스북ㅋ",
          date: 2,
        ),
        InstagramContentItem(
          userName: "goblin_jelly",
          profileImg: "images/profile.png",
          contentImg: "images/facebookLogo.png",
          randomLiker: 'sbn_pnk',
          count: 30,
          content: "페이스북ㅠ",
          date: 4,
        ),
      ]),
    );
  }
}
