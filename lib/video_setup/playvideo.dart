



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:video_player/video_player.dart';

class  PlayVideo  extends StatefulWidget {

   final String ?videoUrl;
    const PlayVideo ({super.key,required this.videoUrl});
  
    @override
    State<PlayVideo> createState() => _PlayVideo ();
  }
  
  class _PlayVideo extends State<PlayVideo > with SingleTickerProviderStateMixin{


  late VideoPlayerController _playerController;

   late final Player player=Player();
   late final  VideoController controller=VideoController(player);

   late AnimationController _animationController;





       void myPlayer()async{
  
      _playerController=VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
 
       _playerController.initialize();
       _playerController.play();
       _playerController.setVolume(2);
       _playerController.setLooping(true);
   
     
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

      myPlayer();


  }



  
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _playerController.dispose();
  }




    
      @override
      Widget build(BuildContext context) {
         
         return Container(  

             width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:BoxDecoration(
                color: Colors.black
              ),

            child: VideoPlayer(_playerController)
            );

      }
    }