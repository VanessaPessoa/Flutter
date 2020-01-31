import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

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
      home: Scaffold(
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
          controller: _tabController ,
          children: <Widget>[
              Text(' '),
             Chats(),
              Text(' '),
              Text(' '),
          ],
        ),
      )
      ) ,
    );
  }

}

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

