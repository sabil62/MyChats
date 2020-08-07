import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('Search items'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(hintText: 'Search'),
                  )),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: null)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
