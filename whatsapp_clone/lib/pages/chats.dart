import 'package:flutter/material.dart';

class Chats extends StatefulWidget{
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats>{

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index){
          return Container(
            


          );
        },
    );
  }
}