import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_chat_app/Model/ChatModel.dart';



class ContactCard extends StatelessWidget{
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(

        leading: SizedBox(
          height: 53,
          width: 50,
          // child: Padding(
            // padding: const EdgeInsets.only(top: 5, bottom: 0),
            child: Stack(
              children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blueGrey[200],
                child: SvgPicture.asset(
                    "assets/person.svg",
                    color: Colors.white ,
                    height: 30,
                    width: 30,
                ),
              ),
                (contact.select?? false) ?
                const Positioned(
                  bottom: 5,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(
                      Icons.check, color: Colors.white, size: 18,
                    ),
                  ),
                ) : Container(),
            ],
            // ),
          ),
        ),

        title: Text(
          contact.name??'Name',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
            contact.status??'status',
            style: const TextStyle(
            fontSize: 13,
              fontWeight: FontWeight.bold,
            ) ,
        ),
      ),
    );
  }
}