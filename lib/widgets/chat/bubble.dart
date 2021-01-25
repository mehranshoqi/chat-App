import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final String message;
  Bubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin:
              // isMe
              //     ? EdgeInsets.only(
              //         top: 8.0,
              //         bottom: 8.0,
              //         left: 80.0,
              //       )
              //     :
              EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Time',
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
                'text',
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
