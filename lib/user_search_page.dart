import 'package:flutter/material.dart';
import 'package:matrixapp/login_obj.dart';
import 'package:matrixapp/motor.dart';
import 'package:matrixapp/user_search_obj.dart';

class UserSearchPage extends StatefulWidget {
  final LoginObj me;
  UserSearchPage(this.me);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  List<Results> results = [];
  String roomName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            autocorrect: false,
            decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: "Bir kullanıcı adı girin"),
            onChanged: (text) async {
              var list = await Motor().userSearch(widget.me.accessToken, text);
              setState(() {
                results = list;
              });
            },
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                results.length,
                (i) {
                  return ListTile(
                    title: Text(results[i].displayName),
                    onTap: () => createRoomDialog(results[i].userId),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  createRoomDialog(String userID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Yeni bir sohbet başlatmak için konu giriniz"),
          content: TextField(
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            onChanged: (text) {
              roomName = text;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "İPTAL",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("OLUŞTUR"),
              onPressed: () async {
                await Motor().createRoom(widget.me.accessToken, roomName, userID);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
