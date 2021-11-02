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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon:
                      const Icon(Icons.chevron_left, color: Color(0xFF000000)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
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
    
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  late bool emailvalid, phonevalid, fullnamevalid,passwordvalid = false;

  String? _nameCtrl;
  String? _emailCtrl;
  String? _phoneCtrl; 
  String? _passwordCtrl;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          reverse: false,
          primary: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width,
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
                  Container(
                    padding: EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 5.0,

                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: MultiWizard(
                        steps: [
                          WizardStep( 
                            showPrevious: false,
                            nextFunction: (){ 
                                if (!_formEmailKey.currentState!.validate()) {
                _formEmailKey.currentState!.save();
                                    }
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
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
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      decoration: InputDecoration(
                                          hintText: 'Your Email'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          emailvalid = false;
                                          return 'You must have a Email!';
                                        } else if (value.length < 8) {
                                          emailvalid = false;
                                          return 'Your Email must be atleast 8 charachters long!';
                                        } else {
                                          emailvalid = true;
                                        }
                                      },
                                      onChanged: (value) {
                                        _emailCtrl = value;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox( 
                                    height: 15,
                                ), 
                               Row( 
                                   mainAxisAlignment : MainAxisAlignment.end, 
                                    children : [ 
                                    Text("Already account? Please "), 
                                        GestureDetector ( 
                                        onTap:() { 
                                        Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration( milliseconds: 1500),
                      reverseDuration: Duration(milliseconds: 1500),
                    type: PageTransitionType.leftToRight,
                    child: SignIn(),
                  ),
                );
                                        }, 
child :                                       Text("Sign In", 
                                                   style: TextStyle( 
    fontWeight: FontWeight.bold,),), 
                                        ) , 
                                    ]
                                ), 
                              ],
                            ),
                          ),
                          WizardStep(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
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
                                      keyboardType:
                                      TextInputType.phone,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      decoration: InputDecoration(
                                          hintText: 'Your Phone'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          phonevalid = false;
                                          return 'You must have a Phone!';
                                        } else if (value.length < 8) {
                                          phonevalid = false;
                                          return 'Your Phone must be atleast 8 charachters long!';
                                        } else {
                                          phonevalid = true;
                                        }
                                      },
                                      onChanged: (value) {
                                        _phoneCtrl = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WizardStep(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
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
                                    child: TextFormField(
                                      controller: _fullnameController,
                                      keyboardType:
                                      TextInputType.text,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      decoration: InputDecoration(
                                          hintText: 'Your Fullname'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          fullnamevalid = false;
                                          return 'You must have a Fullname!';
                                        } else if (value.length < 8) {
                                          fullnamevalid = false;
                                          return 'Your Fullname must be atleast 8 charachters long!';
                                        } else {
                                          fullnamevalid = true;
                                        }
                                      },
                                      onChanged: (value) {
                                        _nameCtrl = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WizardStep(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
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
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType:
                                      TextInputType.text,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      decoration: InputDecoration(
                                          hintText: 'Your Password'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          passwordvalid = false;
                                          return 'You must have a Password!';
                                        } else if (value.length < 6) {
                                          passwordvalid = false;
                                          return 'Your Password must be atleast 6 charachters long!';
                                        } else {
                                          passwordvalid = true;
                                        }
                                      },
                                      onChanged: (value) {
                                        _passwordCtrl = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                              
                            ),
                          ),
                        ],
                        finishFunction: () {
              if (_formPasswordKey.currentState!.validate()) {
                _formPasswordKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Welcome $_nameCtrl!'),
                  duration: Duration(seconds: 5),
                ));
              }
            },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
