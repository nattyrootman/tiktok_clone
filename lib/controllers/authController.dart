

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/main_screen/home.dart';
import 'package:tiktok_clone/models/user_model.dart';
import 'package:tiktok_clone/signs_screens/sign_in.dart';
import 'package:tiktok_clone/signs_screens/sign_up.dart';

class AuthController extends GetxController{

 static AuthController instance=Get.find();

     bool load=false;
     String filename='';
     String downloadURL='';
        


     late  Rx<User?>_user;

     User get user=>_user.value!;
     
     @override
      void onReady() {
        super.onReady();

        _user=Rx<User?>(firebaseAuth.currentUser);

        _user.bindStream(firebaseAuth.authStateChanges());

        ever(_user,userInitialize);

      }
   

 userInitialize(User?user){

    if (user==null) {

       Get.offAll(()=>SignUpScreen());
      
    } else{

       Get.offAll(()=>HomePage());

    }
 }

    Future<String>putData (Uint8List? uint8list)async{


    try {
   
        if(uint8list!=null){
        final meta= SettableMetadata(contentType: "imageg/jpg");

       final upload= fireStorage.ref().child("UserPhotos/$filename");

        upload.putData(uint8list);

         downloadURL= await upload.getDownloadURL();
       
             print("sucess :  $downloadURL");   


              

   }else{

     Get.snackbar("error" ,"something wrong happens");
            print("rien ne va "); 
   }
  


  
     }on FirebaseException catch(e){

        Get.snackbar("error", e.message!);
         print("${e.message!}" );


         return downloadURL;
    }

   catch (e) {
        
        Get.snackbar("error:file", e.toString());
          print( e.toString());

   }
 
    
    return downloadURL;

  }
   

     void SignUp(String name,String email ,String password,Uint8List ?uint8list)async{

      try {

        if (name.isNotEmpty&& email.isNotEmpty&& password.isNotEmpty&&uint8list!=null) {
          
      UserCredential userCredential= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

        String userPhoto=await putData(uint8list);

        UserModel userModel= UserModel(userName: name, userEamail: email, userPhoto: userPhoto, uid: userCredential.user!.uid);
          await fireStore.collection("users").doc(userCredential.user!.uid).set(userModel.toJson())
                .whenComplete(() => print("data uploade in collection"));
          

        }else{
          Get.snackbar("S'il vous plait !", "Les Champs doivent etre remplis");
        }
        
      }on FirebaseException catch(e){
           Get.snackbar("error", e.message!);
           
      }
      
       catch (e) {
            Get.snackbar("error", e.toString());
      }


     }



   void  Sign_In(String email,String password)async{

    try {
          if(email.trim().isNotEmpty && password.trim().isNotEmpty){

           await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
           .whenComplete(() =>  Get.snackbar("connected", " tu es mainteant connecté"));


         }else{

         Get.snackbar("error", " quelque chose ne va pas  Ressayer");
       }
    }on FirebaseException catch (e) {
        Get.snackbar("error", e.message!);

      
    }catch(e){
          
         Get.snackbar("error", e.toString());

    }

       


   }


}

