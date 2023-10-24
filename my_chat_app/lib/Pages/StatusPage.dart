import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_chat_app/CustomCR/StatusPage/HeadOnStatus.dart';
import 'package:my_chat_app/CustomCR/StatusPage/OthersStatus.dart';


class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Container(
          height: 40,
          child: FloatingActionButton(
            onPressed: (){},
             child: Icon(
              Icons.edit, 
              color: Colors.blueGrey[900],),
              ),
        ),
        SizedBox(
          height: 13,
        ),
        FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.greenAccent[700],
          elevation: 5,
          child: Icon(Icons.camera_alt),
        ),
      ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
  
            HeadOnStatus(),
            label("Recent updates"),
            OthersStatus(
            name: "Siddhant",
            time: "12:00",
            imageName: "assets/",
              isSeen: false,
              statusNum: 1,
            ),
             OthersStatus(
            name: "Sidd",
            time: "11:00",
            imageName: "assets/",     isSeen: false,
               statusNum: 2,
            ),
             OthersStatus(
            name: "Siddhant Nilange",
            time: "12:00",
            imageName: "assets/",
               isSeen: false,
               statusNum: 1,
            ),
             OthersStatus(
            name: "Sidd",
            time: "12:00",
            imageName: "assets/",
               isSeen: false,
               statusNum: 1,
            ),
            SizedBox(
              height: 10,
            ),
  	        label("Viewed updates"),
            OthersStatus(
            name: "siddddd",
            time: "12:00",
            imageName: "assets/",
              isSeen: true,
              statusNum: 4,
            ),
             OthersStatus(
            name: "Siddhant",
            time: "10:00",
            imageName: "assets/",
               isSeen: true,
               statusNum: 1,
            ),
             OthersStatus(
            name: "Siddhant Nilange",
            time: "7:00",
            imageName: "assets/",
               isSeen: true,
               statusNum: 6,
            ),
             OthersStatus(
            name: "Sidd",
            time: "9:00",
            imageName: "assets/",
               isSeen: true,
               statusNum: 2,
            ),
          ],
        ),
      ),
    );
  }
  Widget label(String labelname){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13, vertical: 7
          ),
         child: Text(
           labelname,
           style: TextStyle(
               fontWeight: FontWeight.bold
           ),
         ),
           ),
          );

  }
}