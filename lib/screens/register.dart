import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color colorText = Colors.orange[600];
  final formKey = GlobalKey<FormState>();
  String name, user, password;

  // Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name Display:',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Name in English',
        helperStyle: TextStyle(color: Colors.green[900]),
        hintText: 'Name not Blank',
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.green,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name is Blank';
        }
      },onSaved: (String value){
        name = value;
      },
    );
  }

  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User Display:',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type User in English',
        helperStyle: TextStyle(color: Colors.blue[900]),
        hintText: 'User not Blank',
        icon: Icon(
          Icons.account_circle,
          size: 36.0,
          color: Colors.blue,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอก User ด้วยนะ ค่ะ';
        }
      },onSaved: (String value){
        user = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password Display:',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type Password in English',
        helperStyle: TextStyle(color: Colors.red[900]),
        hintText: 'Password not Blank',
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.red,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุรหัสผ่าน ด้วยนะค่ะ';
        }
      },onSaved: (String value){
        password = value;
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
          registerToMySQL();
        }
      },
    );
  }

  Future<void> registerToMySQL()async{

    String urlString = 'https://www.androidthai.in.th/man/addDataMan.php?isAdd=true&Name=$name&User=$user&Password=$password';

    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');

    if (result.toString() == 'true') {
      Navigator.of(context).pop();
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          registerButton(),
        ],
        backgroundColor: colorText,
        title: Text('สมัครสมาชิก', style: TextStyle(fontFamily: 'Pattaya'),),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
