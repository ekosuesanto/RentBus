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
  Widget _buildCustomProfil (String fullname, AssetImage logo, {bool showNotificationIcon = false}) {
    return Container( 
      child: Row ( 
        mainAxisAlignment : MainAxisAlignment.spaceBetween, 
        children : [ 
          Container( 
            child: Row( 
              Container( 
                  child : Image(image: AssetImage(logo)),
              ), 
              Container( 
                  child : Text(fullname),
              ), 
            ), 
          ) , 
          (showNotificationIcon) ? 
            Container( 
              child : Icon(Icons.beach_access,
      color: Colors.grey,
      size: 20.0, )
            ) : Container(child : Text("")), 
        ], 
      ),
    );
  }
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
            
            child: Column( 
              
              crossAxisAlignment : CrossAxisAlignment.start, 
              children : [ 
                Container( 
                    child:_buildCustomProfil("Eko Susanto","assets/icon/default-user-icon.png",showNotificationIcontru = true ),
                ),
                Container( 
                    child:Text("Container 2"),
                ),
                Container( 
                    child:Text("Container 3"),
                ),
              ], 
            ),
          ),
        ), 
      ),
    );
  }
}