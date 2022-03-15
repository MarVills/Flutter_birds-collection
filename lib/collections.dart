import 'package:flutter/material.dart';
import 'view_page.dart';
import 'search_page.dart';
import "data.dart";
import 'favorites.dart';

List favoritesList = [];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //print(favoritesList.length);
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
                image: //AssetImage(items[index].image),
                    DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(items[index].image),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  //Image.asset(items[index].image),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SearchPage(),
            ),
          );
        },
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }
}

Widget likeButton(BuildContext context, String image, String name) {
  return IconButton(
    icon: Icon(Icons.favorite),
    color: Colors.deepPurple,
    onPressed: () {
      showAlertDialog(context, image, name);
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
