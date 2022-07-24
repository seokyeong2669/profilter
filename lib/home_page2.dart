import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'filter_service.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

// class CirclePainter extends CustomPainter {
//   final _paint = Paint()
//     ..color = Colors.white
//     ..strokeWidth = 3
//     // Use [PaintingStyle.fill] if you want the circle to be filled.
//     ..style = PaintingStyle.stroke;

//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawOval(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       _paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class _HomePage2State extends State<HomePage2> {
  double appbar_h = 65;
  bool status = false;
  bool pressed = true;
  // bool shutter = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterService>(
      builder: (context, service, child) {
        return Scaffold(
          appBar: PreferredSize(
            // ignore: sort_child_properties_last
            child: AppBar(
              backgroundColor: Colors.black,
              title: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 40,
                ),
                onPressed: () {
                  pressed = !pressed;
                  print(pressed);
                  setState(() {
                    if (pressed == true) {
                      appbar_h = 100;
                    } else {
                      appbar_h = 65;
                    }
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.cached,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            preferredSize: Size.fromHeight(appbar_h),
          ),
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 520,
                  ),
                  Positioned(
                    bottom: 15,
                    child: FlutterSwitch(
                      activeColor: Color.fromARGB(255, 255, 47, 0),
                      width: 100.0,
                      height: 30.0,
                      toggleSize: 25.0,
                      value: status,
                      borderRadius: 20.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, right: 20),
                        child: Column(
                          children: [
                            IconButton(
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.format_list_bulleted,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print('작가보기');
                              },
                            ),
                            Text(
                              '작가보기',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 45,
                          // bottom: 40,
                        ),
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
                            pressed = !true;
                            print(pressed);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            side: BorderSide(
                              width: 3,
                              color: Colors.white,
                              // color: shutter ? Colors.white : Colors.red,
                            ),
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          left: 20,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
