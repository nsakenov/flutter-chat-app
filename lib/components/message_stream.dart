import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_bubble.dart';
import 'package:intl/intl.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({@required this.loggedInUser});
  String loggedInUser;
  bool isMe;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child:
                  CircularProgressIndicator(backgroundColor: Colors.lightBlue),
            );
          }
          final messages = snapshot.data.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data()['text'];
            final messageSenderEmail = message.data()['sender'];
            isMe = loggedInUser == messageSenderEmail ? true : false;
            var timestamp = DateTime.fromMillisecondsSinceEpoch(
                message.data()['timestamp']);
            String formattedTime = DateFormat.Hm().format(timestamp);

            final messageBubble = MessageBubble(
                messageText: messageText,
                messageSender: messageSenderEmail,
                isMe: isMe,
                formattedTime: formattedTime);
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              reverse: true,
              children: messageBubbles,
            ),
          );
        });
  }
}
