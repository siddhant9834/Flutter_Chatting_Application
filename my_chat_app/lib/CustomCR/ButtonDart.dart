import 'package:flutter/material.dart';



class ButtonCard extends StatelessWidget{
  const ButtonCard({Key? key,  required this.name, required this.icon}) : super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context){
    return Padding(

      padding: const EdgeInsets.only(top : 5.0, bottom: 5.0),
      child: ListTile(

        leading: CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xFF25D366),
          child: Icon(icon, color: Colors.white,),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),


      ),

    );

  }
}