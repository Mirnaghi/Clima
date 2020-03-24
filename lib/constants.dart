import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const kApiKey = '9f75e5323c7e9dbd7bb8215185c7fa30';

const TextStyle kTempStyle = TextStyle(
  fontSize: 90.0,
  fontWeight: FontWeight.w700,
  color: Colors.orangeAccent,
);

const InputDecoration kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
  hintText: "Enter city name",
  hintStyle: TextStyle(color: Colors.grey),
);
