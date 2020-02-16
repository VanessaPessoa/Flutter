import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: body(),
    );
  }

  Widget body(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Bem-vindo ao Whatsapp", style: TextStyle(color: Colors.greenAccent, fontSize: 20),),  
          Padding(padding: EdgeInsets.only(top:15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('./assets/inicial.login.png')
          ],
          ),
          Row(children: <Widget>[
            
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.greenAccent,
              child: Text('Fazer Login'),
              onPressed: (){
                //funcao
            }),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.orangeAccent,
              child: Text('Cadastrar'),
              onPressed: (){

            }
            )

          ],)
        ],
        ),
    );
  }
}