import 'package:flutter/material.dart';

// 고양이 서비스
class FilterService extends ChangeNotifier {
  // 고양이 사진 담을 변수
  List<String> artistImages = [
    "assets/g1.png",
    "assets/g2.png",
    "assets/g3.png",
    "assets/g4.png",
    "assets/g5.png",
    "assets/g6.png"
  ];
}

// class Like {
//   bool isDone = true; // 완료 여부

//   Like(this.isDone); // 생성자
// }
