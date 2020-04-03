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
                      onTap: () {
                        print(results[i].userId);
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
