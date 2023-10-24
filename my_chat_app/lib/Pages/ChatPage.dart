import 'package:flutter/material.dart';
import 'package:my_chat_app/CustomCR/CustomCard.dart';
import 'package:my_chat_app/Screen/SelectContact.dart';
import 'package:my_chat_app/Model/ChatModel.dart';
// import '/C:/Users/Admin/StudioProjects/my_chat_app/lib/Pages/Chat.dart';

class ChatPage extends StatefulWidget{
  ChatPage({Key? key,required this.chatmodels, required this.sourchat}):super(key: key);
final List<ChatModel>chatmodels;
final ChatModel? sourchat;
  // ChatPage({Key key}) : super (key: key);

  @override
  _ChatPageState createState()=>_ChatPageState();
}

class  _ChatPageState extends State<ChatPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>SelectContact()));
      },
      child: const Icon(
          Icons.chat
      ),
      ),
       body: ListView.builder(
         itemCount: widget.chatmodels.length,
             itemBuilder: (contex, index)=>CustomCard(chatModel: widget.chatmodels[index], sourChat: widget.sourchat,),

      //     children: [
      //     CustomCard(),
      //      CustomCard(),
      //    ],
      ),
    );
  }
}