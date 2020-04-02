import 'package:flutter/material.dart';
import 'package:matrixapp/login_obj.dart';
import 'package:matrixapp/login_page.dart';
import 'package:matrixapp/motor.dart';

class HomePage extends StatefulWidget {
  final LoginObj me;
  HomePage(this.me);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Text(widget.me.userId),
      ),
    );
  }
}
