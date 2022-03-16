import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:async';

class Picker extends StatefulWidget {
  Picker({Key? key}) : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return Text("Picker");
  }

  // ignore: unused_field
  dynamic _pickImageError;
  bool isVideo = false;

  //VideoPlayerController? _controller;
  //VideoPlayerController? _toBeDisposed;
  // ignore: unused_field
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  List<XFile> _imageFileList = [];

  //set _imageFile(XFile? value) {
  //_imageFileList = value == null ? null : <XFile>[value];
  //}
  // ignore: unused_element
  Widget _kIsWeb(int index) {
    if (kIsWeb) {
      return Image.network(_imageFileList[index].path);
    } else {
      return Image.file(File(_imageFileList[index].path));
    }
  }

  // ignore: unused_element
  Future<void> _onImageButtonPressed(ImageSource source,
      // ignore: unused_element
      {BuildContext? context,
      // ignore: unused_element
      bool isMultiImage = false}) async {
    double maxWidth = 200;
    double maxHeight = 200;
    int quality = 200;

    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          ) ??
          [];
      _imageFileList = pickedFileList;
      setState(() {});
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }
}
