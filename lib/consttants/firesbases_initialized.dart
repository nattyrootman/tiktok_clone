


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../controllers/authController.dart';

var firebaseAuth= FirebaseAuth.instance;
var fireStore= FirebaseFirestore.instance;
var fireStorage=FirebaseStorage.instanceFor(bucket: "gs://tiktokclone-b28b8.appspot.com");

var authController=Get.put(AuthController());

//AuthController.instance;
//.put(AuthController());




