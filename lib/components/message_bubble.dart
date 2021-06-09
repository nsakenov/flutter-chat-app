import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.messageText,
      @required this.messageSender,
      @required this.isMe});

  final String messageText;
  final String messageSender;
  final bool isMe;

  var borderRadiusUser1 = BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );

  var borderRadiusUser2 = BorderRadius.only(
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(messageSender,
                style: TextStyle(fontSize: 12, color: Colors.black54)),
            Material(
              borderRadius: isMe ? borderRadiusUser1 : borderRadiusUser2,
              elevation: 5.0,
              color: isMe ? Colors.lightBlue : Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text('$messageText',
                    style: TextStyle(
                        fontSize: 15,
                        color: isMe ? Colors.white : Colors.black54)),
              ),
            ),
          ],
        ));
  }
}
