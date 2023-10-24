// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'pakage:'
import 'package:my_chat_app/Model/ChatModel.dart';
import 'package:my_chat_app/Screen/IndividualPage.dart';



import 'package:flutter_svg/flutter_svg.dart';




// import 'package:my_chat_app/Screens/IndividualPage.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Screens/IndividualPage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel, required this.sourChat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel? sourChat;
  // final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder:(context)=>IndividualPage(chatModel: chatModel, sourChat: sourChat,)));
        },

      child: Column(
        children: [
          // // Container(
          // //   height: 150,
          // //   width: 150,
          // //   decoration: BoxDecoration(
          // //     image: DecorationImage(image: AssetImage('assets/groups__1.jpg')),
          // //
          // //   ) ,
          // ),
          ListTile(
            visualDensity: const VisualDensity(horizontal: 0, vertical: 4),
            // contentPadding: EdgeInsets.only(left: 2.0, right: 4.0),

            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chatModel.isGroup!? "assets/groups.svg": "assets/person.svg",
                color: Colors.white,
                height: 37,
                width: 37,
              )
              // radius: 25,
              //
              // backgroundColor: Colors.white10,

              // child: Icon(Icons.person,
              //   color: Colors.white,

              // ),
              // child: Icon(Icons.person,
              //     size: 30,
              //     color: Colors.red,
              //     // height: 30,
              //     // width: 30,
              // ),
              //




          ),
            title: Text(
              chatModel.name.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 18.0,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 4,
                  height: 3,
                ),
                Text(
                  chatModel.currentMessage.toString(),
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatModel.currentMessage.toString()),
          ),
        ],
      ),
    );
  }
}
