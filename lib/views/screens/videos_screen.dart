


// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:tiktok_clone/controllers/videolist_controller.dart';
import 'package:tiktok_clone/video_setup/playvideo.dart';
import 'package:video_player/video_player.dart';
import 'package:read_more_text/read_more_text.dart';

import '../../widgets/proile_animated_photo.dart';

class  VideoScreen  extends StatefulWidget {
    const VideoScreen ({super.key});
  
    @override
    State<VideoScreen> createState() => _VideoScreen ();
  }
  
  class _VideoScreen extends State<VideoScreen > with SingleTickerProviderStateMixin{


  late VideoPlayerController _playerController;

   late final Player player=Player();
   late final  VideoController controller=VideoController(player);

   late AnimationController _animationController;


    @override
  void initState() {
    // TODO: implement initState
    super.initState();


          _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 5000));
          _animationController.forward();
          _animationController.repeat();
  

  }




  


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

    @override
    Widget build(BuildContext context) {

      var textStyle=TextStyle(fontSize: 20,fontWeight: FontWeight.w900);
      final videoListContoller= Get.put(VideoListContoller());
      return SafeArea(
        child: Scaffold(
        
          
          body: Obx(() { 
             
              return PageView.builder(
                itemCount: videoListContoller.videoList.length,
                scrollDirection: Axis.vertical,
                controller: PageController(initialPage: 0,viewportFraction: 1.0),
                itemBuilder: (context,int index){

                  var data=videoListContoller.videoList[index];


                  return Stack(
            
            children: [

             Positioned(
                top: 2,
                left: 0,
                right: 0,
               
               child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height:MediaQuery.of(context).size.height/1.2,
                      child: PlayVideo (videoUrl: data.videourl)
                     ),
             ),
            
             Positioned(
                  top: 5,     
                  right:40,
                  
          child:Row(
            children:[
            Text("Abonnements",style: textStyle,),
            SizedBox(width: 15,),
             Text("Pour toi",style: textStyle,),
             SizedBox(width: 25),
             Icon(Icons.search,size: 25,)
          ])

             ),

            
          Positioned(
              right:1,
           // top: MediaQuery.of(context).size.height/2.9,
            bottom: 10,
            child:AnimatedCirclePhoto(
              id: data.id,
            profilePhoto: data.userPhoto,
            likes: data.likes,
            Comments: data.commentsCount,
            shared: data.shareCount,
            animationController: _animationController,
          )),


        Positioned(
          bottom: 5,
          left: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
              
               Text(data.userName),
              
            ReadMoreText(
                          data.caption,
                            numLines: 1,
                            readMoreText: 'Read more',
                            readLessText: 'Read less',
               ),
             
                 Row(
                   children: [
                       Icon(Icons.music_note,color: Colors.white,),
                       Text(data.songName),
               ],
             )
            
          
            ],),
        )

          ],);
                  

                });
            
    })),
      );
    }
  }