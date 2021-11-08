import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/views/auth/sign_in.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class ViewMain extends StatefulWidget {
  const ViewMain({Key? key}) : super(key: key);
  @override
  _ViewMainState createState() => _ViewMainState();
}

List<String> _SelectedTab = ["Home", "History", "Promo", "Profile" ];

class _ViewMainState extends State<ViewMain> {
  bool showNotificationIcon = true;
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }
  final _formDepartureKey = GlobalKey<FormState>();
  final TextEditingController _departureController = new TextEditingController();
  final TextEditingController _arrivalController = new TextEditingController();
  
  final myProducts = List<String>.generate(5, (i) => 'Product $i');

  Widget _buildCustomProfil(String fullname, AssetImage logo, double logoSize, bool showNotificationIcon) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 15, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: logoSize,
                  height: logoSize,
                  child: Image(
                    image: logo,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        fullname,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          (showNotificationIcon)
              ? Container(
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                )
              : Container(
                  child: Text(""),
                ),
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _SelectedTab[selectedIndex],
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: 'Help Center',
              onPressed: () {
                // handle the press
              },
            ),
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return (selectedIndex==0) ? 
                  IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              )
            
                  : IconButton(
                icon: const Icon(Icons.chevron_left, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        extendBody: true,
        body:PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [ 
            SingleChildScrollView(
          physics: ScrollPhysics(),
          reverse: false,
          primary: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: new BoxDecoration(color: Colors.grey[200]),
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 24,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      color: Colors.blue[900],
                      // image: new DecorationImage(
                      //   image: AssetImage("assets/images/batik.png"),
                      //   colorFilter: new ColorFilter.mode(
                      //       Colors.red[700]!.withOpacity(0.9),
                      //       BlendMode.dstATop),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Column(
                      children: [
                        _buildCustomProfil(
                          "Eko Susanto",
                          AssetImage("assets/icon/default-user-icon.png"),
                          50.0,
                          true,
                        ),
                        SizedBox(height: 5),
                        Container(
                          margin: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                    left: 24,
                                    right: 24,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.redeem_outlined,
                                          color: Colors.red,
                                          size: 32.0,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "My Poin",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              child: Text(
                                                "3000",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: VerticalDivider(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                              new Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                    left: 24,
                                    right: 24,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.book_online_outlined,
                                          color: Colors.red,
                                          size: 32.0,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "My Trip",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              child: Text(
                                                "0",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                    right: 24,
                    left: 24,
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Form(
                            key: _formDepartureKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: true,
                              controller: _departureController,
                              keyboardType: TextInputType.name,
                              // autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.trip_origin_outlined,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                // filled: true,
                                hintText: 'Surabaya - Surabaya Bungur Asih',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintMaxLines: 1,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Form(
                            // key: _formDepartureKey,
                            // autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: true,
                              controller: _arrivalController,
                              keyboardType: TextInputType.name,
                              // autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.trip_origin_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                // filled: true,
                                hintText: 'Solo - Palur',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintMaxLines: 1,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 0.0,
                          child: new Stack(
                            overflow: // ignore: deprecated_member_use
                                Overflow.visible, // ignore: deprecated_member_use
                            children: [
                              new Positioned(
                                left: MediaQuery.of(context).size.width - 120,
                                top: -90,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey[200]),
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.swap_vert_outlined,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                              minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                    right: 24,
                    left: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book_online_outlined,
                              size: 30,
                              color: Colors.blue[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              // height: 28,
                              child: Text(
                                "Booking Ticket",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.luggage_outlined,
                              size: 30,
                              color: Colors.green[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              // height: 28,
                              child: Text(
                                "My Trip",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // height: 90,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_bus_outlined,
                              size: 30,
                              color: Colors.orange[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 28,
                              child: Text(
                                "Rental Bus",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // height: 90,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_activity_outlined,
                              size: 30,
                              color: Colors.deepPurple[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              // height: 28,
                              child: Text(
                                "Promo",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // height: 90,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.manage_search_outlined,
                              size: 30,
                              color: Colors.red[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              // height: 28,
                              child: Text(
                                "Check Ticket",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4,
                        // height: 90,
                        // decoration: BoxDecoration(
                        //     color: Colors.yellow.shade200,
                        //     border: Border.all(
                        //       color: Colors.yellow,
                        //       width: 3,
                        //     ),
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place_outlined,
                              size: 30,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              // height: 28,
                              child: Text(
                                "Nearest Agent",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 24,
                    left: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 30.0,
                        color: Colors.orange[500],
                      ),
                      Text(
                        "Latest Activity",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    right: 24,
                    left: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    
                    scrollDirection : Axis.horizontal, 
              // the number of items in the list
              itemCount: myProducts.length,
              shrinkWrap: true,

              // display each item of the product list
              itemBuilder: (context, index) {
                return Container( 
             margin: EdgeInsets.only(
                    top: 10,
                    bottom: 0,
                    right: (index < myProducts.length-1) ? 15 : 0,
                    left:(index > 0 ) ? 15 : 0,
                  ),
             decoration : BoxDecoration(color: Colors.white) , 
             
             width : MediaQuery.of(context).size.width * 0.7, 
                  // In many cases, the key isn't mandatory
                  key: UniqueKey(),
                  child:  Column(
                      
                      children: [ 
                         Padding( 
                             padding: EdgeInsets.all(20),child:Text(myProducts[index])),
                               Divider(),
                               Text(myProducts[index]) 
                               ]),
                );
              }),
                ), 
                Divider(),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    right: 24,
                    left: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.new_releases_outlined,
                        size: 28.0,
                        color: Colors.orange[500],
                      ),
                      Text(
                        "New Promo",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0,
                    bottom: 15,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(16),
                        ),
                        child: BannerCarousel.fullScreen(
                          banners: BannerImages.listBanners,
                          height: 180,
                          animation: true,
                          initialPage: 0,
                          // OR pageController: PageController(initialPage: 6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        Center( 
          child: Container( 
            child : Text("gdjdjfnfn") 
          ) 
        ), 
        Center( 
          child: Container( 
            child : Text("gdjfnfn") 
          ) 
        ),
        Center( 
          child: Container( 
            child : Text("gdjdzhdhdbdfnfn") 
          ) 
        ), 
        ], 
        ), 
        bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home_outlined,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.receipt_long_outlined,
            title: 'History',
          ),
          BarItem(
            icon: Icons.local_activity_outlined,
            title: 'Promo',
          ),
          BarItem(
            icon: Icons.account_circle_outlined,
            title: 'Profile',
          ),
        ],
      ),
      ),
    );
  }
}

class BannerImages {
  static const String banner1 = "assets/promo/00-20-48-images.jpg";
  static const String banner2 = "assets/promo/00-20-13-cM8cQYodWe.png";
  static const String banner3 = "assets/promo/00-18-27-images.jpg";
  static const String banner4 = "assets/promo/00-22-35-images.jpg";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}
  