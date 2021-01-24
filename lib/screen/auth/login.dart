import 'package:flutter/material.dart';
import '../../model/auth/login_model.dart';
import '../../animation/FadeAnimation.dart';
import '../../route/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _loginButtonFocusNode = FocusNode();
  bool validated = false;

  var _loginModel = LoginModel();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
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
                                // WE CAN USE MORE if statement
                                return null;
                              },
                              onSaved: (value) {
                                _loginModel = LoginModel(
                                  email: value,
                                  password: _loginModel.password,
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
                                textInputAction: TextInputAction.done,
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
                                  _loginModel = LoginModel(
                                    email: _loginModel.email,
                                    password: value,
                                  );
                                },
                                onFieldSubmitted: (_) => {
                                      FocusScope.of(context)
                                          .requestFocus(_loginButtonFocusNode),
                                      _form.currentState.validate(),
                                      validated = _form.currentState.validate(),
                                    }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                            focusNode: _loginButtonFocusNode,
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () => _submitForm(),
                            color: validated
                                ? Theme.of(context).accentColor
                                : Colors.grey[400],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => Navigator.of(context).pushNamed(
                            Routes.signup,
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
