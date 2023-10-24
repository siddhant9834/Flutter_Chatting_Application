import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/NewScreen/LandingPage.dart';
import 'package:my_chat_app/Screen/Homescreen.dart';
// import './Homescreen.dart';
import 'package:my_chat_app/Screen/CameraScreen.dart';
import 'package:my_chat_app/Screen/loginScreen.dart';
// import '/C:/Users/Admin/StudioProjects/my_chat_app/lib/Pages/Chat.dart';

// import 'flutter/Homescreen.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          // fontFamily: "OpenSans",
          // primaryColor:const  Color(0xFF075E54),
            // primaryColor:const Color(0xFF128C7E)
          // colorScheme: const Color(0xff128C7E),
            primarySwatch:  Colors.teal
        ),
      home: loginScreen(),
      // const Homescreen(),
    );
  }
}
