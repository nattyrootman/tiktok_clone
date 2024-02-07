

 import 'dart:ui';

import 'package:flutter/material.dart';

class SearchScreen  extends StatefulWidget {
    const SearchScreen ({super.key});
  
    @override
    State<SearchScreen > createState() => _SearchScreen ();
  }
  
  class _SearchScreen extends State<SearchScreen > {
    @override
    Widget build(BuildContext context) {
      var textStyle=TextStyle(fontSize: 12);
      return Scaffold(
      backgroundColor: Colors.white,

         appBar: AppBar(
         
               title:Row(
                      mainAxisSize:MainAxisSize.min,
                    
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(Icons.arrow_back),
                         Container(
                           //margin: EdgeInsets.symmetric(horizontal:),
                            padding: const EdgeInsets.all(20.0),
                            //height: 80,
                            width:250,
                           child: TextField(
                             selectionHeightStyle: BoxHeightStyle.tight,
                             
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 233, 210, 210),
                               filled:true,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search",
                              hintStyle: TextStyle(color:Colors.black),

                              
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5))
                            ),
                           ),
                         ),

                        Expanded(child: Text("Rechercher",style: TextStyle(color: Colors.redAccent,fontSize:15)))
                       ],
                     ),
         
         ),
          
        
          body: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
             
                   Container(

                    
                  
                    
                     
                   )
                
                
              



             
            ],
          ),
        
      );
    }
  }