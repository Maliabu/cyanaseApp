import 'package:cyanaseapp/features/auth/views/forgot_password.dart';
import 'package:cyanaseapp/features/auth/views/login_with_passcode.dart';
import 'package:cyanaseapp/features/auth/views/login_with_phone.dart';
import 'package:cyanaseapp/features/auth/views/sign_up.dart';
import 'package:flutter/material.dart';

Widget footer(BuildContext context, bool passcode){
  return Column(
    children: [
      if (passcode)
      TextButton(
        
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
      }
      , child: Text('Forgot Password', style: TextStyle(fontSize: 18),)),
      if (passcode)
      TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PasscodeLoginScreen()));
  
      }, child: Text('Login with Passcode', style: TextStyle(fontSize: 18),)),
      if (!passcode) 
      TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  
      }, child: Text('Login with a Phone Number!', style: TextStyle(fontSize: 18),)),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // when using constrained parents
            // opt for flexible children
            // to avoid overflow
            Flexible(
              child: Text(
                'Don\'t have an account?',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, letterSpacing: -1),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )
          ],
        )
    ],
  );
}