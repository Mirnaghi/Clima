import 'constants.dart';
import 'package:clima/network_helper.dart';
import 'package:clima/screens/location.dart';


class WeatherCondition{

  Future<dynamic>getCityWeatherData(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?&q=$cityName&appid=$kApiKey&units=metric');
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherData() async {
    Location position = Location();
    await position.getCurrentLocation();

    var latitude = position.latitude;
    var longtitude = position.longtitude;

    NetworkHelper networkHelper = NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$kApiKey&units=metric');
    var decodedData = await networkHelper.getData();

    return decodedData;
  }
  String getConditionIcon(condition){
    if(condition >=200 && condition < 300){
      return "thunderstorm";
    }
    else if(condition >=300 && condition < 500){
      return "drizzle";
    }
    else if(condition >=500 && condition < 600){
      return "rain";
    }
    else if(condition >= 600 && condition < 700){
      return "snow";
    }
    else if(condition >= 700 && condition < 800){
      return "mist";
    }else{
      return "sun";
    }
  }

  String getBackground(condition){
    if (condition >= 200 && condition < 800){
      return "cloudy";
    }
    else{
      return "sunny";
    }
  }
}