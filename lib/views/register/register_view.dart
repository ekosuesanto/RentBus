import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_wizard/multi_wizard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:helloworld/views/auth/sign_in.dart';

class RegisterView extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: Builder(
          //     builder: (BuildContext context) {
          //       return IconButton(
          //         icon:
          //             const Icon(Icons.chevron_left, color: Color(0xFF000000)),
          //         onPressed: () {
          //           Scaffold.of(context).openDrawer();
          //         },
          //         tooltip:
          //             MaterialLocalizations.of(context).openAppDrawerTooltip,
          //       );
          //     },
          //   ),
          // ),
          body: SignUpForm()),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();
  final _formFullnameKey = GlobalKey<FormState>();
  final _formPasswordKey = GlobalKey<FormState>();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _fullnameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordConfirmController = new TextEditingController();
  late bool emailvalid, phonevalid, fullnamevalid, passwordvalid = false;

  String? _nameCtrl;
  String? _emailCtrl;
  String? _phoneCtrl;
  String? _passwordCtrl;
  String? _confirmpasswordCtrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          reverse: false,
          primary: false,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage(
                              'assets/onboarding/handing-out-offer-letter.png'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 30.0,
                          bottom: 0,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: MultiWizard(
                    steps: [
                      WizardStep(
                        showPrevious: false,
                        nextFunction: () {
                          if (_nameCtrl!.length >= 3) {
                            _formFullnameKey.currentState!.save();
                            
                          }
                          
                          
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                            top: 0.0,
                            bottom: 0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(
                            
                            top: 5.0,
                            
                          ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Please enter your",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Fullname.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Form(
                                    key: _formFullnameKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: _fullnameController,
                                      keyboardType: TextInputType.name,
                                      autovalidateMode:
                                          AutovalidateMode.always,
                                      decoration: InputDecoration(
                                          hintText: 'Your Fullname'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'You must have a Fullname!';
                                        } else if (value.length < 3) {
                                          return 'Your Fullname must be atleast 3 charachters long!';
                                        } 
                                        return null;
                                      },
                                      onChanged: (value) {
                                          if(value!.length > 2){ 
                                              setState((){
              _nameCtrl = value;
          });
                                          }else{
          setState((){
              _nameCtrl = null;
          }); 
                                              }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Already account? Please ",style: TextStyle(

                                          

                                          color: Colors.grey[600],

                                        ),),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            PageTransition(
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              reverseDuration:
                                                  Duration(milliseconds: 1500),
                                              type: PageTransitionType
                                                  .leftToRight,
                                              child: SignIn(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      WizardStep(
                        nextFunction: () {
                          if (_emailCtrl!.length > 7) {
                            _formEmailKey.currentState!.save();
                          }
                        },
                        previousFunction: () {
                            _formEmailKey.currentState!.reset();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                            top: 0.0,
                            bottom: 0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(
                            
                            top: 5.0,
                            
                          ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Please enter your",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Email.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Form(
                                    key: _formEmailKey,
                                    child: TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autovalidateMode:
                                          AutovalidateMode.always,
                                      decoration: InputDecoration(
                                          hintText: 'Your Email'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'You must have a Email!';
                                        } else if (value.length < 8) {
                                          return 'Your Email must be atleast 8 charachters long!';
                                        }else if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)){
          return 'Enter a valid email address';
        }
                                      },
                                      onChanged: (value) {
                                        if(value!.length > 7){ 
                                              setState((){
              _emailCtrl = value;
          });
                                          }else{
          setState((){
              _emailCtrl = null;
          }); 
                                              }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      WizardStep(
                        nextFunction: () {
                          if (_phoneCtrl!.length >= 8) {
                            _formPhoneKey.currentState!.save();
                          }
                        },
                        previousFunction: () {
                          _formPhoneKey.currentState!.reset();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                            top: 0.0,
                            bottom: 0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(
                            
                            top: 5.0,
                            
                          ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Please enter your",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Phone.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Form(
                                    key: _formPhoneKey,
                                    child: TextFormField(
                                      controller: _phoneController,
                                      keyboardType: TextInputType.phone,
                                      autovalidateMode:
                                          AutovalidateMode.always,
                                      decoration: InputDecoration(
                                          hintText: 'Your Phone'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'You must have a Phone!';
                                        } else if (value.length < 8) {
                                          return 'Your Phone must be atleast 8 charachters long!';
                                        }
                                      },
                                      onChanged: (value) {
                                        if(value!.length >= 8){ 
                                              setState((){
              _phoneCtrl = value;
          });
                                          }else{
          setState((){
              _phoneCtrl = null;
          }); 
                                              }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      WizardStep(
                        
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                            top: 0.0,
                            bottom: 0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(
                            
                            top: 5.0,
                            
                          ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Please enter your",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Password.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Form(
                                    key: _formPasswordKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _passwordController,
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          autovalidateMode: AutovalidateMode
                                              .always,
                                          decoration: InputDecoration(
                                              hintText: 'Your Password'),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'You must have a Password!';
                                            } else if (value.length < 6) {
                                              return 'Your Password must be atleast 6 charachters long!';
                                            }
                                          },
                                          onChanged: (value) {
                                            if(value!.length >= 6){ 
                                              setState((){
              _passwordCtrl = value;
          });
                                          }else{
          setState((){
              _passwordCtrl = null;
          }); 
                                              }
                                          },
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        TextFormField(
                                          controller: _passwordConfirmController,
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          autovalidateMode: AutovalidateMode
                                              .always,
                                          decoration: InputDecoration(
                                              hintText: 'Confirm your Password'),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'You must have a Password!';
                                            } else if (value.length < 6) {
                                              return 'Confirm your Password must be atleast 6 charachters long!';
                                            }else if (value != _passwordCtrl) {
                                              return 'Password don\'t ma!';
                                            }
                                          },
                                          onChanged: (value) {
 if(value!.length >=6 && value== _passwordCtrl){ 
           setState((){
              _confirmpasswordCtrl = value;
          });                         
 }else{
          setState((){
              _confirmpasswordCtrl = null;
          });           
                                              }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    finishFunction: () {
                      if (_formPasswordKey.currentState!.validate()) {
 if(_confirmpasswordCtrl!.length >=6 && _confirmpasswordCtrl == _passwordCtrl){ _formPasswordKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Welcome $_nameCtrl!'),
                          duration: Duration(seconds: 5),
                        ));
                                                                          }              
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
