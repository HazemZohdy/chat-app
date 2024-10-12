import 'package:caht_appreview/constant.dart';
import 'package:caht_appreview/model/model_message.dart';
import 'package:flutter/material.dart';

class customChatBubble extends StatelessWidget {
  const customChatBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 10, right: 28, top: 30, bottom: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: kPrimaryKey,
        ),
        child:   Text(
          message.message,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class customChatBubbleFriends extends StatelessWidget {
  const customChatBubbleFriends({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 10, right: 28, top: 30, bottom: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          color: Colors.orange,
        ),
        child:   Text(
          message.message,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
