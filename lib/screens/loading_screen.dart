import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/get_location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String appId = '85ff4615f486565669089860b52c9e13';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLocation locObj = GetLocation();
    await locObj.getLocation();
    NetworkHelper networkObj = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${locObj.latitude}&lon=${locObj.longitude}&appid=$appId&units=metric');
    var networkData = await networkObj.getNetwordData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(locData: networkData,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
