import "package:flutter/material.dart";
import "package:otp_text_field/otp_field.dart";
import "package:otp_text_field/style.dart";

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.countrycode, required this.number}) : super(key: key);
  
  final number;
  final String countrycode;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("verify ${widget.countrycode} ${widget.number}", style: TextStyle(color: Colors.teal[800], fontSize: 15),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.black,))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
              children: [
                TextSpan(text: "We have sent you an SMS with a code to ", 
                style: TextStyle(color: Colors.black, fontSize: 15)),
                TextSpan(
                  text:"+" + widget.countrycode + " " + widget.number,
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: " wrong number?",
                   style: TextStyle(color: Colors.cyan[800], fontSize: 15, fontWeight: FontWeight.bold)
                ),

              ]
              )
              ),
            SizedBox(
              height: 5,
            ),
            OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                  style: TextStyle(
                    fontSize: 17
                  ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
            ),  
             SizedBox(
              height: 20,
            ),
            Text("Enter 6-digit code", style: TextStyle(color: Colors.grey, fontSize: 15,),),
               SizedBox(
              height: 30,
            ),
           
            bottomButton("Resend SMS", Icons.message),
            SizedBox(
              height: 15,
            ),
            Divider(color: Colors.grey, thickness:2, indent: 4,),
              SizedBox(
              height: 15,
            ),
            bottomButton("Call me", Icons.call),

          ],
          ),
      ),
    );
  }
  Widget bottomButton(String text, IconData icon){
    return Row(
              children: [
                Icon(
                  icon,
                  color: Colors.teal,
                  size: 24,
                ),
                SizedBox(width: 25,),
                Text(
                  text, 
                  style: TextStyle(
                    color: Colors.cyan[800], fontSize: 15, fontWeight: FontWeight.bold
                  ),
                ),

                  
              ],
            );
  }
}