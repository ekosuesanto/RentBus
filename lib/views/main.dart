import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/views/auth/sign_in.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class ViewMain extends StatefulWidget
{
  const ViewMain({Key? key}) : super(key: key);
  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> { 
  bool showNotificationIcon = true;
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  
  
  Widget _buildCustomProfil (String fullname, AssetImage logo, double logoSize,bool showNotificationIcon) {
    return Container( 
      padding : EdgeInsets.only(top: 50,bottom:15,right: 24,left: 24) , 
      child: Row ( 
        mainAxisAlignment : MainAxisAlignment.spaceBetween, 
        children : [ 
          Container( 
            child: Row( 
              children : [ 
                Container( 
                  width : logoSize, 
                  height : logoSize, 
                  child : Image(image: logo),
                ), 
                SizedBox(width: 5), 
                Container( 
                  child :Column( 
                    crossAxisAlignment : CrossAxisAlignment.start, 
                    children :[ 
                      Text("Welcome!",style: TextStyle(fontSize: 12,fontWeight :FontWeight.bold,color:Colors.grey) ) , 
                      Text(fullname,style: TextStyle(fontSize: 18,fontWeight :FontWeight.bold) ),
                    ], 
                  ), 
                ), 
              ], 
            ), 
          ) , 
          (showNotificationIcon) ? 
            Container( 
              child : Icon(Icons.notifications_outlined,
      color: Colors.grey,
      size: 24.0, )
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
                    child: _buildCustomProfil("Eko Susanto",AssetImage("assets/icon/default-user-icon.png"),50.0,true),
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
      bottomNavigationBar:  DotNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.purple,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.orange,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.teal,
            ),
            
          ],
        ),
    );
  }
}