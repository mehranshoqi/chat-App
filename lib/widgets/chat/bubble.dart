import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final String message;
  final String userId;
  Bubble(this.message, this.userId);

  @override
  Widget build(BuildContext context) {
    var isMe = userId == FirebaseAuth.instance.currentUser.uid;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Colors.white70,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message,
                // message.time,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                // message.text,
                'time',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
