import 'package:flutter/material.dart';

Widget header(BuildContext context){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Image(image: AssetImage('assets/images/logo.png'), height: 30, width: 30,),
    Text('Investments made easy at Cyanase Investors!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 1),)
    ]
  );
}