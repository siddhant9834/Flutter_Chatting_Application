import 'package:flutter/material.dart';
import 'package:my_chat_app/CustomCR/ButtonDart.dart';
import 'package:my_chat_app/Screen/Homescreen.dart';

import '../Model/ChatModel.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  ChatModel? sourceChat;
  List<ChatModel>chatmodels=[
  ChatModel(
  name: "Sidd",
  isGroup: false,
  currentMessage: "Hello Sidd",
  timer: "4:40",
  icon:"person.svg",
  status: "Availabel",
  select: false,
  id:6

  ),
  // ChatModel(
  //   name: "Group1",
  //   isGroup: true,
  //   currentMessage: "Hello Group",
  //   timer: "4:40",
  //   icon:"group.svg",
  //     status: "Availabel",
  //     select: false

  // ),
  ChatModel(
  name: "Siddhant",
  isGroup: false,
  currentMessage: "Hello Siddhant",
  timer: "4:40",
  icon:"person.svg",
  status: "Availabel",
  select: false,
  id:4
  ),
  ChatModel(
  name: "Sidd",
  isGroup: false,
  currentMessage: "Hello Sidd",
  timer: "4:40",
  icon:"person.svg",
  status: "Available",
  select: false,
    id:3
  ),
  ChatModel(
  name: "Sidd",
  isGroup: false,
  currentMessage: "Hello Sidd",
  timer: "4:40",
  icon:"person.svg",
  status: "Available",
  select: false,
  id:5

  ),
  ChatModel(
  name: "Sidd",
  isGroup: false,
  currentMessage: "Hello Sidd",
  timer: "4:40",
  icon:"person.svg",
  status: "Available",
  select: false,
  id:1

  ) ,
   ChatModel(
  name: "Sidd",
  isGroup: false,
  currentMessage: "Hello Sidd",
  timer: "4:40",
  icon:"person.svg",
  status: "Available",
  select: false,
  id:2
  )
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (context, index)=>InkWell(
          onTap: (){
           sourceChat= chatmodels.removeAt(index);
           Navigator.pushReplacement(context, MaterialPageRoute(builder:(builder)=> Homescreen(
             chatModels: chatmodels, sourChat: sourceChat
           )));
          },
          child: ButtonCard(
              name: chatmodels[index].name.toString(),
              icon: Icons.person,
          ),
        )
      ),
    );
  }
}
