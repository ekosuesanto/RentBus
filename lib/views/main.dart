import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/views/auth/sign_in.dart';
class ViewMain extends StatefulWidget
{
  const ViewMain({Key? key}) : super(key: key);
  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:SingleChildScrollView(
          physics: ScrollPhysics(),
          
          reverse: false,
          primary: false,
          child: Container( 
            width : MediaQuery.of(context).size.width, 
            child: Text("Home"),
          ),
        ), 
      ),
    );
  }
}