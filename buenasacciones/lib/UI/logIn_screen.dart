import 'package:buenasacciones/UI/Widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();

  @override
  void dispose() {
    _userControl.dispose();
    super.dispose();
  }

  build(BuildContext context) {
    var statusH = MediaQuery.of(context).padding.top;
    var h = MediaQuery.of(context).size.height - statusH;

    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Usuario o contraseña incorrecta',
                style: TextStyle(color: Colors.red),
              ),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Entendido',
                  style: TextStyle(color: Colors.purple, fontSize: 18.0),
                ))
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: statusH, left: 10, right: 10),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextField(
              controller: _userControl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Usuario",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordControl,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Contraseña",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _performLogin(errorDialog);
                    },
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromRGBO(77, 124, 174, 1),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Registrar nuevo usuario',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void _performLogin(Dialog alert) {
    String username = _userControl.text;
    String password = _passwordControl.text;

    if (username == 'admin@hotmail.com' && password == 'password') {
      Navigator.pushNamed(context, "/feed");
    } else {
      setState(() {
        showDialog(context: context, builder: (BuildContext context) => alert);
      });
    }
  }
}
