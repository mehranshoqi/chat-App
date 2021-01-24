import 'package:flutter/material.dart';
import '../../model/auth/signup_model.dart';
import '../../services/auth.dart';

import '../../animation/FadeAnimation.dart';
import '../../route/routes.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final AuthServices _auth = AuthServices();
  final _form = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _signupButtonFocusNode = FocusNode();
  bool validated = false;
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  var _signupModel = SignupModel(
    email: '',
    password: '',
    confirmPassword: '',
  );

  //SUBMIT FORM
  _submitForm() async {
    _form.currentState.save();
    dynamic res = await _auth.createUserWithEmailAndPassword(_signupModel);
    if (res == null) {
      print("NULL RESPONSE!");
    } else {
      print("SIGNIN :D");
      print(res);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.4,
                        TextFormField(
                          // initialValue: _initialValues['email'],
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'email',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required *';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Enter Correct Email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _signupModel = SignupModel(
                              email: value,
                              password: _signupModel.password,
                              confirmPassword: _signupModel.confirmPassword,
                            );
                          },
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(
                            _passwordFocusNode,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FadeAnimation(
                        1.5,
                        TextFormField(
                          focusNode: _passwordFocusNode,
                          // initialValue: _initialValues['password'],
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required *';
                            }
                            if (!RegExp(
                                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&;*_=+-]).{8,12}$")
                                .hasMatch(value)) {
                              return 'invalide password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _signupModel = SignupModel(
                                email: _signupModel.email,
                                password: value,
                                confirmPassword: _signupModel.confirmPassword);
                          },
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FadeAnimation(
                        1.5,
                        TextFormField(
                          focusNode: _confirmPasswordFocusNode,
                          // initialValue: _initialValues['password'],
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'confirm password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required *';
                            }
                            // if (value != _signupModel.password) {
                            //   return 'Not match!';
                            // }
                            if (!RegExp(
                                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&;*_=+-]).{8,12}$")
                                .hasMatch(value)) {
                              return 'invalide password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _signupModel = SignupModel(
                                email: _signupModel.email,
                                password: _signupModel.password,
                                confirmPassword: value);
                          },
                          onFieldSubmitted: (_) => {
                            FocusScope.of(context)
                                .requestFocus(_signupButtonFocusNode),
                            _form.currentState.validate(),
                            validated = _form.currentState.validate(),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                1.4,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      focusNode: _signupButtonFocusNode,
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () =>
                          _form.currentState.validate() ? _submitForm() : null,
                      color: validated
                          ? Theme.of(context).primaryColor
                          : Colors.grey[400],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: validated ? Colors.black : Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.6,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => Navigator.of(context).pushNamed(
                        Routes.login,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
