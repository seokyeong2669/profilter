import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filter_service.dart';

/// 홈 페이지
class ArtistList extends StatefulWidget {
  const ArtistList({Key? key}) : super(key: key);

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // void _toggleColor(check) {
    //   // bool check = false;
    //   setState(() {
    //     print(check);
    //   });
    // }
    bool check = true;
    List<Map<String, dynamic>> firstList = [
      {
        "images": 'assets/c1.png',
      },
      {
        "images": 'assets/c2.png',
      },
    ];

    List<Map<String, dynamic>> secondList = [
      {
        "images": 'assets/c3.png',
      },
      {
        "images": 'assets/c1.png',
      },
    ];

    List<Map<String, dynamic>> thirdList = [
      {
        "images": 'assets/c2.png',
      },
      {
        "images": 'assets/c3.png',
      },
    ];

    return Consumer<FilterService>(
      builder: (context, filterService, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 40, right: 15, left: 15),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.mic,
                          color: Colors.grey[500],
                        ),
                      ],
                    )),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 5),
                          // color: Colors.amber,
                          height: 250,
                          child: ListView.builder(
                            itemCount: firstList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool check = true;
                              return Card(
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 10),
                                child: Image(
                                  image: AssetImage(
                                    firstList[index]['images'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // color: Colors.amber,
                              height: 60,
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@Callyourname01',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('#Newyork)',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                  Text('뉴욕의 풍경을 담았습니다 :)',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70),
                              child: IconButton(
                                // ignore: prefer_const_constructors

                                padding: EdgeInsets.only(left: 2),
                                onPressed: () {
                                  // _toggleColor(check);

                                  setState(() {
                                    check = !check;
                                    print(check);
                                  });
                                },
                                icon: check
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(
                                        Icons.favorite_border,
                                      ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 5),
                          // color: Colors.amber,
                          height: 250,
                          child: ListView.builder(
                            itemCount: secondList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 10),
                                child: Image(
                                  image: AssetImage(
                                    secondList[index]['images'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // color: Colors.amber,
                              height: 60,
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@Bobbybrew06',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('#Warmcafe)',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                  Text('따뜻한 카페와 디저트 음식사진',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 60),
                              child: IconButton(
                                // ignore: prefer_const_constructors

                                padding: EdgeInsets.only(left: 2),
                                onPressed: () {
                                  // _toggleColor(check);

                                  setState(() {
                                    check = !check;
                                    print(check);
                                  });
                                },
                                icon: check
                                    ? Icon(Icons.favorite_border,
                                        color: Colors.black)
                                    : Icon(
                                        Icons.favorite,
                                      ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 5),
                          // color: Colors.amber,
                          height: 250,
                          child: ListView.builder(
                            itemCount: thirdList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 10),
                                child: Image(
                                  image: AssetImage(
                                    thirdList[index]['images'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // color: Colors.amber,
                              height: 60,
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@Neonnoodle',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('#Pinkmacaron)',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                  Text('사랑스러운 핑크 마카롱',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: IconButton(
                                // ignore: prefer_const_constructors

                                padding: EdgeInsets.only(left: 2),
                                onPressed: () {
                                  // _toggleColor(check);

                                  setState(() {
                                    check = !check;
                                    print(check);
                                  });
                                },
                                icon: check
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(
                                        Icons.favorite_border,
                                      ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
