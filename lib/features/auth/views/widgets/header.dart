import 'package:cyanaseapp/core/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';

Widget header(BuildContext context){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Image(image: AssetImage('assets/images/logo.png'), height: 30, width: 30,),
    Text('Investments made easy at Cyanase Investors!', style: TextStyle(fontSize: ResponsiveHelper.responsiveFontSize(context: context, sm: 35, md: 40, lg: 50), fontWeight: FontWeight.w700, height: 1, letterSpacing: -2),)
    ]
  );
}