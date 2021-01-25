import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/app_state.dart';
import '../../redux/auth/auth_action.dart';
import '../../services/auth.dart';
import '../../animation/FadeAnimation.dart';
import '../../route/routes.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.2,
                      Text(
                        "Automatic identity verification which enables you to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/illustration.png'),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            Routes.login,
                          );
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(
                          top: 3,
                          left: 3,
                        ),
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
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () => Navigator.of(context).pushNamed(
                            Routes.signup,
                          ),
                          color: Theme.of(context).accentColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FadeAnimation(
                      2,
                      MaterialButton(
                        onPressed: () async {
                          var user = await _auth.signInAnonymously();
                          if (user == null) {
                            return null;
                          } else {
                            print(user);
                            StoreProvider.of<AppState>(context).dispatch(
                              AnymousSigninAction(user.uid),
                            );
                            // Navigator.of(context).push(
                            //   PageRouteBuilder(
                            //     transitionDuration:
                            //         Duration(milliseconds: 900),
                            //     transitionsBuilder: (
                            //       BuildContext context,
                            //       Animation<double> animation,
                            //       Animation<double> secondaryAnimation,
                            //       Widget child,
                            //     ) {
                            //       return FadeTransition(
                            //         opacity: animation,
                            //         child: child,
                            //       );
                            //     },
                            //     pageBuilder: (
                            //       BuildContext context,
                            //       Animation<double> animation,
                            //       Animation<double> secondaryAnimation,
                            //     ) {
                            //       return HomeScreen();
                            //     },
                            //   ),
                            // );
                          }
                        },
                        child: Text(
                          'continue as Guest',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
