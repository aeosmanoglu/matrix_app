import 'package:flutter/material.dart';
import 'package:matrixapp/login_obj.dart';
import 'package:matrixapp/login_page.dart';
import 'package:matrixapp/motor.dart';
import 'package:matrixapp/user_search_page.dart';

class RoomsPage extends StatefulWidget {
  final LoginObj me;
  RoomsPage(this.me);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {

  Widget appBar() {
    return AppBar(
      title: Text("Mesajlar"),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(value: 0, child: Text("Çıkış Yap")),
          ],
          onSelected: (value) {
            switch (value) {
              case 0:
                {
                  Motor().logout(widget.me.accessToken);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new LoginPage()));
                }
            }
          },
        )
      ],
    );
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder(
        future: Motor().joinedRooms(widget.me.accessToken),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].toString()),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => new UserSearchPage(widget.me)));
        },
      ),
    );
  }
}
