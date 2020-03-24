import 'package:clima/constants.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/weather_condition.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({this.weatherData});
  var weatherData;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int temperature;
  String conditionIcon;
  String cityName;
  String backgroundImage;
  @override
  void initState() {
    super.initState();
    setWeatherAttributes(widget.weatherData);
  }

  WeatherCondition customCondition = WeatherCondition();

  void setWeatherAttributes(data) {
    setState(() {
      //double temperatureDouble = data["main"]["temp"];
      temperature = data["main"]["temp"];
      int condition = 800; //data["weather"][0]["id"];
      conditionIcon = customCondition.getConditionIcon(condition);
      backgroundImage = customCondition.getBackground(condition);
      cityName = data["name"];

      print(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/$backgroundImage.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '$temperature',
                        style: kTempStyle,
                      ),
                      Container(
                          child: Image.asset(
                        'images/$conditionIcon.png',
                        width: 200.0,
                      )),
                    ]),
              

              Align(
                alignment: Alignment.bottomCenter,
                              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RawMaterialButton(onPressed: () async{
                      var weatherData = await customCondition.getWeatherData();
                      setWeatherAttributes(weatherData);
                    },
                    child: Icon(Icons.edit_location, size: 20.0, color: Colors.white,),
                    constraints: BoxConstraints(minHeight: 30.0, minWidth: 30.0),
                    fillColor: Colors.orangeAccent,
                    ),

                    RawMaterialButton(onPressed: () async {
                      dynamic  typedName = Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityPage();
                      }));

                      var decodedData = await  customCondition.getCityWeatherData(typedName);
                      setWeatherAttributes(decodedData);
                    },
                    child: Icon(Icons.location_city, size: 20.0, color: Colors.white,),
                    constraints: BoxConstraints(minHeight: 30.0, minWidth: 30.0),
                    fillColor: Colors.orangeAccent,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
