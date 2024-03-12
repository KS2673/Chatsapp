import 'package:chatting_app_flutter/Widgets.dart';
import 'package:chatting_app_flutter/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  // const Search({Key? key, required this.userName}) : super(key: key);

  // final String userName;

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();
  late QuerySnapshot searchSnapshot;

  initStateSearch() {
    databaseMethods
        .getuserbytheusername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  /// crerate chatroom,send user to conversation screen
  ///
  createChatpageandStartConversation() {}

  Widget SearchList() {
    if (searchSnapshot != null) {
      return ListView.builder(
          itemCount: searchSnapshot.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, Index) {
            return SearchTile(
                username: searchSnapshot.docs[Index].get("name"),
                useremail: searchSnapshot.docs[Index].get("email"));
          });
    } else {
      return SearchList();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: SearchController(),
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: "Search usernames...",
                        hintStyle: TextStyle(color: Colors.blueAccent),
                        border: InputBorder.none),
                  )),
                  GestureDetector(
                    onTap: () {
                      initStateSearch();
                      //databaseMethods.getuserbytheusername(searchTextEditingController.).
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0x36fffffff), Color(0x0fffffff)]),
                          borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.all(12),
                      child: Icon(Icons.search_outlined),
                    ),
                  )
                ],
              ),
            ),
            //SearchList()
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatefulWidget {
  final String username;
  final String useremail;

  SearchTile({required this.username, required this.useremail});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: SimpleTextStyle(),
              ),
              Text(
                useremail,
                style: SimpleTextStyle(),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  child: Text("Messagae"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
