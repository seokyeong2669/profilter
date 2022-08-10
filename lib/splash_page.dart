// import 'package:camera/camera.dart';
// import 'package:camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:profilter/camera.dart';
import 'package:profilter/home_page2.dart';

// import 'package:profilter/camera_page.dart';

// import 'camera.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({Key? key}) : super(key: key);
  const SplashPage({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<SplashPage> createState() => _SplashPageState();
}
// Future<void> main() async {
//   // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
//   final cameras = await availableCameras();

//   // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // 적절한 카메라를 TakePictureScreen 위젯에게 전달합니다.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          // MaterialPageRoute(
          //     builder: (context) => HomePage(
          //           camera: firstCamera,
          //         )),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Image.asset(
          'assets/profilter_logo.png',
          scale: 3,
        ),
      ),
    );
  }
}
