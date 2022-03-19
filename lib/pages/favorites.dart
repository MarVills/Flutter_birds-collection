import 'package:flutter/material.dart';
//import 'data.dart';
import 'view_page.dart';
import 'package:like_button/like_button.dart';

class FavoritesPage extends StatefulWidget {
  final favList;
  FavoritesPage({Key? key, required this.favList}) : super(key: key);

  final findBird = TextEditingController();

  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  List favoritesList = [];
  @override
  void initState() {
    super.initState();
    favoritesList = widget.favList;
  }

  List getList() {
    List finalList = favoritesList.toSet().toList();
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: getList().length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewPage(
                      image: getList()[index].image,
                      name: getList()[index].name,
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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(getList()[index].image),
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
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget likeButton() {
  var buttonSize = 20.0;
  return LikeButton(
    size: buttonSize,
    circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
    bubblesColor: BubblesColor(
      dotPrimaryColor: Color(0xff33b5e5),
      dotSecondaryColor: Color(0xff0099cc),
    ),
    likeBuilder: (bool isLiked) {
      return Icon(
        Icons.favorite,
        color: isLiked ? Colors.deepPurpleAccent : Colors.grey[700],
        size: buttonSize,
      );
    },
  );
}
