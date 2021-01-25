import 'package:flutter_redux/flutter_redux.dart';
import './redux/app_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import './screen/auth/auth.dart';
import './screen/chat.dart';
import './route/routes.dart';
import './screen/auth/login.dart';
import './screen/auth/signup.dart';
import './redux/store.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> _store = createStore();
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('ERROR 32 main.dart');
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return new StoreProvider(
            store: _store,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AuthScreen(),
              theme: ThemeData(
                primaryColor: Color(0xFF63D7B4),
                accentColor: Color(0xFF63D7B4),
                backgroundColor: Color(0xFF222E3C),
                textTheme: ThemeData.light().textTheme.copyWith(
                      body1: TextStyle(
                        color: Color.fromRGBO(20, 51, 51, 1),
                      ),
                      body2: TextStyle(
                        color: Color.fromRGBO(20, 51, 51, 1),
                      ),
                      title: TextStyle(
                          color: Color(0xFF63D7B4),
                          fontWeight: FontWeight.w900,
                          letterSpacing: .7),
                      subhead: TextStyle(
                        fontSize: 14.2,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              ),
              routes: {
                Routes.chat: (context) => ChatScreen(),
                Routes.auth: (context) => AuthScreen(),
                Routes.login: (context) => LoginScreen(),
                Routes.signup: (context) => SignupScreen(),
              },
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
      },
    );
  }
}
