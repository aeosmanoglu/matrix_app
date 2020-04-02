import 'package:flutter/material.dart';
import 'package:matrixapp/home_page.dart';
import 'package:matrixapp/login_obj.dart';
import 'package:matrixapp/motor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user;
  String password;

  InputDecoration _decoration(String label, Icon icon) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      prefixIcon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: _decoration("Kurum Kimlik Numarası", Icon(Icons.person)),
              onChanged: (text) {
                user = text;
              },
            ),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: _decoration("Parola", Icon(Icons.vpn_key)),
              onChanged: (text) {
                password = text;
              },
            ),
            SizedBox(height: 8),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text("GİRİŞ", style: Theme.of(context).textTheme.button),
              onPressed: () async {
                LoginObj obj = await Motor().login(user, password);
                if (obj.userId != null) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new HomePage(obj)));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
