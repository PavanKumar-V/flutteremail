import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/src/screens/home.dart';
import 'package:login_app/src/screens/verify.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Column(
        children: [
// ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),

          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              auth.sendPasswordResetEmail(email: _email);
              Navigator.of(context).pop();
            },
            child: Text("Send Request"),
          )
        ],
      ),
    );
  }
}
