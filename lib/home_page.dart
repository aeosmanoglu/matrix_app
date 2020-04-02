import 'package:flutter/material.dart';
import 'package:matrixapp/login_obj.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Text(widget.me.userId),
      ),
    );
  }
}
