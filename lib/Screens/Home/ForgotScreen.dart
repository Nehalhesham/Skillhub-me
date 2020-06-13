import 'package:flutter/material.dart';
import 'package:pfk/Services/auth.dart';

class ForgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _ForgotScreenState();
  }
}

class _ForgotScreenState extends State<ForgotScreen> {
  String email='';
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(padding: EdgeInsets.only(top:50,left:20,right:20),
        child:Form(
          key:_formKey,
        child:Column(
        children:<Widget>[
       Text('We Will Mail you a Link ... Please Click on it and Reser your Password'),
             SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                  ),
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
       RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
            dynamic result = await _auth.sendPasswordResetEmail(email) ;
                           if(result == null){
                             print('Check your mail');
                           }
                                 }  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Sign in ",
                    style: TextStyle( color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',),
                  ),
                ), 
          ]
        ),
        )
        , 
       )
        )
      
    );
  }
}