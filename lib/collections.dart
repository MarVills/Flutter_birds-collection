import 'package:flutter/material.dart';
//import 'view_page.dart';
//import 'search_page.dart';
import "data.dart";
import 'favorites.dart';
//import 'picker.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:async';

List favoritesList = [];

class CollectionPage extends StatefulWidget {
  CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
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

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(30, 5, 5, 5),
          child: Text(
            "Bird Collections",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: "PoiretOne",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
            child: Tooltip(
              message: 'My favorites',
              child: IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FavoritesPage(
                      favList: favoritesList,
                    ),
                  ),
                ),
                icon: Icon(Icons.favorite),
              ),
            ),
          )
        ],
      ),
      body: _imageFileList.isEmpty
          ? Container(
              child: Center(
                child: Text("No bird collectio yet"),
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 3,
              ),
              itemCount: _imageFileList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    viewImage(context, _kIsWeb(index));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Card(
                            child: _kIsWeb(index),
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.5),
                          width: MediaQuery.of(context).size.width / 3.0,
                          height: 20,
                          child: likeButton(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).push(
          //MaterialPageRoute(
          //builder: (_) => SearchPage(),
          // ),
          //);
          _onImageButtonPressed();
        },
        tooltip: 'Add collection',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _kIsWeb(int index) {
    if (kIsWeb) {
      return Image.network(_imageFileList[index].path);
    } else {
      return Image.file(File(_imageFileList[index].path));
    }
  }

  Future<void> _onImageButtonPressed() async {
    double maxWidth = 500;
    double maxHeight = 500;
    int quality = 200;

    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          ) ??
          [];
      _imageFileList.addAll(pickedFileList);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      setState(() {});
    }
  }
}

Widget likeButton(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.favorite),
    color: Colors.deepPurple,
    onPressed: () {
      //showAlertDialog(context, image, name);
    },
  );
}

viewImage(BuildContext context, Widget image) {
  Widget okButton = TextButton(
    child: Text(
      "Ok",
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    content: Container(
      child: image,
    ),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(BuildContext context, String image, String name) {
  Widget cancelButton = TextButton(
    child: Text(
      "No",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Yes",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    ),
    onPressed: () {
      favoritesList.add(PhotoItem(image, name));
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("NOTE: Do you want to add this on favorites? "),
    content: Text("Click \"Yes\" if you want to add."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


/*
_imageFileList.isEmpty
      ? 
      
      Container(
        child: Center(
          child: Text("No photos yet"),
       ),
      )
      : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _imageFileList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: _kIsWeb(index),
                  ),
                  Container(
                    color: Colors.white.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: 20,
                    child: likeButton(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
*/

/*
Container(
            child: Center(
              child: Text("No photos yet"),
            ),
          );
*/


/*
GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewPage(
                      image: items[index].image,
                      name: items[index].name,
                      index: index,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.3),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(items[index].image),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.white.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: 20,
                    child: likeButton(
                      context2,
                      items[index].image,
                      items[index].name,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
*/