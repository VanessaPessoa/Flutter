
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chats.dart';
import 'login.dart';

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;

  void initState(){
    _tabController = new TabController(length: 4, vsync: this);
    _scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login()
     

    );
  }

  Widget telaPrincipal (){
        return  Scaffold(
        body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool InnerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  Container(width: 15.0),
                  Icon(Icons.more_vert),
                  Container(width: 20.0),
                ],
                pinned: true,
                floating: true,
                centerTitle: false,
                title: Text('Whatsapp'),
                backgroundColor: Color(0xFF990033),
                bottom: TabBar(
                  indicatorWeight: 5.0,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                    tabs:[
                      Tab(
                        child: Icon(Icons.photo_camera),
                      ),
                      Tab(
                        text: 'CHATS',
                      ),
                      Tab(
                        text: 'STATUS',
                      ),
                      Tab(
                        text: 'CALLS',
                      ),
                ] )
              )
            ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
              Text(' '),
             Chats(),
              Text(' '),
              Text(' '),
          ],
        ),
      )
        );
  }
}
