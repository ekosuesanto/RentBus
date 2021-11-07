import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
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

enum _SelectedTab { home, favorite, search, person }

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
                      Text("Welcome!",style: TextStyle(fontSize: 12,fontWeight :FontWeight.bold,color:Colors.white70) ) , 
                      Text(fullname,style: TextStyle(fontSize: 18,fontWeight :FontWeight.bold,color:Colors.white) ),
                    ], 
                  ), 
                ), 
              ], 
            ), 
          ) , 
          (showNotificationIcon) ? 
            Container( 
              child : Icon(Icons.notifications_outlined,
      color: Colors.white,
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
        extendBody: true,
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
                  padding : EdgeInsets.only(bottom:30,) , 
                  decoration: new BoxDecoration(
    borderRadius: new BorderRadius.only(
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    color: Colors.redAccent,
  ),
                    child: Column( 
                        children : [ 
                            _buildCustomProfil("Eko Susanto",AssetImage("assets/icon/default-user-icon.png"),50.0,true),
                          Container( 
                            width : MediaQuery.of(context).size.width * 0.8,
                             
                            decoration: new BoxDecoration(
    borderRadius: new BorderRadius.only(
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    color: Colors.white,
  ),
                              child : Row ( 
                                mainAxisAlignment :MainAxisAlignment.start, 
                                children : [  
                                  Container( 
                                    padding : EdgeInsets.only(top: 20,bottom:20,right: 30,left: 30) , 
                                    width : MediaQuery.of(context).size.width * 0.4 - 8,
                                    child : Text("Row 1"), 
                                  ),
                                  VerticalDivider(),
                                  Container( 
                                    padding : EdgeInsets.only(top: 20,bottom:20,right: 30,left: 30) , 
                                    width : MediaQuery.of(context).size.width * 0.4 - 8,
                                    child : Row( children : [ 
                                    Container( 

              child : Icon(Icons.redeem_outlined,

      color: Colors.white,

      size: 24.0, ), ), 
                                    Container( 

              child : Column( 
                children : [ 
                  Span(child: Text("My Poin")),
                  SizedBox(width: 15), 
                  Span(child: Text("3000", style : TextStyle(fontWeight :fontWeight.bold,fontSize:30,color: Colors. white)), 
                ], 
              ),), 
                                    ],), 
                                  ),
                                ], 
                              ) 
                          ), 
                        ], 
                    ),
                ),
                SizedBox( height: 24), 
                
                Container(
                  padding : EdgeInsets.only(top: 0,bottom:15,right: 20,left: 20) , 
                  child: Column( 
                    crossAxisAlignment : CrossAxisAlignment.start, 
                    children : [ 
                      Container(
                        child : Text("New Promo") 
                      ),
                      Container ( 
                          decoration: new BoxDecoration(
    borderRadius: new BorderRadius.circular(16),
    
  ),
                          child: BannerCarousel.fullScreen(
            banners: BannerImages.listBanners,
            height: 150,
            animation: true,
            initialPage: 0,
            // OR pageController: PageController(initialPage: 6),
          ),
                        ), 
                      
                    ], 
                  ),
                ),
                Container( 
                    child:Text("Container 3"),
                ),
              ], 
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
      ),
      
    );
  }
}
class BannerImages {
  static const String banner1 =
      "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg";
  static const String banner2 =
      "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg";
  static const String banner3 = "https://wallpaperaccess.com/full/19921.jpg";
  static const String banner4 =
      "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}