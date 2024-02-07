


import 'package:flutter/material.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen ({super.key});

  @override
  State<MessageScreen > createState() => _nameState();
}

class _nameState extends State<MessageScreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(title: ElevatedButton(onPressed: ()=>firebaseAuth.signOut(), child:Text("Log Out")),),
      body: Center(child: Text("Message"),),
    );
  }
}