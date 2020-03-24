import 'package:flutter/material.dart';
import 'package:clima/constants.dart';


class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String typedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/city.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
        )),
        constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Icon(Icons.arrow_back, size: 30.0, color: Colors.orangeAccent),

                  
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: TextField(
                  onChanged: (value){
                    typedName = value;
                  },
                  decoration: kInputDecoration
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: FlatButton(child: Text("Get weather", style:TextStyle(color: Colors.white)),
                color: Colors.orangeAccent,
                onPressed: (){
                  Navigator.pop(context, typedName);
                },
                )
              )
            ],
          ),
        )
      )
    );
  }
}