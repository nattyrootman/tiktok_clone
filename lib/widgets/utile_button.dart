

import 'package:flutter/material.dart';

class CommunButton extends StatelessWidget {

  final  String text;
  final double width;
  final double height;
  final Color color;

  const CommunButton({super.key,required this.width,required this.height,required this.text,
  required this.color});

  @override
  Widget build(BuildContext context) {
    
    return Container(
       
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         Container(
          
            width: width,
            height:height,
             decoration: BoxDecoration(
              color:color,
              borderRadius: BorderRadius.circular(5)
             ),
            
           child: Center(child: Text(text,style: TextStyle(fontSize:20,color:Colors.black)),
          
           )),
          
        
          

      ])
      );


  
  }
  }
