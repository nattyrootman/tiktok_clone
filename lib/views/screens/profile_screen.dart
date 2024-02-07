 

   import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends  StatefulWidget {
  const ProfileScreen({super.key});

  @override


  State<ProfileScreen> createState() => _nameState();
}

class _nameState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
       ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor:Colors.white,
      body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            
            
          // collapsedHeight:20,
           expandedHeight:200.0, 
          
            title: const Text('NestedScrollView with CustomScrollView'),
            floating: true,
            pinned: true,

            
            forceElevated: innerBoxIsScrolled,
          ),
        ];
      },
      body: CustomScrollView(
        dragStartBehavior:DragStartBehavior.start,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('List Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    )
    );
  }
}