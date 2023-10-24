import 'package:flutter/material.dart';

class HeadOnStatus extends StatelessWidget {
  const HeadOnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/Sidd.jpg"),
          ),
          Positioned(
            top: 28,
            right: 2,
            child: CircleAvatar(
              radius: 10,
              child: Icon(Icons.add, size: 20, color: Colors.white,),
              
          ),
          )
        ],
       ),
      title: Text(
        "My Status",

        style: TextStyle(
          fontSize:18,
           fontWeight: FontWeight.bold, 
           color: Colors.black
           ),
        ),
      subtitle: Text(
        "Tap to Add Status or Update",
         style: TextStyle(
         fontSize: 12, 
         color: Colors.grey
         ),)
         ,

       
    );
  }
}