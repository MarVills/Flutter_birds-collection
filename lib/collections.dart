// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
//import 'dart:async';

//import 'view_page.dart';
//import 'search_page.dart';
import 'data/data.dart';
import '../pages/favorites.dart';
import 'services/picker.dart';
import 'services/query.dart';

List favoritesList = [];

class CollectionPage extends StatefulWidget {
  CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<XFile> imageFileList = [];
  @override
  void initState() {
    super.initState();
    imageFileList;
  }

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
      body: imageFileList.isEmpty
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
              itemCount: imageFileList.length,
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
          getImageList();
          IQuery(imageFileList).pushf();
        },
        tooltip: 'Add collection',
        child: Icon(Icons.add),
      ),
    );
  }

  getImageList() async {
    imageFileList = await Picker().onImageButtonPressed();
    setState(() {});
  }

  Widget _kIsWeb(int index) {
    if (kIsWeb) {
      return Image.network(imageFileList[index].path);
    } else {
      return Image.file(File(imageFileList[index].path));
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
