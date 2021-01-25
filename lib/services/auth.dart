import '../model/auth/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
