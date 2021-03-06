import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/foundation.dart';
import 'dart:io';
//import 'dart:async';

class Picker {
  //dynamic _pickImageError;
  bool isVideo = false;

  // ignore: unused_field
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  // ignore: unused_element

  pickMultipleImage() async {
    double maxWidth = 500;
    double maxHeight = 500;
    int quality = 200;

    try {
      List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          ) ??
          [];
      //imageFileList.addAll(pickedFileList);
      List<File> fileList = [];
      for (var file in pickedFileList) {
        fileList.add(File(file.path));
      }
      //print("File list : $fileList");
      return fileList;
      //setState(() {});
    } catch (e) {
      //_pickImageError = e;
      print("ERROR: $e");
      //setState(() {});
    }
  }

  pickSingleImage() async {
    double maxWidth = 500;
    double maxHeight = 500;
    int quality = 200;

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );
      List<File> file = [];
      file.add(File(pickedFile!.path));
      //_imageFile = pickedFile;
      return file;
    } catch (e) {
      // _pickImageError = e;
      print("ERROR: $e");
    }
  }
}
