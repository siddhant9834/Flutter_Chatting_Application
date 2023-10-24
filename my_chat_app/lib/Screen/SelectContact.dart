import 'package:flutter/material.dart';
import 'package:my_chat_app/CustomCR/ContactCard.dart';
import 'package:my_chat_app/Model/ChatModel.dart';
import 'package:my_chat_app/CustomCR/ButtonDart.dart';
import 'package:my_chat_app/Screen/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({
    Key? key,
  }) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Siddhant",
        status: "Software Developer",
        currentMessage: " kjk",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Siddhant",
        status: "Software Developer",
        currentMessage: " nnbj",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Siddhant",
        status: "Software Developer",
        currentMessage: "bjbjm ",
        icon: "Icon.person ",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Bharat",
        status: "Software Developer",
        currentMessage: " jk",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Nilange",
        status: "Software Developer",
        currentMessage: " cbvf",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Sidd",
        status: "Software Developer",
        currentMessage: " knn,",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Siddhant",
        status: "Software Developer",
        currentMessage: " abc",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Bharat",
        status: "Software Developer",
        currentMessage: "kj ",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Nilange",
        status: "Software Developer",
        currentMessage: " kjmm",
        icon: "Icon.person ",
        timer: "10:10",
        isGroup: false,
      ),
      ChatModel(
        name: "Sidd",
        status: "Software Developer",
        currentMessage: " knnm",
        icon: " Icon.person",
        timer: "10:10",
        isGroup: false,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Total Contacts 200",
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
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Invite a Friend",
                child: Text("Invite a Friend"),
              ),
              const PopupMenuItem(
                value: "Contacts",
                child: Text("Contacts"),
              ),
              const PopupMenuItem(
                value: "Refresh",
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (builder)=> const CreateGroup()
                ),
                );
              },
              child: const ButtonCard(
                  icon: Icons.group, name: "New Group"
              ),
            );
          } else if (index == 1) {
            return const ButtonCard(
                icon: Icons.person_add, name: "New Contact"
            );
          } else {
            return ContactCard(
                contact: contacts[index - 2]
            );
          }
        }, // ContactCard(contact: contacts[index])
      ),
    );
  }
}
