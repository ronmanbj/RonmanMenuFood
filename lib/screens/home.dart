import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Exlicit
  double myLogo = 100.0;

  // Method

  Widget mySizeBox() {
    return SizedBox(
      width: 3.0,
      height: 8.0,
    );
  }

  Widget singInButton() {
    return Expanded(
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.orange[300],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget singUpButton() {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.orange[600]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'Sing Up',
          style: TextStyle(
            color: Colors.orange[600],
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: myLogo,
      height: myLogo,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'ยินดีต้อนรับเข้าสู่ แอพ เมนูฟู้ด',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.brown[800],
            fontWeight: FontWeight.bold,
            fontFamily: 'Pattaya'),
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          singInButton(),
          mySizeBox(),
          singUpButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.orange,
            ],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
