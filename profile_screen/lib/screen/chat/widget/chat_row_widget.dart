import 'package:flutter/material.dart';
import 'package:profile_screen/model/chat_model.dart';

class ChatRowWidget extends StatelessWidget {
  const ChatRowWidget({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.brown,
            radius: 35,
            foregroundImage: NetworkImage(chatModel.profilePhoto),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatModel.name,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  chatModel.message,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
