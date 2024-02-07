
// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
 import 'package:media_kit/media_kit.dart';
 import 'package:media_kit_video/media_kit_video.dart';
import 'package:tiktok_clone/controllers/uploadvideo_controller.dart';
import 'package:tiktok_clone/widgets/utile_button.dart';
import 'package:video_player/video_player.dart';
 class ConfirmVideo extends StatefulWidget {

   final Uint8List? uint8list;
   final String? videoPath;
   const ConfirmVideo({super.key,this.uint8list, this.videoPath});
 
   @override
   State<ConfirmVideo> createState() => _nameState();
 }
 
 class _nameState extends State<ConfirmVideo> {
      
   late final Player player=Player();
   late final  VideoController controller=VideoController(player);

  late VideoPlayerController _playerController;


    TextEditingController _sonName=TextEditingController();

  TextEditingController _songCaption=TextEditingController();

  String input="";
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        myPlayer();

         
  }

    void myPlayer()async{

     try {

       
          if(widget.uint8list!=null ||widget.videoPath!=null){
      
              player.open(Media(widget.videoPath!));
           await player.play();

        
    }else{

          Get.snackbar("title","somthing wrong went happened"); 
    }

       
     } catch (e) {
      Get.snackbar("title",e.toString());
       
     } 
     
    }

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

      //player.dispose();
      _playerController.dispose();
  }

   @override
   Widget build(BuildContext context) {

   var  textStyle=TextStyle(fontSize: 15,color: Colors.black,);
  
   String description="description";
   var size=MediaQuery.of(context).size;

   final upcontroller=Get.put(UplaodVideoController());
     return Scaffold(
     
     body:Column(
          mainAxisSize: MainAxisSize.max,
      children: [
                     
                     SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/1.2,
                    child:Video(controller: controller)
                   ),
                   SizedBox(height: 3),

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                     children: [
                       InkWell(
                        onTap: (){

                          showModalBottomSheet(context: context, builder: (_){
                             
                             return Dialog.fullscreen(child: Container(
                            
                              color: Colors.grey.shade300,
                              width: double.infinity,height:MediaQuery.of(context).size.height/2.5,
                              child: Column(children: [

                                  TextField(

                                    controller: _songCaption,
                                    maxLines: 4,
                                    maxLength: 100,

                                  ),

                                  InkWell(
                                    onTap: (){
                                         setState(() {

                                    input=_songCaption.text;
                                           
                                         });
                                      
                                       Navigator.pop(context);
                                    },
                                    child: CommunButton(width:MediaQuery.of(context).size.width/1.5, height: 50, text:"Enregister",
                                     color: Colors.redAccent),
                                  )
                                 
                              ],),
                              
                              ),
                               
                              );
                              

                          });
                       
                          
                        },
                         child: Container(
                                             
                          height: 35,
                            width: size.width/2.5,
                            margin: EdgeInsets.only(left:15),
                            padding: EdgeInsets.all(8.0),
                           decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25)
                          
                           ),
                           child: Text(input,style: textStyle,overflow: TextOverflow.ellipsis,textAlign:TextAlign.center),
                         ),
                       ),
                        
                          SizedBox(height: 3,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          
                         InkWell(

                               onTap: (){
                                upcontroller.fireStoreDoc(_sonName.text,input,widget.uint8list);

                                    Navigator.pop(context);
                               },
                          child: CommunButton(width:size.width/2.4 , height:50, text: "Publier", color: Colors.grey.shade300)),


                         CommunButton(width:size.width/2.4 , height:50, text: "Suivant", color: Colors.redAccent)


                        ],)

                     ],
                   )

                   
         
              ]),
       

     

     );
     
     
     
     
   }
 }