import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/whatsappHome.dart';


void main() => runApp(Home());


class Chats extends StatefulWidget{
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats>{

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemBuilder: (context, index){
        }
    );
  }
}

