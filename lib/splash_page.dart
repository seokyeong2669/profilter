import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:profilter/camera_page.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3000));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        // MaterialPageRoute(
        //     builder: (context) => HomePage(
        //           camera: firstCamera,
        //         )),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Center(
            // child: Image.asset('assets/profilter_logo.png'),
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: IconButton(
                icon: Image.asset('assets/profilter_logo.png'),
                iconSize: 700,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            // Container(
            //   // width: 1000,
            //   // height: 1000,
            //   margin: EdgeInsets.only(bottom: 50),
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.white.withOpacity(0),
            //       border: Border.all(
            //         color: Colors.white,
            //         width: 0.5,
            //       )),
            // )
          ],
        )),
      ),
    );
  }
}
