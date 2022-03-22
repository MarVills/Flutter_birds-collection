//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
// ignore: unused_import
import 'dart:io' as io;
//import 'package:path/path.dart';

//import '../services/picker.dart';

class IQuery {
  // final List imageList;

  // IQuery(this.imageList);
  String id = "";
  //final db = FirebaseFirestore.instance;
  final dbs = FirebaseStorage.instance;

  Future<bool> pushf(List<File> imageList) async {
    //var dir = folder.length == 0 ? folder : "/" + folder + "/";
    for (var item in imageList) {
      var fsr = dbs.ref().child("birds");
      var task = fsr.putFile(item);
      await task.whenComplete(() => null);
    }
    return true;
  }

  Future<List<String>> uploadFiles(List<File> imageList) async {
    //List<File> _images = imageList;
    var imageUrls =
        await Future.wait(imageList.map((_image) => uploadImageFile(_image)));
    print("image length: ${imageList.length}");
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadImageFile(File _image) async {
    FirebaseStorage fbStorage = FirebaseStorage.instance;
    Reference ref = fbStorage.ref().child("/birds/");
    UploadTask uploadTask = ref.putFile(_image);
    await uploadTask.whenComplete(() => null);

    return await ref.getDownloadURL();
  }

  function() {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
  }

  Future<void> uploadExample() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    // ...
    await uploadFile(filePath);
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('birds/file-to-upload.png')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print("Error: $e");
    }
  }

  /*
  Future uploadImageToFirebase(BuildContext context) async {
    // List imageList = await Picker().onImageButtonPressed();
    for (var item in imageList) {
      String fileName = "image"; //basename(_imageFile!.path);
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('birds')
          .child('/$fileName');

      final metadata = firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': fileName});
      firebase_storage.UploadTask uploadTask;
      //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      uploadTask = ref.putFile(io.File(item!.path), metadata);

      firebase_storage.UploadTask task = await Future.value(uploadTask);
      Future.value(uploadTask)
          .then((value) => {print("Upload file path ${value.ref.fullPath}")})
          .onError((error, stackTrace) =>
              {print("Upload file path error ${error.toString()} ")});
    }
  }
  */
}
