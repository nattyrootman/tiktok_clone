import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/authController.dart';
import 'package:tiktok_clone/main_screen/home.dart';
import 'signs_screens/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';



    String  apiKey = "AIzaSyAwithdSIIiyveapJLP8IUN6webyQos_Lk";
   String authDomain="tiktokclone-b28b8.firebaseapp.com";
  String  projectId= "tiktokclone-b28b8";
   String storageBucket= "tiktokclone-b28b8.appspot.com";
  String  messagingSenderId="1058873296913";
   String appId="1:1058873296913:web:5204690eb09f07bbf609b0";


void main()async {
      
       WidgetsFlutterBinding.ensureInitialized();

      // await Firebase.initializeApp().then((value)=>Get.put(AuthController()));

      if (kIsWeb) {

        Firebase.initializeApp(options: FirebaseOptions(
          apiKey: apiKey, 
          appId: appId, 
          messagingSenderId: messagingSenderId,

           projectId: projectId)).then((value) => Get.put(AuthController()));
        
      }else{

          await Firebase.initializeApp().then((value)=>Get.put(AuthController()));

      }


  
  runApp(
    
     DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools
        
      ],
      builder: (context) => const   MyApp(),
    ));
    
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    
      theme: ThemeData.dark().copyWith(
       
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      
        scaffoldBackgroundColor: Colors.black), 

      home:SignUpScreen()
    );
  }
}
