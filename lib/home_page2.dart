import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'artist_list.dart';
import 'filter_service.dart';
import 'artist_profile.dart';

class Camera2 extends StatefulWidget {
  @override
  _Camera2State createState() => _Camera2State();
}

class _Camera2State extends State<Camera2> {
  Timer? _timer;
  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;
  String? artist_name = null;
  String? position_name = null;
  bool isCapture = false;
  File? captureImage;
  //리스트뷰 스크롤 포인트 detect
  ScrollController _controller = ScrollController();
  bool button_color = true; //셔터와 stop 아이콘 색상변경을 위한 변수
  String filter_type = 'f1'; // 필터 변경을 위한 변수
  bool pop_up = true; //작가 목록 팝업
  bool stop_ch = true;
  double extentAfter = 551;
  String filterName = '';

  void _onScrollEvent() {
    extentAfter = _controller.position.extentAfter;
    print("Extent after: $extentAfter");
    if (extentAfter < 635) {
      setState(() {
        button_color = false;
      });
    } else {
      setState(() {
        button_color = true;
      });
    }

    // if (stop_ch = true) {
    //   setState(() {
    //     extentAfter = 254.0;
    //     print(extentAfter);
    //   });
    // }

    if (extentAfter < 140) {
      setState(() {
        filter_type = 'f9';
      });
    } else if (extentAfter < 200) {
      setState(() {
        filter_type = 'f8';
      });
    } else if (extentAfter < 260) {
      setState(() {
        filter_type = 'f7';
      });
    } else if (extentAfter < 320) {
      setState(() {
        filter_type = 'f6';
      });
    } else if (extentAfter < 380) {
      setState(() {
        filter_type = 'f5';
      });
    } else if (extentAfter < 440) {
      setState(() {
        filter_type = 'f4';
      });
    } else if (extentAfter < 500) {
      setState(() {
        filter_type = 'f3';
      });
    } else if (extentAfter < 560) {
      setState(() {
        filter_type = 'f2';
      });
    } else if (extentAfter < 620) {
      setState(() {
        filter_type = 'f1';
        stop_ch = false;
      });
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    _controller.addListener(_onScrollEvent);
    print(extentAfter);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    _cameraController!.dispose();
    super.dispose();
  }

  void pop() {}

  List<Color> _color = [
    Colors.green[400]!,
    Colors.green[400]!,
    Colors.green[400]!
  ];
  void _toggleColor(_index) {
    setState(() {
      if (_color[_index] == Colors.white) {
        _color[_index] = Colors.green[400]!;
      } else {
        _color[_index] = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "CA",
        "assetName": 'assets/s1.png',
        "artist": 'Callyourname',
        "position": 'Newyork',
      },
      {
        "category": "BO",
        "assetName": "assets/s2.png",
        "artist": 'Bobbybrew06',
        "position": 'Warmcafe',
      },
      {
        "category": "YG",
        "assetName": "assets/s3.png",
        "artist": 'Younggreen4',
        "position": 'Cozygreen',
      },
      {
        "category": "NN",
        "assetName": "assets/s4.png",
        "artist": 'Neonnoodle',
        "position": 'Pinkmacaron',
      },
      {
        "category": "VS",
        "assetName": "assets/s5.png",
        "artist": 'ViVidsecond2',
        "position": 'Sweetgrape',
      },
      {
        "category": "SG",
        "assetName": "assets/s6.png",
        "artist": 'Standardgrey',
        "position": 'Stonisland',
      },
      {
        "category": "OW",
        "assetName": "assets/s7.png",
        "artist": 'Orientalwind',
        "position": 'Marshmallow',
      },
      {
        "category": "MP",
        "assetName": "assets/s8.png",
        "artist": 'MapleSyrup',
        "position": 'Naturalbeige',
      },
      {
        "category": "LO",
        "assetName": "assets/s9.png",
        "artist": 'Lollipop',
        "position": 'Cottoncandy',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
      {
        "category": "",
        "assetName": 'assets/blank.png',
        "artist": '',
        "position": '',
      },
    ];

    Size size = MediaQuery.of(context).size;
    return Consumer<FilterService>(
      builder: (context, authService, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            // appBar: AppBar(
            //   title: Text("Camera"),
            //   centerTitle: true,
            // ),
            // backgroundColor: Colors.black,
            body: Column(
              children: [
                Container(
                  height: 110,
                  padding: EdgeInsets.only(bottom: 35),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: new Image.asset(
                          'assets/flash.png',
                          scale: 2,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(bottom: 1),
                        onPressed: () {
                          print('필터보기');
                        },
                      ),
                      IconButton(
                        icon: new Image.asset(
                          'assets/1_1.png',
                          scale: 3.8,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(bottom: 1),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: new Image.asset(
                          'assets/Timer.png',
                          scale: 3.8,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(bottom: 1),
                        onPressed: () {
                          print('필터보기');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.width,
                  child: FutureBuilder<void>(
                    future: _initCameraControllerFuture,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            /// 촬영 된 이미지 출력
                            Container(
                              child: Image.asset(
                                'assets/p1.png',
                              ),
                            )
                          ],
                        );
                      } else {
                        return Stack(alignment: Alignment.center, children: [
                          Image.asset(
                            'assets/Image1.png',
                            width: size.width,
                            height: size.width,
                            fit: BoxFit.cover,
                          ),
                          Visibility(
                            child: Positioned(
                              child: Image.asset(
                                'assets/$filter_type.png',
                                width: size.width,
                                height: size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            visible: button_color ? false : true,
                          ),
                        ]
                            // width: size.width,
                            // height: size.width,
                            );
                      }
                    },
                  ),
                ),
                filterName == ''
                    ? Container(
                        height: 86,
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 18, bottom: 18),
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: IconButton(
                                // ignore: prefer_const_constructors
                                icon: Icon(
                                  Icons.favorite,
                                  color: Color.fromRGBO(247, 0, 38, 1),
                                  size: 25,
                                ),
                                onPressed: () {
                                  print('필터보기');
                                },
                              ),
                            ),
                            Container(
                                child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, primary: Colors.grey[300]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      '@$artist_name',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    height: 3,
                                  ),
                                  Center(
                                    child: Text(
                                      '#$position_name',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: IconButton(
                                // ignore: prefer_const_constructors
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setState(() {
                                    filterName = '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 35,
                      right: 311,
                      child: IconButton(
                        icon: new Image.asset(
                          'assets/stop.png',
                          scale: 1.9,
                          color: button_color
                              ? Color.fromRGBO(247, 0, 38, 1)
                              : Colors.white,
                        ),
                        padding: EdgeInsets.only(bottom: 1),
                        onPressed: () {
                          // stop_ch = true;
                          // print('dd');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Camera2()),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 85,
                        margin: EdgeInsets.only(left: 85, bottom: 45),
                        // padding: EdgeInsets.only(top: 15),
                        child: ListView.builder(
                            controller: _controller,
                            itemCount: dataList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // return Text(dataList[index]['category']);
                              return InkWell(
                                onTap: () {
                                  return this._toggleColor(index);
                                },
                                child: Card(
                                  color: Colors.black,
                                  margin: const EdgeInsets.only(
                                      top: 0, bottom: 0, left: 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: GestureDetector(
                                      child: Container(
                                        width: 60,
                                        // height: 0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.1),
                                                  BlendMode.color),
                                              image: AssetImage(
                                                dataList[index]['assetName'],
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            dataList[index]['category'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      onLongPress: () {
                                        _timer = Timer(
                                            Duration(milliseconds: 5000), () {
                                          // time duration
                                          setState(() {
                                            filterName = 'filter';
                                            artist_name =
                                                dataList[index]['artist'];
                                            position_name =
                                                dataList[index]['position'];
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        width: 115,
                        color: Colors.black,
                        margin: EdgeInsets.only(bottom: 45),
                        child: ElevatedButton(
                          child: const Text(
                            '1x',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(247, 0, 38, 1),
                            ),
                          ),
                          onPressed: () {
                            // shutter = !shutter;
                            // print(shutter);
                            // pressed = !true;
                            // print(pressed);
                            // setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            side: BorderSide(
                              width: 4,
                              color: button_color
                                  ? Colors.white
                                  : Color.fromRGBO(247, 0, 38, 1),
                              // color: shutter ? Colors.white : Colors.red,
                            ),
                            fixedSize: const Size(84, 84),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 110, left: 29),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[800]),
                            // color: Colors.green,
                            child: IconButton(
                              // ignore: prefer_const_constructors
                              icon: new Image.asset(
                                'assets/album.png',
                                height: 30,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(bottom: 1),

                              onPressed: () {
                                // print(extentAfter);
                              },
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            height: 40,
                            margin: EdgeInsets.only(top: 120, right: 10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtistList()),
                                );
                              },
                              child: Text(
                                '작가 보기',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 110, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey[800]),
                            // color: Colors.green,
                            child: IconButton(
                              // ignore: prefer_const_constructors
                              icon: new Image.asset(
                                'assets/Refresh.png',
                                height: 20,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 2),
                              onPressed: () async {
                                /// 후면 카메라 <-> 전면 카메라 변경
                                cameraIndex = cameraIndex == 0 ? 1 : 0;
                                // await _initCamera();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
