

import 'package:flutter/material.dart';
class ButtonWidget   extends StatelessWidget {

 final String? uid;
  const ButtonWidget({super.key,this.uid});

  @override
  Widget build(BuildContext context) {
  //  final profileController=Get.put( ControllerProfile());

    return Container(
       
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         InkWell(
          onTap: (){
          

          },
          child: Container(
            
            width: 160,
            height: 50,
             decoration: BoxDecoration(
              color:Colors.red,
              borderRadius: BorderRadius.circular(5)
             ),
            
            
           child: Center(child: Text(
            //uid==authController.user.uid?" Sign  Out ":
            //profileController.userFollowers.isFollowing?'Unfollow':'Follow',
           "",
           style: TextStyle(fontSize:20)))
           ),
        ),
           
           SizedBox(width:5),
         Container(
           width: 45,
           height: 50,
          decoration: BoxDecoration(
            color:Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5)
           ),
          
          child: Icon(Icons.arrow_drop_down,size: 40,color:Colors.black))

      ],)


    );
  }
}