import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // signin
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    // try sign user in
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // catch errors
    on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
  // signup
 Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    // try sign user up
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // catch errors
    on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
  // signout
  Future<void> signOut()async{
 return await _firebaseAuth.signOut() ;  
  }
}
