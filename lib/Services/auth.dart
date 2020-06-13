import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:pfk/Models/user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart';

User _userfromfirebase(FirebaseUser user) { 
return user != null ? User(uid: user.uid) :null ; 
}

class AuthServices { 

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser myuser;
  bool isLogged = false;
  Stream<User> get user { 
    return _auth.onAuthStateChanged.map(_userfromfirebase);  
    
  }
  Future signInAnon() async { 
    try { 
     AuthResult result =await _auth.signInAnonymously();
     FirebaseUser user = result.user; 
     return _userfromfirebase(user) ;
    }
    catch(e) {
       print(e.toString()); 
       return null ; 
    }
    
  }
  Future signout() async {
    try{ 
      return await _auth.signOut(); 

    } 
    catch(e) { 
      print(e.toString());
      return null ; 
    }

  }


  FirebaseUser myUser;

  Future<FirebaseUser> LoginWithFacebook() async {
     final facebookLogin = new FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
   // final result = await facebookLogin.logInWithReadPermissions(['email']); --> Versions bellow 3.0
   print(result.toString());
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('CANCELED BY USER');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }

   void logOut() async {
    await _auth.signOut().then((response) {
      isLogged = false;
      
    });
  }

  void logIn() async{
    LoginWithFacebook().then((response) {
      if (response != null) {
        myUser = response;
        isLogged = true;
      
      }
    });
  }
  
  Future sendPasswordResetEmail(String email)async{
  
   await _auth.sendPasswordResetEmail(email: email);

  }

  Future registerWithEmailPassword(String email , String password) async {
     try{ 
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); 
       FirebaseUser user = result.user ;
       return _userfromfirebase(user);

     }
     catch(e) {
       print(e.toString()); 
       return null ; 
        
     }
  } 
  Future signInWithEmailPassword (String email , String password) async {
     try { 
       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password); 
       FirebaseUser user = result.user; 
       if(user.uid == null) { 
       }
       return _userfromfirebase(user); 

     }
     catch(e) { 
       return null ; 

     }
  }
}