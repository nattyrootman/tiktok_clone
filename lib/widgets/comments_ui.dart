


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';

class CommentsDialog extends StatefulWidget {

  final String? id;
  const CommentsDialog({super.key,this.id});

  @override
  State<CommentsDialog> createState() => _CommentsDialogState();
}

class _CommentsDialogState extends State<CommentsDialog> {


  TextEditingController editController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    final controler=Get.put(CommentController());
     controler.updateComment(widget.id!);
    var textStyle=TextStyle(color:Colors.black);

    String len="";


    return Scaffold(
      
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          
          margin: EdgeInsets.only(left: 75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
           children: [
             Text(len),
             Icon(Icons.close)
           ],
                 ),
        ),),
      body:Obx(() { return SizedBox(
        
        width: double.infinity,
        height:MediaQuery.of(context).size.height/1.5,
      
        child:    Dialog.fullscreen(
          child: Column(
            children: [
              Expanded(
            
                child: ListView.builder(
                  
                   itemCount:  controler.getCommentList().length,
                  itemBuilder: (context,int index){
                      
                     var data= controler.getCommentList();
                    var uid= authController.user.uid;
                       
                       len=controler.getCommentList().length.toString();
    
                     return ListTile(
                       
                       leading: CircleAvatar(child:Image.network(data[index].userPhoto)),
                        title: Text(data[index].userName,style:textStyle),
                        subtitle: Text(data[index].comment,style:textStyle),
                        trailing: Column(children: [
                          InkWell(
                            onTap: ()=>controler.likedComments(data[index].id),
                            child: Icon(Icons.favorite,color: data[index].likes.contains(uid)?Colors.red:Colors.grey)),
                          Text("${data[index].likes.length}")
                        ]),
                     
                     );
                     
                
                }),
              ),

               
              

              Container(
               // alignment: Alignment.topCenter,

               margin: EdgeInsets.only(top:5),
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration( 
                //color:Colors.grey,

                border: Border(top:BorderSide(color: Colors.grey.shade400))
              
                
                 
                ),
                
              child: Row(    
                  
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     
                      Icon(Icons.person,color:Colors.black),

                     
                     Container(
                      
                      padding: EdgeInsets.all(15.0),
                       width:260,
                       //alignment: Alignment.center,
                       child: TextField(
                        controller:editController,
                          style: TextStyle(color:Colors.black),
                          decoration: InputDecoration(
                            
                            fillColor: Color.fromARGB(255, 238, 198, 198),

                            hintText: 'comment something',
                               filled: true,
                            
                                border:OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)
                                  
                                )
                            )
                          
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            controler.PostComments(editController.text);    
                              editController.text="";
                          },
                          child:Icon(Icons.send,color:Colors.blue)),
              
                   ],
                 ),
               )
       
          
      

                        
              
            ],
          )
        )
       
      );
      
      })
    );
  }
}