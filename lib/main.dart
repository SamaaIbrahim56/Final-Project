import 'package:flutter/material.dart';
import 'package:sama/Final_Project/Screens/Screen3.dart';
import 'Final_Project/LoginScreen.dart';
import 'Final_Project/Screens/HomeScreen.dart';
import 'Final_Project/Screens/Screen2.dart';
main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      routes: {
        "Screen2":(context)=>Screen2(),
        "HomeScreen":(context)=>HomeScreen(),
        "Screen3":(context)=>Screen3(),
        "Navigator":(context)=>BottomNavigation(),
        "Data":(context)=>loginScreen(),

      },
        debugShowCheckedModeBanner: false,
        home:  loginScreen(),
    );

}
}
