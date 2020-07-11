import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);
const kBorderDecoration =  InputDecoration(
icon: Icon(
Icons.location_city,
color: Colors.white,
size: 30,
),
border:  OutlineInputBorder(
borderRadius: const BorderRadius.all(
const Radius.circular(10.0),
),
borderSide: BorderSide.none,
),

fillColor: Colors.white,
filled: true,
hintText: 'Enter City Name',
hintStyle: TextStyle(
color: Colors.grey,
// fontWeight: FontWeight.bold,
fontSize: 25),
);