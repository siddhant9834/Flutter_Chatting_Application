import 'package:flutter/material.dart';
import 'package:my_chat_app/Pages/CameraPage.dart';
// import 'package:my_chat_app/Screen//loginScreen.dart';

import 'package:my_chat_app/Model/ChatModel.dart';
// import 'package:chatapp/Pages/CameraPage.dart';
// import 'package:chatapp/Pages/ChatPage.dart'
// import './Chat.dart';
import 'package:my_chat_app/Pages/ChatPage.dart';
// import '/C:/Users/Admin/StudioProjects/my_chat_app/lib/Pages/Chat.dart';
import 'package:my_chat_app/Model/ChatModel.dart';
import 'package:my_chat_app/Pages/StatusPage.dart';
import 'package:my_chat_app/Screen/CallScreen.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.chatModels, required this.sourChat}):super(key: key);
  final List<ChatModel>chatModels;
  final ChatModel? sourChat;
  // Homescreen({required Key key}) : super(Key: key);

  @override
  _HomescreenState createState() => _HomescreenState();

}

class _HomescreenState extends State<Homescreen> with
    SingleTickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState(){
    super.initState();
    _controller= TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp Clone"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          // IconButton (icon: Icon(Icons.more_vert), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value){
          print(value);
          },
              itemBuilder: (BuildContext context){
            return[
              const PopupMenuItem(value: "New Group",child: Text("NewGroup"),),
              const PopupMenuItem(value: "New Broadcast",child: Text("New Broadcast"),),
              const PopupMenuItem(value: "Whatsapp Web",child: Text("Whatsapp Web"),),
              const PopupMenuItem(value: "Starred Message",child: Text("Starred Message"),),
              const PopupMenuItem(value: "Settings",child: Text("Settings"),),


    ];
    })
        ],

          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,

            tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
                text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        )

      ),
      body: TabBarView(
        controller: _controller,
          children:  [
            CameraPage(),

            ChatPage(chatmodels: widget.chatModels,
            sourchat: widget.sourChat,
            ),
            StatusPage(),
            CallScreen(),
          ],

      ),
    );

  }

}

