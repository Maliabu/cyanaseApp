import 'package:cyanaseapp/core/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';

Widget header(BuildContext context){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Image(image: AssetImage('assets/images/logo.png'), height: 30, width: 30,),
    Text('Investments made easy at Cyanase Investors!', style: TextStyle(fontSize: ResponsiveHelper.responsiveFontSize(context: context, sm: 30, md: 35, lg: 50), fontWeight: FontWeight.bold, height: 1),)
    ]
  );
}