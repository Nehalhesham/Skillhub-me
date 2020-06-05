import 'package:flutter/material.dart';
import 'package:pfk/Services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 248, 244) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 51, 91),
        elevation: 0.0,
        title: Text("Kobtan"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.account_circle),
              
              label: Text("Sign in"), textColor: Color.fromARGB(255, 253, 248, 244))
        ],
      ),
      body: Container(
        
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter an email";
                    else if (!val.contains('@') || !val.contains('.'))
                      return "enter a valid email";
                    else
                      return null;
                  },
                  
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter a Password";
                    else if (val.length < 8)
                      return "enter a valid password";
                    else
                      return null;
                  },
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
              RaisedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = "Please enter a valid email";
                        });
                      }
                      else { 
                        error ='';
                      }
                    }
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Color.fromARGB(255, 253, 248, 244),
                  ),
                  color: Color.fromARGB(255, 9, 51, 91),
                  label: Text(
                    "Register ",
                    style: TextStyle(color: Color.fromARGB(255, 253, 248, 244)),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            )),
      ),
    );
  }
}
