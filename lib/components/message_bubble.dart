import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.messageText,
      @required this.messageSender,
      @required this.isMe,
      @required this.formattedTime});

  final String messageText;
  final String messageSender;
  final String formattedTime;
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                      isMe //if condition to align order of widgets in list
                          ? [
                              //if true
                              Flexible(
                                child: Text('$messageText',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: isMe
                                            ? Colors.white
                                            : Colors.black54)),
                              ),
                              SizedBox(width: 7.0),
                              Text('$formattedTime',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: isMe
                                          ? Colors.white
                                          : Colors.black54)),
                            ]
                          : [
                              //if false
                              Text('$formattedTime',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: isMe
                                          ? Colors.white
                                          : Colors.black54)),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text('$messageText',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: isMe
                                            ? Colors.white
                                            : Colors.black54)),
                              ),
                            ],
                ),
              ),
            ),
          ],
        ));
  }
}
