import 'package:flutter/material.dart';

Widget header(BuildContext context){
  return Container(
    padding: EdgeInsets.all(16),
    child: Center(child: 
    Image(image: AssetImage('assets/images/logo.png'), height: 60, width: 60,),)
  );
}