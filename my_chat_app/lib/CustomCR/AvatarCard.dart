import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_chat_app/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);

  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blueGrey[200],
                    child: SvgPicture.asset(
                      "assets/person.svg",
                      color: Colors.white,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 11,
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                contact.name.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
