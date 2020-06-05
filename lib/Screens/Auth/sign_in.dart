import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfk/Services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

final _formKey = GlobalKey<FormState>();

String email = '';
String password = '';
String error = '';

final AuthServices _auth = AuthServices();

class _SignIn extends State<SignIn> {
  @override
  final AuthServices _authServices = AuthServices();
  Widget build(BuildContext context) {
    return Scaffold(
      
        
      // backgroundColor: Color.fromARGB(255, 253, 248, 244) ,
     
    
      body:
       Container(
        
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'Images/Abstract Dark Blue Light In Center Photography Backdrop J-0420.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
      
      
        
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
      
        child: 
        
       Form(
          

                    key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                   alignment: Alignment.center ,
                   margin: new EdgeInsets.symmetric(vertical:60.0),
                  child:
                new Text('SkillHub' ,style: new TextStyle(
                  fontSize: 50.0,
                    
                  color: Color.fromARGB(255,253, 248, 224),
                  fontFamily: 'bold',
                  
                )),),
                 
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,253, 248, 224),width: 2.0)
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
                SizedBox(
                  
                 
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,253, 248, 224),width: 2.0)
                    )
                    
                    
                  ),
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
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.signInWithEmailPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Authentication failed ";
                        });
                      } else {
                        
                        error = '';
                        
                      }
                    }
                  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Sign in ",
                    style: TextStyle( color: Color.fromARGB(255,253, 248, 224),
                  fontFamily: 'bold',),
                  ),
                ), 
                 SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
             ,
              Row(children: <Widget>[
              
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: Color.fromARGB(255,253, 248, 224),
                    height: 50,
                  )),
            ),
 
           Text("OR",style: TextStyle( color: Color.fromARGB(255,253, 248, 224)),),
          
 
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Divider(
                    color: Color.fromARGB(255,253, 248, 224),
                    height: 50,
                  )),
            ),
          ]),
         Row(
               mainAxisAlignment: MainAxisAlignment.center,   crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
             RaisedButton(
                  onPressed: () {
                  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Login With Facebook ",
                    style: TextStyle( color: Color.fromARGB(255,253, 248, 224),
                  fontFamily: 'bold',),
                  ),
                ), 
                         ]),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,   crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(40.0)),
             
              ),
            
                
             Text("Don't have an account?",style: TextStyle( color: Color.fromARGB(255,253, 248, 224)),),
              
             FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person_add),
              label: Text("Register"),textColor: Color.fromARGB(255, 253, 248, 244))
               ]),
                
         
            ],
            
         )),
          
      ),
      
    );
  }
}
