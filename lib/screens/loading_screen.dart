import 'package:clima/weather_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'info_screen.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState(){
    super.initState();
    getWeatherData();
  }



  void getWeatherData() async {
    var decodedData = await WeatherCondition().getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return InfoScreen(weatherData: decodedData);
    }));
      
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(child: SpinKitPouringHourglass(color: Colors.grey)
        
      ),
    ));
  }
}