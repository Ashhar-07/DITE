import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start/FirstPage.dart';
import 'package:start/ForgotPassword.dart';
import 'package:start/HomePage.dart';
import 'package:start/SignUpPage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  // const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(value)  {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$");
    if(value.isEmpty) {
      return "Email required";
    }
    else {
      return null;
    }
    if(!regExp.hasMatch(value)) {
      return "Enter a valid Email Address";
    } else {
      return null;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          color: Colors.white,
          child: ProgressHUD(
            child: Builder(
                builder: (context) {
                  final progress = ProgressHUD.of(context);
                  return Form(
                    autovalidateMode: AutovalidateMode.always, key: _formKey,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          const Center(
                            child: ClipRRect(
                              child: SizedBox(

                                height: 150,
                                child: Image(image: AssetImage('Assets/images/logo.png'),
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'User Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Enter your details to Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),

                          Container(
                             color: Colors.grey[100],
                            margin: const EdgeInsets.all(10),
                            //height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black,),
                              cursorColor: Colors.black,
                              controller: emailController,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail,color: Colors.black,),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                labelText: "Email",
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                             color: Colors.grey[100],
                            margin: const EdgeInsets.all(10),
                            //padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,

                            child: TextFormField(
                              style: const TextStyle(color: Colors.black,),
                              validator: (input) {
                                if(input!.length<6) {
                                  return "Password required";
                                }
                                else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,)
                                ),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                              },
                              child: const Text(
                                'Forget your password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200.0,
                            child: MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(13.0),
                                    topRight: Radius.circular(13.0),
                                    bottomLeft: Radius.circular(13.0),
                                    topLeft: Radius.circular(13.0)),
                              ),
                              color: Colors.green[900],
                              onPressed: () async {
                                if(_formKey.currentState!.validate())
                                {
                                  progress!.showWithText("Logging In...");
                                  try {
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ).then((value) async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      await prefs.setString('uid', value.user!.uid);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No user found for that email."),));
                                    }
                                    else {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Incorrect Password"),));
                                    }
                                  }
                                  progress.dismiss();
                                }
                                // try {
                                //   await _auth.signInWithEmailAndPassword(
                                //       email: emailController.text, password: passwordController.text).then((value) {
                                //         print(value.user);
                                //   });
                                //
                                // } on FirebaseAuthException
                                // catch (e) {
                                //   print('Done');
                                // }


                              },
                              child: const SizedBox(
                                width: 200,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Row(
                              children: [
                              Text("Dont have an account?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                  },
                                  child: Text(" Sign Up",
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 20.0,fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      );
  }

  void signIn () {
    final formState = _formKey.currentState;
    if(formState!.validate())
    {

    }
  }
// Function to check and verify that password entered in registration and login are same or not
// Future loginData() async {
//   try {
//     await _auth
//         .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
//         .then((value) async {
//       if (value.user!.uid.isNotEmpty)
//         {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Authenticated"),));
//         }
//     });
//   } on FirebaseAuthException catch (error) {
//     print(error.code);
//     print(error.message);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text("The password is invalid or the user does not have a password."),));
//   }
// }

}










































































// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:start/FirstPage.dart';
// import 'package:start/util/ConstantData.dart';
// import 'package:start/util/ConstantWidget.dart';
// import 'package:start/util/PrefData.dart';
//
//
//
// import 'ForgotPassword.dart';
// import 'SignUpPage.dart';
// import 'generated/l10n.dart';
//
//
// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPage createState() {
//     return _SignInPage();
//   }
// }
//
// class _SignInPage extends State<SignInPage> {
//   bool isRemember = false;
//   // int themeMode = 0;
//   TextEditingController textNameController = new TextEditingController();
//   TextEditingController textPasswordController = new TextEditingController();
//
//
//   Future<bool> _requestPop() {
//     Navigator.of(context).pop();
//     return new Future.value(false);
//   }
//
//
//   @override
//   void initState() {
//
//     super.initState();
//     ConstantData.setThemePosition();
//     setState(() {
//
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//         child: Scaffold(
//
//           backgroundColor: cellColor,
//           appBar: AppBar(
//             backgroundColor: cellColor,
//             elevation: 0,
//
//             title: Text(""),
//             leading: GestureDetector(
//               onTap: (){
//                 _requestPop();
//               },
//               child: Icon(
//                 Icons.keyboard_backspace,
//                 color: textColor,
//               ),
//             ),
//           ),
//
//           body: Container(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getScreenPercentSize(context, 2.5)),
//             child: ListView(
//               children: [
//                 getTextWidget(
//                     S.of(context).signIn,
//                     // S.of(context).gladToMeetnyouAgain,
//                     textColor,
//                     TextAlign.left,
//                     FontWeight.bold,
//                     getScreenPercentSize(context, 4.2)),
//                 SizedBox(
//                   height: getScreenPercentSize(context, 2.5),
//                 ),
//
//
//
//
//                 getTextFiled( S.of(context).yourEmail, textNameController,false),
//                 getTextFiled( S.of(context).password, textPasswordController,true),
//
//                 //
//                 // getDefaultTextFiledWidget(
//                 //     context, S.of(context).yourEmail, textNameController),
//                 // getPasswordTextFiled(
//                 //     context, S.of(context).password, textPasswordController),
//
//
//                 InkWell(
//                   child: getTextWidget(
//                     S.of(context).forgotPassword,
//                     textColor,
//                     TextAlign.end,
//                     FontWeight.w600,
//                     getScreenPercentSize(context, 1.8),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ForgotPassword(),
//                         ));
//                   },
//                 )
// ,
//                 SizedBox(
//                   height: getScreenPercentSize(context, 4),
//                 ),
//
//                 getTextButtonWidget(context, S.of(context).signIn,
//                     Colors.orangeAccent, () {
//                   PrefData.setIsSignIn(true);
//                   PrefData.setIsIntro(false);
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
//                 }),
//
//
//                 // Padding(padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,.5)),child: Center(
//                 //   child: getTextWidget(
//                 //       S.of(context).or,
//                 //       textColor,
//                 //       TextAlign.center,
//                 //       FontWeight.w300,
//                 //       getScreenPercentSize(context, 1.8)),
//                 // ),),
//
//
//                 // getTextButtonWidget(context, S.of(context).signUpNow,
//                 //     primaryColor, () {
//                 //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                 // }),
//
//
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,.5)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//
//                       getTextWidget(
//                           S.of(context).dontHaveAnAccount,
//                           textColor,
//                           TextAlign.left,
//                           FontWeight.w500,
//                           getScreenPercentSize(context, 1.8)),
//
//                       SizedBox(
//                         width: getScreenPercentSize(context, 0.5),
//                       ),
//                       InkWell(
//                         child: getTextWidget(
//                             S.of(context).signUp,
//                             primaryColor,
//                             TextAlign.start,
//                             FontWeight.bold,
//                             getScreenPercentSize(context, 2)),onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                       },
//                       )
//
//                     ],
//                   ),
//                 )
//
//
//
//
//               ],
//             ),
//           ),
//         ),
//         onWillPop: _requestPop);
//   }
//
//   getTextFiled(String s,TextEditingController controller,bool isPass){
//     Color color = Colors.grey;
//     double editTextHeight = MediaQuery.of(context).size.height * 0.07;
//     double defaultMargin = getScreenPercentSize(context, 2);
//
//     return  StatefulBuilder(builder: (context, setState) {
//
//       return Container(
//         margin: EdgeInsets.symmetric(vertical: (defaultMargin)),
//         padding: EdgeInsets.only(right: (defaultMargin/1.5)),
//         height: editTextHeight,
//         child: Focus(
//           onFocusChange: (hasFocus) {
//             setState(() => color = !hasFocus ? primaryColor : Colors.grey);
//           },
//
//           child: TextField(
//             maxLines: 1,
//             obscureText: isPass,
//             controller: controller,
//             style: TextStyle(
//                 fontFamily: ConstantData.fontFamily,
//                 color: textColor,
//                 fontWeight: FontWeight.w400,
//                 fontSize: ConstantData.font18Px),
//
//
//             decoration: InputDecoration(
//               enabledBorder:  OutlineInputBorder(
//
//                 borderSide:  BorderSide(
//                     color: Colors.grey, width: 0.0),
//               ),
//
//               focusedBorder: OutlineInputBorder(
//
//                 borderSide:  BorderSide(
//                     color: primaryColor, width: 1),
//               ),
//               border: OutlineInputBorder(
//                 borderSide:  BorderSide(
//                     color: Colors.grey, width: 0.0),
//               ),
//
//               labelStyle: TextStyle(
//                   fontFamily: ConstantData.fontFamily,
//
//                   color:  color
//               ),
//
//
//               labelText: s,
//               // hintText: 'Full Name',
//             ),
//           ),
//         ),
//       );
//     },);
//   }
//
//
// }
