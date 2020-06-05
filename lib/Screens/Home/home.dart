import 'package:flutter/material.dart';
import 'package:pfk/Services/auth.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 253, 248, 244) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 51, 91),
        title: Text("Nezu <3"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon( 
              onPressed: () async {
                await _auth.signout();
              },
              icon: Icon(Icons.person),
              label: Text("Logout") ,  textColor: Color.fromARGB(255, 253, 248, 244))
        ],
      ),
      body: Center(
    child: 
     Image(image:AssetImage( 'Images/skillhub.png'),
     ),),
    );
  }
}


