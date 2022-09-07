import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  late SharedPreferences prefs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String name = "";

  get assets => null;

  void initState() {
    super.initState();
    _dataLogin();
  }

  void _dataLogin() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("Email") ?? '';
    setState(() {
      email.text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/logoflutter.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    textfield(
                      data: email,
                      n: 'E-mail',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textfield(
                      data: password,
                      n: 'Password',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonTheme(
                            minWidth: 300.0,
                            height: 50.0,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black87),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("Email", email.text.toString());
  }
}

class textfield extends StatelessWidget {
  const textfield({
    Key? key,
    required this.data,
    required this.n,
  }) : super(key: key);

  final TextEditingController data;
  final String n;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: data,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: n,
        hintText: ' $n',
      ),
    );
  }
}
