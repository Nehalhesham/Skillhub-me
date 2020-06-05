import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfk/Models/user.dart';

User _userfromfirebase(FirebaseUser user) { 
return user != null ? User(uid: user.uid) :null ; 
}
class AuthServices { 

  final FirebaseAuth _auth = FirebaseAuth.instance;
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