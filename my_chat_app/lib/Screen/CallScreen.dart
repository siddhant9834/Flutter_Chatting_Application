import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 228, 225),
      body: ListView(
        children: [

          callCard("Atharva Pawar", "January 4, 7:00", Colors.green,
              Icons.call_made, Icons.call),
          callCard("Yash Pawar", "January 10, 8:00", Colors.red,
              Icons.call_received, Icons.video_chat),
          callCard("Sid", "January 10, 2:00", Colors.green, Icons.call_received,
              Icons.video_camera_front),
          callCard("Siddhant Nilange", "January 12, 1:00", Colors.red,
              Icons.call_made, Icons.call),
          callCard("Sidd", "January 15, 4:00", Colors.green,
              Icons.call_received, Icons.call),
          callCard("Siddhant Nilange", "January 18, 12:00", Colors.red,
              Icons.call_made, Icons.call),
          callCard("Atharva Pawar", "January 24, 10:00", Colors.green,
              Icons.call_made, Icons.call),
          callCard("Yash Pawar", "January 10, 8:00", Colors.red,
              Icons.call_missed, Icons.call),
          callCard("Atharva Pawar", "January 4, 7:00", Colors.green,
              Icons.call_made, Icons.call),
          callCard("Yash Pawar", "January 10, 8:00", Colors.red,
              Icons.call_received, Icons.video_chat),
          callCard("Sid", "January 10, 2:00", Colors.green, Icons.call_received,
              Icons.video_camera_front),
          callCard("Siddhant Nilange", "January 12, 1:00", Colors.red,
              Icons.call_made, Icons.call),
          callCard("Sidd", "January 15, 4:00", Colors.green,
              Icons.call_received, Icons.call),
          callCard("Siddhant Nilange", "January 18, 12:00", Colors.red,
              Icons.call_made, Icons.call),
          callCard("Atharva Pawar", "January 24, 10:00", Colors.green,
              Icons.call_made, Icons.call),
          callCard("Yash Pawar", "January 10, 8:00", Colors.red,
              Icons.call_missed, Icons.call),
        ],
      ),
    );
  }

  Widget callCard(String text, String time, Color iconColor, IconData icon,
      IconData callType) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: Image.asset(),
          radius: 20,
        ),
        title: Text(text,
            style: TextStyle(
                color: iconColor, fontSize: 16, fontWeight: FontWeight.w500)),
        subtitle: Row(children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            time,
            style: TextStyle(fontSize: 14),
          ),
        ]),
        trailing: Icon(
          callType,
          size: 30,
          color: Colors.teal,
        ),
      ),
    );
  }
}
