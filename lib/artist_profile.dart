import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filter_service.dart';

/// 홈 페이지
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  // List<String> filterList = [
  //   "assets/s9.png",
  //   "assets/s9.png",
  //   "assets/s9.png",
  //   "assets/s9.png"
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterService>(
      builder: (context, filterService, child) {
        return SafeArea(
          child: Scaffold(
              body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 17),
                      child: Text(
                        '@Callyourname',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 40, right: 17),
                      child: Icon(Icons.more_horiz),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Image.asset(
                        'assets/circle.png',
                        scale: 1.2,
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      height: 73,
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#Newyork',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('뉴욕의 풍경을 담았습니다 :)',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text('Travel | camping | photography',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text('instagram @callyourname',
                              style: TextStyle(
                                fontSize: 12,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 13, left: 3),
                      width: 164,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text('북마크',
                              style: TextStyle(
                                fontSize: 13,
                              ))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13, right: 3),
                      width: 164,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(8)),
                      // color: Colors.grey,
                      child: Center(
                          child: Text('메세지',
                              style: TextStyle(
                                fontSize: 13,
                              ))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      child: Image.asset('assets/grid.png'),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        child: Image.asset(
                          'assets/tag.png',
                          color: Colors.grey[500],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 194,
                        // margin: EdgeInsets.only(top: 12, bottom: 12),
                        child: Image.asset(
                          'assets/bot.png',
                          color: Colors.black,
                        )),
                    Container(
                        width: 194,
                        margin: EdgeInsets.only(left: 2),
                        child: Image.asset(
                          'assets/bot.png',
                          color: Colors.grey[400],
                        )),
                  ],
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    children: List.generate(
                      6,
                      (index) {
                        String filterList = filterService.artistImages[index];
                        return Container(
                          child: Image.asset(filterList),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
