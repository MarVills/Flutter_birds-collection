import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'data.dart';
import 'search_page.dart';

class ViewPage extends StatefulWidget {
  final image;
  final name;
  final index;

  ViewPage({
    Key? key,
    required this.image,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  ViewPageState createState() => ViewPageState();
}

class ViewPageState extends State<ViewPage> {
  String image = "";
  String name = "";
  int indx = 0;
  @override
  void initState() {
    super.initState();
    image = widget.image;
    name = widget.name;
    indx = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    String label = "Scientific name: ";
    String sciName = getData()[indx]["sci_name"].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird details'),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
            child: IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SearchPage(),
                ),
              ),
              icon: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.0,
              alignment: Alignment.topCenter,
              child: Image.asset(image),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                label + sciName,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "SansSerif",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                child: Text(
                  getData()[indx]["description"].toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "SansSerif",
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
