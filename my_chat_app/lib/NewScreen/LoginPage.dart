// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_chat_app/NewScreen/CountryPage.dart';
import 'package:my_chat_app/Screen/OtpScreen.dart';
import 'package:path/path.dart';

import '../Model/CountryModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "India";
  String countryCode = "+91";

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter your phone number",
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              wordSpacing: 1,
              fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Text(
            "Whatsapp Will send an sms message to verify your number",
            style: TextStyle(fontSize: 13.5),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Whats my Number",
            style: TextStyle(fontSize: 14, color: Colors.cyan),
          ),
          SizedBox(
            height: 15,
          ),
          countryCard(),
          SizedBox(
            height: 20,
          ),
          number(),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              if (_controller.text.length < 10) {
                showMydialogue2();
              } else {
                showMydialogue1();
              }
            },
            child: Container(
              height: 50,
              width: 70,
              color: Colors.tealAccent[400],
              child: Center(
                  child: Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyan[800],
                ),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            this.context,
            MaterialPageRoute(
                builder: (builder) =>
                    CountryPage(setCountryData: setCountryData)));
      },
      child: Container(
        width: MediaQuery.of(this.context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.teal,
          width: 1.8,
        ))),
        child: Row(children: [
          Expanded(
            child: Container(
                child: Center(
              child: Text(
                countryName,
              ),
            )),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.teal,
            size: 20,
          ),
        ]),
      ),
    );
  }

  Widget number() {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: ),
      width: MediaQuery.of(this.context).size.width / 1.5,
      height: 38,
      child: Row(children: [
        Container(
            width: 70,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ))),
            child: Row(
              children: [
                Text(
                  "+",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(countryCode.substring(1), style: TextStyle(fontSize: 18)),
              ],
            )),
        SizedBox(
          width: 25,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          // width: 270,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.teal,
            width: 1.8,
          ))),
          width: MediaQuery.of(this.context).size.width / 1.5 - 100,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
              hintText: "phone text",
            ),
          ),
        )
      ]),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(this.context);
  }

  Future<void> showMydialogue1() {
    return showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We wiil be verifying your phone Number",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      countryCode + " " + _controller.text,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This is ok or would you like to edit the number",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
            actions: [
              TextButton(
                onPressed: () {

                },
                 child: Text("Edit", style: TextStyle(fontSize: 14, color: Colors.teal),
                 )
                 ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>OtpScreen(countrycode: countryCode, number:_controller.text,),));
                  },
                  child: Text("Ok", style: TextStyle(fontSize: 14, color: Colors.teal)))
            ],
          );
        });
  }

  Future<void> showMydialogue2() {
    return showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "There is no number entered",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
            ),
            actions: [TextButton(onPressed: () {}, child: Text("Ok"))],
          );
        });
  }
}
