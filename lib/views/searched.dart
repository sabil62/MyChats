import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:MyChat/services/database.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextEditingController =
      new TextEditingController();

  //to access items from database in search
  DatabaseMethods databaseMethods = new DatabaseMethods();

  bool isSearchPressed = false;
  QuerySnapshot searchSnapshot;

  initiateSearch() async {
    databaseMethods.getUserName(searchTextEditingController.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget getSearchResult() {
    return searchSnapshot == null
        ? Container()
        : ListView.builder(
            shrinkWrap: true, //because we are using listview inside of column
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return SearchItems(
                username: searchSnapshot.documents[index].data["username"],
                email: searchSnapshot.documents[index].data["email"],
              );
            });
  }

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
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 16.2)),
                  )),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        initiateSearch();
                      })
                ],
              ),
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.white60,
                      blurRadius: 5)
                ]),
          ),
          getSearchResult()
        ],
      ),
    );
  }
}

class SearchItems extends StatelessWidget {
  final String username;
  final String email;
  SearchItems({this.username, this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                username,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[50]),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[100]),
              )
            ],
          )
        ],
      ),
    );
  }
}
