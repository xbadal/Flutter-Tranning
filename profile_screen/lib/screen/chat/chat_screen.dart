import 'package:flutter/material.dart';
import 'package:profile_screen/model/chat_model.dart';
import 'package:profile_screen/screen/chat/widget/chat_row_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List chatList = [
    ChatModel(
        id: 1,
        name: "badal kumar",
        message: "Hello",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:59'),
    ChatModel(
        id: 2,
        name: "Mukest kumar",
        message: "Hey there, I am busy",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
    ChatModel(
        id: 3,
        name: "Aisya roy",
        message: "Santa Banta jokes",
        profilePhoto: 'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
        textTime: '18:39'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Online",
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8.0, left: 4),
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.brown,
                        radius: 35,
                        foregroundImage: NetworkImage(chatList[index].profilePhoto),
                      ),
                      const Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 15.0,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: chatList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Chat",
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return ChatRowWidget(
                chatModel: chatList[index],
              );
            },
            itemCount: chatList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
