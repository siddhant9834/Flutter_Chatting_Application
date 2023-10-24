import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_chat_app/CustomCR/OwnMessage.dart';
import 'package:my_chat_app/CustomCR/reply_card.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:my_chat_app/Model/ChatModel.dart';

import '../Model/MessageModel.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

// import 'package:my_chat_app/CustomCR/CustomCard.dart';
class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel, required this.sourChat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel? sourChat;


  @override
  _IndividualPageState createState() => _IndividualPageState();


}

class _IndividualPageState extends State<IndividualPage> {

    bool show = false;
    FocusNode focusNode = FocusNode();
    IO.Socket? socket; 
    bool sendButton=false;
    List<MessageModel> messages = [];
  // IO.Socket socket;
  //
    ScrollController _scrollController=ScrollController();
TextEditingController _controller = TextEditingController();

    void initState(){
      super.initState();
      // print("init==============************");
      connect();
    }

  void connect(){
    socket=IO.io('http://192.168.89.1:5000',<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
      "forceNew":true,
    });
    socket?.connect();
    socket?.emit("signin", widget.sourChat?.id);
    socket?.onConnect((data) {
      print("Connected");
      socket?.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);

      });

    });
    print(socket?.connected);
  }
  void sendMessage(String message, int sourceId, int targetId){
      setMessage("source", message);
    socket?.emit("message", {"message":message,"sourceId":sourceId,"targetId":targetId});
  }

  void setMessage(String type, String message){

      MessageModel messageModel=MessageModel(type: type, message: message, time: DateTime.now().toString().substring(10, 16));
      setState(() {
        setState(() {
          messages.add(messageModel);
        });
      });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/tw0nawnvo0zpgm5nx4fp.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,

        ),
        Scaffold(
          backgroundColor: Colors.blueGrey[100],
          appBar: AppBar(
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.arrow_back),
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup!
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      color: Colors.white,
                      height: 37,
                      width: 37,
                    ))
              ]),
            ),
            title: Container(
              margin: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name.toString(),
                      style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        // textAlign: TextAlign.left,
                        // alignment: Alignment.center,
                      ),
                    ),
                    const Text("Last Seen Today at 4:00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        )),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "View Contacts",
                    child: Text("View Contacts"),
                  ),
                  const PopupMenuItem(
                    value: "Media, Links,and docs",
                    child: Text("Media Links and Docs"),
                  ),
                  const PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  const PopupMenuItem(
                    value: "Mute Notification",
                    child: Text("Mute Notification"),
                  ),
                  const PopupMenuItem(
                    value: "Disappering Message",
                    child: Text("Disappering Messages"),
                  ),
                  const PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                  const PopupMenuItem(
                    value: "More",
                    child: Text("More"),
                  ),
                ];
              })
            ],
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height-150,
                    child: ListView.builder(
                      shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if(index==messages.length){
                          return Container(
                            height: 70,
                          );
                        }
                        if(messages[index].type=="source"){
                          return OwnMessageCard(message: messages[index].message,
                            time:messages[index].time
                          );
                        }
                        else{
                          return ReplyCard(message: messages[index].message,
                              time:messages[index].time
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 70,
                                margin: const EdgeInsets.all(5),

                                // height: 50,
                                child: Card(
                                  //

                                  margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                  elevation: 5,
                                  borderOnForeground: true,
                                  // color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    // side: BorderSide(
                                    //   color: Colors.none,
                                    // ),
                                    borderRadius:
                                        BorderRadius.circular(30.0), //<-- SEE HERE
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    controller: _controller,
                                    onChanged: (value){
                                      if(value.length>0){
                                        setState(() {
                                          sendButton=true;

                                        });
                                      }
                                      else{
                                        setState(() {
                                          sendButton=false;

                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.emoji_emotions),
                                      ),
                                      // prefixIcon:
                                      // IconButton(onPressed: () {}, icon: Icon(Icons.email_rounded)),

                                      hintText: "Type a message",
                                      suffixIcon: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                backgroundColor: Colors.transparent,
                                                  context: context,
                                                  builder: (builder) => bottomsheet());
                                            },
                                            icon: const Icon(Icons.attach_file),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.camera),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.mic),
                                          ),
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.all(18),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, right: 5, left: 2),
                                child: CircleAvatar(
                                  radius: 25,
                                  child: IconButton(

                                    icon: Icon(
                                      sendButton? Icons.send:Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed:(){
                                      if(sendButton){
                                        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration:
                                        Duration(microseconds: 300), curve: Curves.easeOut);
                                        sendMessage(
                                            _controller.text,
                                            widget.sourChat?.id??0,
                                            widget.chatModel?.id??0
                                          );
                                        setState((){
                                          sendButton=false;
                                        }
                                         );
                                        _controller.clear();
                                      }
                                    }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget bottomsheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                  iconcreation(
                      Icons.camera_alt, Colors.pinkAccent, "Camera"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                  iconcreation(
                      Icons.insert_photo, Colors.purple, "Gallery"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.headset, Colors.orange, "Audio"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                  iconcreation(
                      Icons.location_pin, Colors.pink, "Location"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                  iconcreation(
                      Icons.person, Colors.blue, "Contact"
                  ),
                  const SizedBox(
                    width:40,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text){
    return InkWell(
      // customBorder: new CircleBorder(),
      onTap: () {},
      splashColor: Colors.red,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              // Icons.insert_drive_file,
              icon,
              size: 29,
              color: Colors.white,

            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Text("Document"),
          Text(text),
        ],

      ),
    );
  }

  // Widget emojiSelect() {
  //   return EmojiPicker(
  //     // rows: 4,
  //     // columns: 7,

  //     onEmojiSelected: (emoji, category) {
  //       print(emoji);
  //     },
  //   );
  // }
  // Widget buildSticker() {
  //   return EmojiPicker(
  //     // rows: 3,
  //     // columns: 7,
  //     // buttonMode: ButtonMode.MATERIAL,
  //     // recommendKeywords: ["smile", "fruit"],
  //     // numRecommended: 10,
  //     onEmojiSelected: (emoji, category) {
  //       print(emoji);
  //     },
  //   );
  // }
}
