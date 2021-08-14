
import 'package:firebase_auth/firebase_auth.dart';

class UserClass {
  final String uid;
  UserClass({required this.uid});
}

class AuthBase {
  UserClass _userFromFirebase(User user) {
    return UserClass(uid: user.uid);
  }

  Future registerWithEmailAndPassword(
      String email, String password) async {
    final authresult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
       
   return _userFromFirebase(authresult.user!);
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    final authresult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
        
   return _userFromFirebase(authresult.user!);
  }

  

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
