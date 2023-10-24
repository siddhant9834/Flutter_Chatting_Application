
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:my_chat_app/Screen/CameraView.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'VideoView .dart';
List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();

}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;

  Future<void>? camerasValue;

  bool isRecording=false;
  bool flash=false;
  bool isCameraFront=false;
  double transform=pi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    camerasValue = _cameraController?.initialize();
  }

  @override
  void dispose(){
    super.dispose();
    _cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: camerasValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,

                    child: CameraPreview(_cameraController!)
                    );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              ),
          Positioned(
            child: Container(

              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              // width: MediaQuery.of(context).size.width,
              child: Column(

                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon:  Icon(

                            flash? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                         onPressed: () {
                          setState(() {
                            flash=!flash;
                          }
                          );


                        //  flash? 
                        //       _cameraController
                        //       .setFlashMode(FlashMode.torch)
                        //       :_cameraController.setFlashMode(FlashMode.off);
                              flash
                                ? _cameraController!
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController?.setFlashMode(FlashMode.off);
                        },
                        ),

                      GestureDetector(
                        onLongPress: ()async {
                              // final path=join((await getTemporaryDirectory()).path, "${DateTime.now()}.mp4");
                              await _cameraController?.startVideoRecording();
                              setState(() {
                                isRecording=true;
                                // videopath=path;
                              });
                        },
                        onLongPressUp: () async {
                          XFile? videopath= await _cameraController?.stopVideoRecording();
                          setState(() {
                            isRecording=false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder)=>VideoViewPage( path: videopath!.path)));
                        } ,
                        onTap: () {
                          if(!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child:isRecording? Icon(
                          Icons.radio_button_on ,
                          color: Colors.red[900],
                          size: 90,
                        ):
                        const Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        onPressed: () async{
                          setState(() {
                            isCameraFront = !isCameraFront;
                            transform = transform + pi;
                          });
                          int cameraPos = isCameraFront?0:1;
                          _cameraController = CameraController(
                              cameras![cameraPos], ResolutionPreset.high);
                          camerasValue = _cameraController?.initialize();
                        },

                      )
                    ],
                  ),
            
                   SizedBox(
                    height: 4,
                     width: 0,
                  ),
                   Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,


              ),
                ],
              )
            ),

          )
        ],
      ),
    );

  }
  void takePhoto(BuildContext context) async{
    // final path=join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile? path = await _cameraController?.takePicture();
    
    Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraViewPage(path: path!.path
    )
    )
    );
  }
}
