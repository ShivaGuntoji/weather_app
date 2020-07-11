import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  final locData;
  LocationScreen({this.locData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  int id;
  WeatherModel weatherObj=WeatherModel();
  String message;
  String icon;
  @override
  void initState() {
    super.initState();
    getDetails(widget.locData);
  }
  void getDetails(dynamic locDetails)
  {

    double tem=locDetails['main']['temp'];
    setState(() {
      if(locDetails == null)
      {
        temperature= 0;
        cityName='Errror';
        icon='?';
        return;
      }
      print('here');
      temperature=tem.toInt();
      cityName=locDetails['name'];
      id=locDetails['weather'][0]['id'];
      icon=weatherObj.getWeatherIcon(id);
      message=weatherObj.getMessage(temperature);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async {
                        print("insetstate");
                        var temp= await weatherObj.climateData();
                        getDetails(temp);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedCity= await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if(typedCity != null)
                        {
                            var getData=await weatherObj.climateDataByCity(typedCity);
                          getDetails(getData);
                         }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
