import 'package:flutter/material.dart';

class InstagramContentItem extends StatefulWidget {
  final String userName, profileImg, contentImg, randomLiker, content;
  final int count, date;

  const InstagramContentItem(
      // InstagramContentItem 인스턴스를 만들 때 required 매개변수들은 반드시 필요함
      {Key? key,
      required this.userName,
      required this.profileImg,
      required this.content,
      required this.randomLiker,
      required this.count,
      required this.contentImg,
      required this.date})
      : super(key: key);

  @override
  _InstagramContentItemState createState() => _InstagramContentItemState();
}

class _InstagramContentItemState extends State<InstagramContentItem> {
  bool isClickedFav = false; // 하트 눌렀는지

  Widget userInfo() {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 10.0,
              ),
              child: Image.asset(
                widget.profileImg,
                width: 35,
              ),
            ),
            Text(
              widget.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  )),
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: 30,
                          height: 3,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            // 핸드폰 기종마다 크기가 다름 -> overflow가 생김
                            // 반응형 -> 핸드폰 크기마다 박스 크기가 달라지게 하기
                            // 박스 크기는 0.28 * 3 = 0.84, 공간: 0.04 * 2, 0.08 남음, 맨 왼쪽 : 0.04
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                    Text(
                                      "공유",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 100,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          // color: Colors.black,
                                          size: 30,
                                        )),
                                    Text(
                                      "링크",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 100,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.report,
                                          color: Colors.red,
                                          size: 30,
                                        )),
                                    Text(
                                      "신고",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 100,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "이 게시물이 표시되는 이유",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 75,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "숨기기",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 75,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 1,
                          color: Colors.grey[400],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "팔로우 취소",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 75,
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            },
            child: Image.asset(
              'images/etc.png',
              width: 20,
            ),
          ),
        ), // 전달인자로 받은 userName
      ],
    );
  }

  Widget imageArea() {
    return Image.asset(widget.contentImg);
  }

  Widget iconArea() {
    return Stack(
      children: [
        Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
                IconButton(
                    onPressed: () => {
                          setState(() {
                            isClickedFav = !isClickedFav;
                          })
                        },
                    icon: Icon(
                      isClickedFav ? Icons.favorite : Icons.favorite_border,
                      color: isClickedFav ? Colors.red : Colors.black,
                      size: 30,
                    )),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'images/send.png',
                  width: 27,
                )),
            SizedBox(
              width: 250,
            ),
            Image.asset(
              'images/bookmark.png',
              width: 27,
            ),
          ],
        ),
      ],
    );
  }

  Widget likeArea() {
    return Visibility(
      visible: isClickedFav,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Text(
            widget.randomLiker.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '님 외 ',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            widget.count.toString() + '명',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '이 좋아합니다',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget contentArea() {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Text(
          widget.userName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.content,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget dateArea() {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Text(
          widget.date.toString() + '일 전',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      userInfo(),
      SizedBox(height: 10),
      imageArea(),
      SizedBox(height: 10),
      iconArea(),
      SizedBox(height: 10),
      likeArea(),
      SizedBox(height: 10),
      contentArea(),
      SizedBox(height: 12),
      dateArea(),
      SizedBox(height: 20),
    ]);
  }
}
