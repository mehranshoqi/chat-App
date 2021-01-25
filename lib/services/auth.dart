import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth/signup_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createUserWithEmailAndPassword(SignupModel signupModel) async {
    try {
      dynamic res = await _auth.createUserWithEmailAndPassword(
        email: signupModel.email,
        password: signupModel.password,
      );
      dynamic user = res.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signInAnonymously() async {
    try {
      dynamic res = await _auth.signInAnonymously();
      dynamic user = res.user;
      return user.uid;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  authStateChanges() {
    try {
      _auth.authStateChanges();
    } catch (err) {}
  }
}
