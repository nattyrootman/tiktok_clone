

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:tiktok_clone/widgets/comments_ui.dart';

import '../controllers/videolist_controller.dart';

class AnimatedCirclePhoto extends StatelessWidget {

 String id;
 final profilePhoto;
   List likes;
 final int Comments;
 final int shared ;
 final AnimationController animationController;
   AnimatedCirclePhoto({
     super.key,
     required this.id,
    required this.profilePhoto,
    required this.likes,
    required this.Comments,
     required this.shared,
     required this.animationController });
 
   @override
   Widget build(BuildContext context) {
     double size=40;

     final videoListContoller= Get.put(VideoListContoller());

        var  heightSize=MediaQuery.of(context).size;

        final controler=Get.put(CommentController());
   
     
     return  Container(
      
       width: 65,
      //height: MediaQuery.of(context).size.height/1.2,
       child:Column(
       
       mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
        
            Stack(children: [
              
                Positioned(child: Container(
                    width: 45,
                    height: 45,
                  child:CircleAvatar(child: Image.network(profilePhoto)),
                  )),
                  Positioned(
                    top:30,
                    left:5,
                    right:5,
                      
                  
                    child:Container(
                      decoration: BoxDecoration(
                      
                      color:Colors.red,
                      borderRadius: BorderRadius.circular(100),
                ),
                      
                      child:Icon(Icons.add)
              
                  ))
                  
              ],),
            
              SizedBox(height: 18),
                 
            Column(children: [
              InkWell( onTap: ()=>videoListContoller.likeVideo(id),

                child:Icon(Icons.favorite,size:40,color:likes.contains(firebaseAuth.currentUser!.uid)?Colors.red:Colors.white
                )
                // Icon( likes==0?Icons.favorite:Icons.favorite,color: Colors.red,size:40)
                 ),

                
               Text("${likes.length}"),
               SizedBox(height: 18)
               
            ],),
            Column(children: [
              InkWell(
                 onTap: (){
                     
                     showModalBottomSheet(
                     
                      useSafeArea: true,
                        isScrollControlled: true,
                      constraints: BoxConstraints.expand(height:heightSize.height/1.2 ),
                      context: context, builder: (_){
                      return  CommentsDialog(id:id);

                     });
                      
                     

                    
                 },

                child: Icon(Icons.comment,size:40)),
                
               Text("$Comments")
            ],),
              
              SizedBox(height: 18),
            Column(children: [Icon(Icons.share,size: 40),
               Text("$shared")
            ],),
            SizedBox(height: 20),
            RotationTransition(turns: Tween(begin: 0.0,end: 1.0).animate(animationController),
              
                  child: Container(
                   width: 45,
                   height: 45,
                  
                  decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [Colors.grey,Colors.white])    
                  ),
                  
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(25),
                        child: Image.asset("assets/avatar.png")
                      ),
                    
                  
                              
                ),
              
            )
           
       ]),
      

     );
   }
 }
