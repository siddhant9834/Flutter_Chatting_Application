import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color.fromARGB(255, 243, 239, 239),
            margin: EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 80, bottom: 30, top: 5),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
// SizedBox(height: 50,),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Text("20:20",
                      style: TextStyle(fontSize: 12, color: Colors.grey[500])),
// SizedBox(width: 10,),
// Icon(Icons.done_all, size: 16, color: Colors.blue,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
