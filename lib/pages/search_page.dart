import 'package:flutter/material.dart';
import '../data/data.dart';
import 'view_page.dart';
//import 'data.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  List<String> getBirdList() {
    List<String> birdCollections = [];
    for (var item in items) {
      birdCollections.add(item.name);
    }
    return birdCollections;
  }

  final findBird = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool searchOnList = true;
    searchBird() {
      List birdList = getBirdList();
      for (var bird in birdList) {
        if (bird == findBird.text) {
          searchOnList = true;
          int index =
              birdList.indexWhere((element) => element == findBird.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ViewPage(
                image: items[index].image,
                name: items[index].name,
                index: index,
              );
            }),
          );
          break;
        } else {
          searchOnList = false;
        }
      }
      if (!searchOnList) {
        showAlertDialog(context, findBird.text);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Birds"),
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: Image.asset('lib/assets/images/parrot.png'),
              ),
              Text(
                "Birdies",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 50,
                  fontFamily: "PoiretOne",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 5),
                child: TextField(
                  controller: findBird,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                      fillColor: Colors.white.withOpacity(0.5),
                      filled: true,
                      //prefixIcon: Icon(Icons.search),
                      suffixIcon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            searchBird();
                            findBird.clear();
                          },
                        ),
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String search) {
  Widget continueButton = TextButton(
    child: Text(
      "Ok",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("NOTE: $search does not exist! "),
    content: Text("You search something that is not in your bird collection"),
    actions: [
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
