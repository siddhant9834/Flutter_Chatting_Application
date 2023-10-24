import 'package:flutter/material.dart';
import 'package:my_chat_app/CustomCR/AvatarCard.dart';
import 'package:my_chat_app/CustomCR/ContactCard.dart';
import 'package:my_chat_app/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({
    Key? key,
  }) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "Siddhant",
      icon: "Icon.person ",
    ),
    ChatModel(
      name: "Siddhant",
      icon: "Icon.person ",
    ),
    ChatModel(
      name: "Siddhant",
      icon: " ",
    ),
    ChatModel(
      name: "Bharat",
      icon: " Icon.person",
    ),
    ChatModel(
      name: "Nilange",
      icon: " Icon.person",
    ),
    ChatModel(
      name: "Sidd",
      icon: "Icon.person ",
    ),
    ChatModel(
      name: "Siddhant",
      icon: " Icon.person",
    ),
    ChatModel(
      name: "Bharat",
      icon: " Icon.person",
    ),
    ChatModel(
      name: "Nilange",
      icon: "Icon.person ",
    ),
    ChatModel(
      name: "Sidd",
      icon: " Icon.person",
    ),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Add Participants",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            // onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
            ),
            onPressed: () {},
          ),
          // PopupMenuButton<String>(onSelected: (value) {
          //   print(value);
          // },
          //     itemBuilder: (BuildContext context) {
          //   return [
          //     PopupMenuItem(
          //       child: Text("Invite a Friend"),
          //       value: "Invite a Friend",
          //     ),
          //     PopupMenuItem(
          //       child: Text("Contacts"),
          //       value: "Contacts",
          //     ),
          //     PopupMenuItem(
          //       child: Text("Refresh"),
          //       value: "Refresh",
          //     ),
          //     PopupMenuItem(
          //       child: Text("Help"),
          //       value: "Help",
          //     ),
          //   ];
          // }
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context, index) {
                if(index==0){
                  return Container(
                    height: groups.isNotEmpty?90:10,
                  );
                }
                return InkWell(
                    onTap: () {
                      if (contacts[index-1].select == false) {
                        setState(() {
                          contacts[index-1].select = true;
                          groups.add(contacts[index-1]);
                        });
                      } else {
                        setState(() {
                          contacts[index-1].select = false;
                          groups.remove(contacts[index-1]);
                        });
                      }
                    },
                    child: ContactCard(contact: contacts[index-1]));
              }, // ContactCard(contact: contacts[index])
            ),
            groups.isNotEmpty? Column(
              children: [
                Container(
                  height: 82,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        if (contacts[index].select == true) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                contacts[index].select = false;
                                groups.remove(contacts[index]);
                              });


                            },
                              child: AvatarCard(
                            contact: contacts[index],
                          ));
                        } else {
                          return Container();
                        }
                      }),
                ),
                const Divider(thickness: 1),
              ],
            ): Container(),

          ],

        ),
      ),
    );
  }
}
