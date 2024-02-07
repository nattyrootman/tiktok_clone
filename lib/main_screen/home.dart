


import 'package:flutter/material.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';
import 'package:tiktok_clone/views/screens/add_video.dart';
import 'package:tiktok_clone/views/screens/message.dart';
import 'package:tiktok_clone/views/screens/search_screen.dart';
import 'package:tiktok_clone/views/screens/videos_screen.dart';

class HomePage extends  StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  
    int currentIndex=0;
   List<Widget>pages=[
    const  VideoScreen(),
    const SearchScreen(),
    const AddVideoScreen(),
    const MessageScreen(),
     ProfileScreen()

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20.5,
        unselectedItemColor:Colors.white,
        selectedItemColor: Colors.redAccent,
         selectedLabelStyle: TextStyle(fontSize: 10),
         unselectedLabelStyle: TextStyle(fontSize: 10),
        showSelectedLabels: true,
        elevation: 10.0,
        onTap: (int index){
            
            setState(() {
              currentIndex=index;
              
            });
        },
        items:const [

       BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home)),

       BottomNavigationBarItem(
         label: "Explore",
        icon: Icon(Icons.explore)),

       BottomNavigationBarItem(
          label: "Add",
        
        icon: Icon(Icons.rotate_right)),
        
       BottomNavigationBarItem(
        label: "Boite de Reception",
        icon: Icon(Icons.message)),

       BottomNavigationBarItem(
        label: "Personn",
        icon: Icon(Icons.person))


      ]),
       
       body: pages[currentIndex],

    );
  }
}
