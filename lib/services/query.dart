import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'dart:io';
// ignore: unused_import
import 'dart:io' as io;
//import 'package:path/path.dart';

//import '../services/picker.dart';

class IQuery {
  final List imageList;
  IQuery(this.imageList);
  String id = "";
  //final db = FirebaseFirestore.instance;
  final dbs = FirebaseStorage.instance;

  Future<bool> pushf() async {
    //var dir = folder.length == 0 ? folder : "/" + folder + "/";
    for (var item in imageList) {
      var fsr = dbs.ref().child("birds");
      var task = fsr.putFile(item);
      await task.whenComplete(() => null);
    }
    return true;
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
