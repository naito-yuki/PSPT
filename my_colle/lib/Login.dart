import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_colle/Auth.dart';
import 'package:my_colle/Style.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  bool _showPassword = false;
  bool _loading = false;

  void _handleTextEM(String e) {
    _email = e;
  }

  void _handleTextPW(String e) {
    _password = e;
  }

  _buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('ログイン失敗'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                  ),
                  onChanged: _handleTextEM,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off 
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  onChanged: _handleTextPW,
                ),
              ),
              FlatButton(
                child: Container(
                  width: 120.0,
                  child: Center(
                    child: Text(
                      ' ログイン',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20.0,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                  ), 
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFFFFF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffad0000).withOpacity(0.9),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                onPressed: () {
                  setState(() {
                    _loading = true;
                  });
                  Auth.handleSignIn(_email,_password)
                  .then((_result) {
                    if (_result != null) {
                      Auth.authResult = _result;
                      Navigator.pushReplacementNamed(context, '/Top');
                    } else {
                      setState(() {
                        _loading = false;
                      });
                      _buildDialog(context);
                    }
                  });
                },
              ),
            ],
          ),
          _loading
          ? BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0.1,
              sigmaY: 0.1,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          )
          : Container(),
          _loading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : Container(),
        ],
      ),
    );
  }
}
