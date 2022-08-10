import 'dart:io';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraExample extends StatefulWidget {
  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;

  bool isCapture = false;
  File? captureImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _cameraController =
        new CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    _initCameraControllerFuture = _cameraController!.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

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
        "category": "SO",
        "assetName": 'assets/s1.png',
      },
      {
        "category": "PK",
        "assetName": "assets/s2.png",
      },
      {
        "category": "FH",
        "assetName": "assets/s3.png",
      },
      {
        "category": "AR",
        "assetName": "assets/s4.png",
      },
      {
        "category": "OW",
        "assetName": "assets/s5.png",
      },
      {
        "category": "NC",
        "assetName": "assets/s9.png",
      },
      {
        "category": "MP",
        "assetName": "assets/s6.png",
      },
      {
        "category": "LO",
        "assetName": "assets/s7.png",
      },
      {
        "category": "KP",
        "assetName": "assets/s8.png",
      },
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text("Camera"),
      //   centerTitle: true,
      // ),
      // backgroundColor: Colors.black,
      body: isCapture
          ? Column(
              children: [
                /// 촬영 된 이미지 출력
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
                    width: size.width,
                    height: size.width,
                    child: ClipRect(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: SizedBox(
                          width: size.width,
                          child: AspectRatio(
                            aspectRatio:
                                1 / _cameraController!.value.aspectRatio,
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: MemoryImage(
                                    captureImage!.readAsBytesSync()),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Flexible(
                //   flex: 2,
                //   fit: FlexFit.tight,
                //   child: InkWell(
                //     onTap: () {
                //       /// 재촬영 선택시 카메라 삭제 및 상태 변경
                //       captureImage!.delete();
                //       captureImage = null;
                //       setState(() {
                //         isCapture = false;
                //       });
                //     },
                //     child: Container(
                //       width: double.infinity,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.arrow_back,
                //             color: Colors.white,
                //           ),
                //           SizedBox(height: 16.0),
                //           Text(
                //             "다시 찍기",
                //             style: TextStyle(
                //                 fontSize: 16.0,
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    // padding: EdgeInsets.only(bottom: 10),
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
                          padding: EdgeInsets.only(top: 10),
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
                          padding: EdgeInsets.only(top: 10),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: new Image.asset(
                            'assets/Timer.png',
                            scale: 3.8,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          onPressed: () {
                            print('필터보기');
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: FutureBuilder<void>(
                      future: _initCameraControllerFuture,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            width: size.width,
                            height: size.width,
                            child: ClipRect(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: SizedBox(
                                  width: size.width,
                                  height: size.width,
                                  child: AspectRatio(
                                      aspectRatio: 1 /
                                          _cameraController!.value.aspectRatio,
                                      child: CameraPreview(_cameraController!)),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Expanded(
                    // flex: 2,
                    child: Container(
                      // alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 42,
                            right: 327,
                            child: IconButton(
                              icon: new Image.asset(
                                'assets/stop.png',
                                scale: 1.9,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(bottom: 1),
                              onPressed: () {
                                print('필터보기');
                              },
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 80,
                              margin: EdgeInsets.only(left: 65, bottom: 35),
                              // padding: EdgeInsets.only(top: 15),
                              child: ListView.builder(
                                  itemCount: dataList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    // return Text(dataList[index]['category']);
                                    return InkWell(
                                      onTap: () {
                                        return this._toggleColor(index);
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.only(
                                            top: 0, bottom: 0, left: 10),
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Container(
                                            width: 50,
                                            // height: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(0.1),
                                                      BlendMode.darken),
                                                  image: AssetImage(
                                                      dataList[index]
                                                          ['assetName']),
                                                  fit: BoxFit.cover),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                dataList[index]['category'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                await _cameraController!
                                    .takePicture()
                                    .then((value) {
                                  captureImage = File(value.path);
                                });

                                /// 화면 상태 변경 및 이미지 저장
                                setState(() {
                                  isCapture = true;
                                });
                              } catch (e) {
                                print("$e");
                              }
                            },
                            child: Positioned(
                              child: Container(
                                width: 110,
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
                                      color: Color.fromRGBO(247, 0, 38, 1),
                                      // color: shutter ? Colors.white : Colors.red,
                                    ),
                                    fixedSize: const Size(90, 90),
                                    shape: const CircleBorder(),
                                  ),
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
                                  margin: EdgeInsets.only(top: 110, left: 15),
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
                                      print('필터보기');
                                    },
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  height: 20,
                                  margin: EdgeInsets.only(
                                    top: 120,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '작가 보기',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 110, right: 15),
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
                                      await _initCamera();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
