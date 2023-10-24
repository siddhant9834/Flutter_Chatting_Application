// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:my_chat_app/NewScreen/LoginPage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Image.asset(
              "assets/bg.png",
              color: Colors.greenAccent[700],
              height: 340,
              width: 340,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  
                  ),
                  children: [
                    TextSpan(
                      
                      text: "Agree and Continue to Accept the",
                    ),
                    TextSpan(
                      text: " WhatsApp Terms of Services and Privacy",
                      style: TextStyle(color: Colors.cyan)
                    ),
                  ],
                ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>const LoginPage()),
                (route)=> false
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width-500,
                child: Card(
                  margin: EdgeInsets.all(0) ,
                  elevation: 10,
                  color: Colors.green[700],
                  child: Center(child: Text("Agree and Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  )
                  )
                  
                  ),
                  
            
              ),
            ),
           SizedBox(height: 15,)
          ],
        )),
      ),
    );
  }
}
