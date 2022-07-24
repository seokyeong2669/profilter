import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'filter_service.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  double appbar_h = 65;
  bool status = false;
  bool pressed = true;
  // bool shutter = true;

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
        "category": "수제버거",
        "imgUrl": "https://i.ibb.co/pnZK1rz/burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl": "https://i.ibb.co/7KLJjJV/salad.jpg",
      },
      {
        "category": "한식",
        "imgUrl": "https://i.ibb.co/0V4RVK4/korean-food.jpg",
      },
      {
        "category": "디저트",
        "imgUrl": "https://i.ibb.co/HhGRhds/dessert.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/QdDtTvt/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl": "https://i.ibb.co/gt9npFZ/stir-fried-rice.jpg",
      },
    ];

    return Consumer<FilterService>(
      builder: (context, service, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 520,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Column(
                        //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   // crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 25),
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
                                      Icons.bookmark,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                    onPressed: () {
                                      print('필터보기');
                                    },
                                  ),
                                ),
                                Container(
                                  child: Text('Filtername\n@Username'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: IconButton(
                                    // ignore: prefer_const_constructors
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                    onPressed: () {
                                      print('필터보기');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   child: IconButton(
                        //     // ignore: prefer_const_constructors
                        //     icon: Icon(
                        //       Icons.clear,
                        //       color: Colors.black,
                        //       size: 28,
                        //     ),
                        //     onPressed: () {
                        //       print('필터보기');
                        //     },
                        //   ),
                        // ),
                        Positioned(
                          // left: 70,
                          // top: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              // color: Colors.green,
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
                                              top: 85, bottom: 95, left: 15),
                                          child: Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Container(
                                                width: 50,
                                                height: 1,
                                                // margin: EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                  // color: Colors.redAccent
                                                  //     .withOpacity(1),
                                                  image: DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.3),
                                                              BlendMode.darken),
                                                      image: NetworkImage(
                                                        dataList[index]
                                                            ['imgUrl'],
                                                        scale: 5,
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Text(
                                                      dataList[index]
                                                          ['category'],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ))),
                                          )),
                                    );
                                    // Image.network(dataList[index]['imgUrl']);
                                  }),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          child: Container(
                            child: ElevatedButton(
                              child: const Text(
                                '1x',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                // shutter = !shutter;
                                // print(shutter);
                                // pressed = !true;
                                print(pressed);
                                // setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                side: BorderSide(
                                  width: 4,
                                  color: Colors.white,
                                  // color: shutter ? Colors.white : Colors.red,
                                ),
                                fixedSize: const Size(90, 90),
                                shape: const CircleBorder(),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  right: 100,
                                ),
                                child: IconButton(
                                  // ignore: prefer_const_constructors
                                  icon: Icon(
                                    Icons.insert_photo,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    print('필터보기');
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0,
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
                                margin: EdgeInsets.only(left: 100),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.cached,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
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
      },
    );
  }
}
