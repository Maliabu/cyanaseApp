import 'package:cyanaseapp/features/auth/views/forgot_password.dart';
import 'package:cyanaseapp/features/auth/views/login_with_passcode.dart';
import 'package:cyanaseapp/features/auth/views/sign_up.dart';
import 'package:flutter/material.dart';

Widget footer(BuildContext context){
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
        }
        , child: Text('Forgot Password')),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PasscodeLoginScreen()));

        }, child: Text('Login with Passcode')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Dont have an account?'),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));

          }, child: Text('Sign Up'))
        ],)
      ],
    ),
  );
}