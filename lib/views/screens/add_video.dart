
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/video_setup/pickvideo_controller.dart';
import 'package:tiktok_clone/views/screens/camer_screen.dart';

class AddVideoScreen  extends StatefulWidget {
  const AddVideoScreen({super.key});

  @override
  State<AddVideoScreen> createState() => _AddVideoScreen();
}

   
class _AddVideoScreen extends State<AddVideoScreen> {

  final pickVideoController= Get.put(PickVideoController());

  _SimpleDialog(BuildContext context){
 var textStyle=TextStyle(fontSize: 20);
        return showDialog(context: context, builder: (context){

          return SimpleDialog(
                children: [
                    
                  SimpleDialogOption(
                  onPressed: (){
                    pickVideoController.PickVideo(ImageSource.gallery);
                    print("is click");
                  },
                    child:
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(children:[
                    Icon(Icons.photo_album,size:40),
                    SizedBox(width: 5),
                    Text('Gallery',style: textStyle)
                   
                   ]),
                 )),
                  SimpleDialogOption(
                  onPressed: (){
                    
                     pickVideoController.PickVideo(ImageSource.camera);
                  },
                    child:
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(children:[
                    
                    Icon(Icons.camera,size:40),
                    SizedBox(width: 5),
                    Text('Camera',style: textStyle)
                   
                   ]),
                 )),

                SimpleDialogOption(
                  onPressed: (){
                      Navigator.pop(context);
                  },
                    child:
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(children:[
                    Icon(Icons.cancel,size:40),
                    SizedBox(width: 5),
                    Text('Annuler',style: textStyle)
                   
                   ]),
                 )),
                  
                ],
          );

        });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(child: InkWell(

        onTap: (){

            
            _SimpleDialog(context);

        },
        child: Container(
          //  margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width/1.5,
            height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.redAccent
            ),
            child: Center(child: Text('Add Video')),
        
        ),
      ),),

    );
  }
}