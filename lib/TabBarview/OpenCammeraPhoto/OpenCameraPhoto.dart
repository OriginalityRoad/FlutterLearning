import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';


class OpenCammeraPhoto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OpenCammeraPhotoState();
  }
}

class OpenCammeraPhotoState extends State<OpenCammeraPhoto> {
  var _cammeraImagePath;
  var _photoImagePath;
  var _pickVideoPath;
  VideoPlayerController _controller;
  bool _isPlaying = false;

  String url = 'http://www.iqiyi.com/v_1a81zi8t90g.html';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    _controller = VideoPlayerController.asset('1598853041217063.mp4',package: 'flutter_app_fist_assets',)
//    // 播放状态
//      ..addListener(() {
//        final bool isPlaying = _controller.value.isPlaying;
//        if (isPlaying != _isPlaying) {
//          setState(() { _isPlaying = isPlaying; });
//        }
//      })
////     在初始化完成后必须更新界面
//      ..initialize().then((_) {
//        setState(() {});
//      });
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("调用相机相册"),
      ),
      body: _showCammeraMessage(),
    );
  }

  Widget _showCammeraMessage() {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    openCammeraServer();
                  },
                  child: Text("打开相机"),
                  color: Colors.orangeAccent,
                ),
                MaterialButton(
                  onPressed: () {
                    openPhotoServer();
                  },
                  child: Text("打开相册"),
                  color: Colors.greenAccent,
                ),
                MaterialButton(
                  onPressed: () {
                    openCammeraVideoServer();
                  },
                  child: Text("录制视频"),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
//          Container(
//            child: Column(
//              children: <Widget>[
//                Container(
//                  child: ,
//
//                ),
//
//
//
//
//              ],
//
//            ),
//          ),
          SizedBox(
            child: Container(
              color: Colors.orangeAccent,
              child: _cammeraImagePath !=null ? Image.file(
                _cammeraImagePath,


              ) : Text("显示相机拍下的照片"),
            ),
            height: 200,
//          child: ,
          ),
          SizedBox(
            child: Container(
              color: Colors.greenAccent,
              child:  _photoImagePath !=null ? Image.file(
                _photoImagePath,

              ) : Text("显示相册选择的照片",
              ),
            ),
            height: 200,
          ),


          _pickVideoPath !=null ? _showpickVideoView(): new Container(),

          _pickVideoPath !=null ? MaterialButton(onPressed: (){


            print(_controller.value.isPlaying);
            _controller.value.isPlaying
                ? _controller.pause
                : _controller.play;
          },
            color: Colors.lightBlueAccent,

            child: new Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),


          ): new Container(),



        ],
      ),
    );
  }
Widget _showpickVideoView(){
    return Container(
      color: Colors.amberAccent,
      child: SizedBox(
        height: 200,
        child: Container(
          child:  _controller.value.isPlaying
          // 加载成功
              ? new AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ) : new Container(
            color: Colors.deepPurpleAccent,
          ),

        ),
      ),

    );

}

  void openCammeraServer() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _cammeraImagePath =image;
    });

   }

  Future openPhotoServer() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _photoImagePath =image;
    });
    print("openPhotoServer=== \t $image");

  }
  void openCammeraVideoServer() async {
    var pickVideo = await ImagePicker.pickVideo(source: ImageSource.camera);



    _controller = VideoPlayerController.file(pickVideo)..addListener(() {
      final bool isPlaying = _controller.value.isPlaying;
      if (isPlaying != _isPlaying) {
        setState(() { _isPlaying = isPlaying; });
      }
    })..initialize().then((_) {
      setState(() {
        _pickVideoPath =pickVideo;

      });




      _controller.play();

    });

    print(pickVideo);

  }



} //class
