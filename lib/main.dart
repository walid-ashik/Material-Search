import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Search',
      debugShowCheckedModeBanner: false,
      home: new MaterialSearch(),
    );
  }
}

class MaterialSearch extends StatefulWidget {
  @override
  _MaterialSearchState createState() => _MaterialSearchState();
}

class _MaterialSearchState extends State<MaterialSearch> {
  String queryText = '-';
  bool isSearchViewClicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMaterialSearchBar(),
      body: Center(
        child: Text('$queryText'),
      ),
    );
  }

  Widget getMaterialSearchBar() {
    return AppBar(
      backgroundColor: Colors.deepOrange,
      title: isSearchViewClicked
          ? TextField(
              style: TextStyle(color: Colors.white),
              onSubmitted: (value) {
                isSearchViewClicked = false;

                setState(() {
                  queryText = value;
                });
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white70),
                icon: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearchViewClicked = false;
                    });
                  },
                ),
              ),
              autofocus: true,
              cursorColor: Colors.black,
            )
          : Text(
              'Material Search',
              style: TextStyle(color: Colors.white),
            ),
      actions: <Widget>[
        IconButton(
          icon: isSearchViewClicked
              ? Icon(
                  Icons.close,
                  color: Colors.white,
                )
              : Icon(
                  Icons.search,
                  color: Colors.white,
                ),
          onPressed: () {
            //show search bar
            setState(() {
              if (isSearchViewClicked) {
                isSearchViewClicked = false;
              } else {
                isSearchViewClicked = true;
              }
            });
          },
        )
      ],
    );
  }
}
