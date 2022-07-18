import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'filter_service.dart';
// import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterService>(
      builder: (context, service, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Text('카메라'),
                ),
                showImage(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image!);
    }
  }

  Future getImage(ImageSourec) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
