
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreen();
}

class _CameraScreen extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      
      children: [
         
        
             Container(
                 
             
                margin: EdgeInsets.only(left:20,top:40),
                padding:EdgeInsets.all(8.0),
               child: Row(
                  
                 children: [
                   Icon(Icons.close),
                    SizedBox(width: 150,),

                  Icon(Icons.music_note_rounded),
                 ],
               ),
             ),
         
           
        
        
       Container( alignment: Alignment.topRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.cameraswitch_outlined),
            SizedBox(height: 30,),
           Container(
              
            child : Row(
              children: [
                Icon(Icons.speed),
              ],
            ))
          ],
        )),
        
    ]);

      
  }
} 