// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:start/Models/user_model.dart';
// import 'package:start/SignInPage.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;
//
//   // string for displaying the error Message
//   String? errorMessage;
//
//
//   // our form key
//   final _formKey = GlobalKey<FormState>();
//   // editing Controller
//   final firstNameEditingController = new TextEditingController();
//   final secondNameEditingController = new TextEditingController();
//   final emailEditingController = new TextEditingController();
//   final passwordEditingController = new TextEditingController();
//   final confirmPasswordEditingController = new TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     //first name field
//     final firstNameField = TextFormField(
//         autofocus: false,
//         controller: firstNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("First Name cannot be Empty");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid name(Min. 3 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.account_circle),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "First Name",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));
//
//     //second name field
//     final secondNameField = TextFormField(
//         autofocus: false,
//         controller: secondNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Second Name cannot be Empty");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           secondNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.account_circle),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Second Name",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));
//
//     //email field
//     final emailField = TextFormField(
//         autofocus: false,
//         controller: emailEditingController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Your Email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Please Enter a valid email");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.mail),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));
//
//     //password field
//     final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordEditingController,
//         obscureText: true,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Password is required for login");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Password(Min. 6 Character)");
//           }
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.vpn_key),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));
//
//     //confirm password field
//     final confirmPasswordField = TextFormField(
//         autofocus: false,
//         controller: confirmPasswordEditingController,
//         obscureText: true,
//         validator: (value) {
//           if (confirmPasswordEditingController.text !=
//               passwordEditingController.text) {
//             return "Password don't match";
//           }
//           return null;
//         },
//         onSaved: (value) {
//           confirmPasswordEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.vpn_key),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Confirm Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));
//
//     //signup button
//     final signUpButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.redAccent,
//       child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
//             signUp(emailEditingController.text, passwordEditingController.text);
//           },
//           child: Text(
//             "SignUp",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           )),
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () {
//             // passing this to our root
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                         height: 180,
//                         child: Image.asset(
//                           "Assets/gggg.png",
//                           fit: BoxFit.contain,
//                         )),
//                     SizedBox(height: 45),
//                     firstNameField,
//                     SizedBox(height: 20),
//                     secondNameField,
//                     SizedBox(height: 20),
//                     emailField,
//                     SizedBox(height: 20),
//                     passwordField,
//                     SizedBox(height: 20),
//                     confirmPasswordField,
//                     SizedBox(height: 20),
//                     signUpButton,
//                     SizedBox(height: 15),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void signUp(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//           Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
//   postDetailsToFirestore() async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values
//
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//
//     UserModel userModel = UserModel();
//
//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.firstName = firstNameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;
//
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account created successfully :) ");
//
//   }
//
// }






















import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:start/FirstPage.dart';
import 'package:start/SignInPage.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  _getSharedPref() async {
    // print(myKey);
  }
  late User user;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(value)  {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$");
    if(value.isEmpty) {
      return "Email required";
    }
    if(!regExp.hasMatch(value)) {
      return "Enter a valid Email Address";
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ProgressHUD(
          child: Builder(
              builder: (context) {
                final progress = ProgressHUD.of(context);
                return Form(
                  autovalidateMode: AutovalidateMode.always, key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Create Account!',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          color: Colors.grey[100],
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black,),
                            controller: _nameController,
                            validator: (input) {
                              if(input!.isEmpty) {
                                return "Name required";
                              }
                              else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
                              labelText: "Name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        mail(0,"Email",_emailController),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          color: Colors.grey[100],
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,

                        ),
                        label(1,"Password",_passwordController),
                        const SizedBox(
                          height: 10.0,
                        ),
                        lab(2, "Confirm Password",_repasswordController),
                        const SizedBox(
                          height: 15.0,
                        ),

                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                            ],
                          ),
                        ),
                        //
                        SizedBox(
                          height: 50,
                          width: 200,
                          // width: MediaQuery.of(context).size.width * 0.95,
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
                              _getSharedPref();
                              if(_formKey.currentState!.validate())
                              { progress!.showWithText("Signing Up...");
                              try {
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ).then((value) {
                                  print("USER CREATED ${value.user!.email}");
                                  createRecord(value.user);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text("The account already exists for that email."),));
                                }
                              } catch (e) {
                                print(e);
                                // print(e);
                              }
                              progress.dismiss();
                              }
                            },

                            child: const SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70.0,
                        ),
                        // Container(
                        //   child: Row(
                        //     children: [
                        //     Text("Already have an account?",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 20.0,
                        //       ),
                        //     ),
                        //       InkWell(
                        //         onTap: () {
                        //           Get.to(SignInPage());
                        //         },
                        //         child: Text(" Sign In",
                        //           style: TextStyle(
                        //             color: Colors.green[900],
                        //             fontSize: 20.0,fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        //   ),
                        // ),
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
  Widget label (int index, String s, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: const TextStyle(color: Colors.black,),
        controller: controller,
        validator: (input) {
          if(input!.length<6) {
            return 'Password must be at least 6 characters';
          }
          if(input.isEmpty) {
            return "Empty";
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: s,
          //  hintText: "Description of the new classroom",
        ),
      ),
    );
  }

  Widget lab (int inx, String w, TextEditingController control) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: const TextStyle(color: Colors.black,),
        controller: control,
        validator: (val) {
          print(val);
          print(_passwordController.text);
          if(val!.isEmpty) {
            return "Empty";
          }
          if (val != _passwordController.text) {
            return "Password does not match";
          }
          // return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: w,
          //  hintText: "Description of the new classroom",
        ),
      ),
    );
  }

  Widget mail (int i, String e, TextEditingController emailController) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: const TextStyle(color: Colors.black,),
        controller: emailController,
        validator: validateEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: e,
        ),
      ),
    );
  }




  //This code is to create or update data in database
  void createRecord(User? user) async {
    await FirebaseFirestore.instance.collection("Data").doc(user!.uid)
        .set({
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });
  }
// DocumentReference ref = await databaseReference.collection("Osama")
//     .add({
//   'title': 'Flutter',
// });
// print(ref.id);

// void deleteRecord(User? user) async {
//   await FirebaseFirestore.instance.collection("Osama").doc(user!.uid)
//       .set({
//     'name': _nameController.text,
//     'email': _emailController.text,
//     'password': _passwordController.text,
//   });
// }


}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //   bool isRemember = false;
// //   int themeMode = 0;
// //   TextEditingController textEmailController = new TextEditingController();
// //   TextEditingController myController = new TextEditingController();
// //   TextEditingController textNameController = new TextEditingController();
// //   TextEditingController textPasswordController = new TextEditingController();
// //
// //
// //
// //
// //
// //   Future<bool> _requestPop() {
// //
// //     if(Platform.isIOS){
// //       exit(0);
// //     }else{
// //       SystemNavigator.pop();
// //     }
// //   //   Future.delayed(const Duration(milliseconds: 200), () {
// //   //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
// //   //   });
// //
// //     return new Future.value(false);
// //   }
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     ConstantData.setThemePosition();
// //     setState(() {
// //
// //     });
// //     // setTheme();
// //   }
// //   // setTheme()async{
// //   //   themeMode = await PrefData.getThemeMode();
// //   //   setState(() {
// //   //
// //   //   });
// //   // }
// //   String? validateEmail(value)  {
// //     RegExp regExp = RegExp(
// //         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
// //         r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
// //         r"{0,253}[a-zA-Z0-9])?)*$");
// //     if(value.isEmpty) {
// //       return "Email required";
// //     }
// //     if(!regExp.hasMatch(value)) {
// //       return "Enter a valid Email Address";
// //     } else {
// //       return null;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     SizeConfig().init(context);
// //
// //     double height = MediaQuery.of(context).size.height * 0.07;
// //
// //
// //     double radius = getPercentSize(height, 7);
// //
// //
// //     return WillPopScope(
// //         child: Scaffold(
// //
// //           backgroundColor: cellColor,
// //           appBar: AppBar(
// //             backgroundColor: cellColor,
// //             elevation: 0,
// //
// //             title: Text(""),
// //             leading: Icon(
// //               Icons.keyboard_backspace,
// //               color: textColor,
// //             ),
// //           ),
// //           body: Container(
// //             padding: EdgeInsets.symmetric(
// //                 horizontal: getScreenPercentSize(context, 2.5)),
// //             child: ListView(
// //               children: [
// //                 getTextWidget(
// //                     "Create Account!",
// //                     textColor,
// //                     TextAlign.left,
// //                     FontWeight.bold,
// //                     getScreenPercentSize(context, 4.2)),
// //                 SizedBox(
// //                   height: getScreenPercentSize(context, 2.5),
// //                 ),
// //
// //
// //
// //                 getTextFiled( S.of(context).yourName, textNameController,false),
// //                 getTextFiled( S.of(context).yourEmail, textEmailController,false),
// //
// //
// //
// //
// //
// //                 Row(
// //                   mainAxisSize: MainAxisSize.max,
// //                   children: [
// //                     Container(
// //                       height :height,
// //                       margin: EdgeInsets.only(right: 7),
// //                       padding: EdgeInsets.symmetric(horizontal: 5),
// //                       decoration: BoxDecoration(
// //
// //
// //
// //                         borderRadius: BorderRadius.all(
// //                           Radius.circular(radius),
// //                         ),
// //
// //                         border: Border.all(color: Colors.grey,width: 0.0),
// //                       ),
// //                       child: CountryCodePicker(
// //                         boxDecoration: BoxDecoration(
// //                           color: cellColor,
// //
// //                         ),
// //                         closeIcon: Icon(Icons.close,
// //                             size: getScreenPercentSize(context, 3),
// //                             color: textColor),
// //
// //                         onChanged: (value) {
// //                           // countryCode = value.dialCode;
// //                           // print("changeval===$countryCode");
// //                         },
// //                         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
// //                         initialSelection: 'IN',
// //                         searchStyle: TextStyle(
// //                             color: textColor,
// //                             fontFamily: ConstantData.fontFamily),
// //                         searchDecoration: InputDecoration(
// //                             border: UnderlineInputBorder(
// //                               borderSide:
// //                               BorderSide(color: textColor),
// //
// //                             ),
// //                             hintStyle: TextStyle(
// //                                 color: textColor,
// //                                 fontFamily: ConstantData.fontFamily)),
// //                         textStyle: TextStyle(
// //                             color: textColor,
// //                             fontFamily: ConstantData.fontFamily),
// //                         dialogTextStyle: TextStyle(
// //                             color:textColor,
// //                             fontFamily: ConstantData.fontFamily),
// //
// //                         showFlagDialog: true,
// //                         hideSearch: true,
// //                         comparator: (a, b) => b.name!.compareTo(a.name!),
// //
// //                         onInit: (code) {
// //                           // countryCode = code.dialCode;
// //
// //                         },
// //                       ),
// //                     ),
// //
// //
// //
// //                     Expanded(
// //                       child: Container(
// //
// //                         padding: EdgeInsets.only(left: 7),
// //                         margin: EdgeInsets.only(left: 7),
// //                         alignment: Alignment.centerLeft,
// //                         // decoration: BoxDecoration(
// //                         //   color: cellColor,
// //                         //
// //                         //
// //                         //   borderRadius: BorderRadius.all(
// //                         //     Radius.circular(radius),
// //                         //   ),
// //                         // ),
// //
// //                         child: getTextFiled("Phone Number",myController,false),
// //                         // child: TextField(
// //                         //   // controller: myController,
// //                         //   onChanged: (value) async {
// //                         //     try {} catch (e) {
// //                         //       print("resge$e");
// //                         //     }
// //                         //   },
// //                         //   decoration: InputDecoration(
// //                         //       contentPadding:
// //                         //       EdgeInsets.only(left: getWidthPercentSize(context, 2)),
// //                         //
// //                         //       border: InputBorder.none,
// //                         //       focusedBorder: InputBorder.none,
// //                         //       enabledBorder: InputBorder.none,
// //                         //       errorBorder: InputBorder.none,
// //                         //       disabledBorder: InputBorder.none,
// //                         //       hintText: S.of(context).phoneNumber,
// //                         //       hintStyle: TextStyle(
// //                         //           fontFamily: ConstantData.fontFamily,
// //                         //           color: textColor,
// //                         //           fontWeight: FontWeight.w400,
// //                         //           fontSize: getPercentSize(height, 25))),
// //                         //   style: TextStyle(
// //                         //       fontFamily: ConstantData.fontFamily,
// //                         //       color: textColor,
// //                         //       fontWeight: FontWeight.w400,
// //                         //       fontSize: getPercentSize(height, 25)),
// //                         //   keyboardType: TextInputType.number,
// //                         //   inputFormatters: <TextInputFormatter>[
// //                         //     FilteringTextInputFormatter.digitsOnly
// //                         //   ], // Only numbers can be entered
// //                         // ),
// //                       ),
// //                       flex: 1,
// //                     )
// //                   ],
// //                 ),
// //
// //
// //                 getTextFiled( S.of(context).password, textPasswordController,true),
// //
// //
// //
// //                 // getPasswordTextFiled(
// //                 //     context, S.of(context).password, textPasswordController),
// //
// //                 SizedBox(
// //                   height: getScreenPercentSize(context, 2),
// //                 ),
// //
// //                 getTextButtonWidget(context, S.of(context).signUp,
// //                     primaryColor, () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneVerification(),));
// //                 }),
// //
// //                 SizedBox(
// //                   height: getScreenPercentSize(context, 12),
// //                 ),
// //
// //
// //
// //
// //
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //
// //                     getTextWidget(
// //                         S.of(context).youHaveAnAlreadyAccount,
// //                         textColor,
// //                         TextAlign.left,
// //                         FontWeight.w500,
// //                         getScreenPercentSize(context, 1.8)),
// //
// //                     SizedBox(
// //                       width: getScreenPercentSize(context, 0.5),
// //                     ),
// //                     InkWell(
// //                       child: getTextWidget(
// //                           S.of(context).signIn,
// //                           primaryColor,
// //                           TextAlign.start,
// //                           FontWeight.bold,
// //                           getScreenPercentSize(context, 2)),onTap: (){
// //                       Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
// //                     },
// //                     )
// //
// //                   ],
// //                 )
// //
// //
// //
// //               ],
// //             ),
// //           ),
// //         ),
// //         onWillPop: _requestPop);
// //   }
// //
// //   getTextFiled(String s,TextEditingController textEmailController,bool isPass){
// //     Color color = Colors.grey;
// //
// //     double editTextHeight = MediaQuery.of(context).size.height * 0.07;
// //     double defaultMargin = getScreenPercentSize(context, 2);
// //
// //     return  StatefulBuilder(builder: (context, setState) {
// //
// //       return Container(
// //         margin: EdgeInsets.symmetric(vertical: (defaultMargin)),
// //         padding: EdgeInsets.only(right: (defaultMargin/1.5)),
// //         height: editTextHeight,
// //         child: Focus(
// //           onFocusChange: (hasFocus) {
// //             setState(() => color = hasFocus ? primaryColor : Colors.grey);
// //           },
// //
// //           child: TextFormField(
// //             validator: validateEmail,
// //             // maxLines: 1,
// //             // obscureText: isPass,
// //             controller: textEmailController,
// //             keyboardType: TextInputType.emailAddress,
// //             style: TextStyle(
// //                 fontFamily: ConstantData.fontFamily,
// //                 color: textColor,
// //                 fontWeight: FontWeight.w400,
// //                 fontSize: ConstantData.font18Px),
// //
// //
// //             decoration: InputDecoration(
// //               enabledBorder:  OutlineInputBorder(
// //
// //                 borderSide:  BorderSide(
// //                     color: Colors.grey, width: 0.0),
// //               ),
// //
// //               focusedBorder: OutlineInputBorder(
// //
// //                 borderSide:  BorderSide(
// //                     color: primaryColor, width: 1),
// //               ),
// //               border: OutlineInputBorder(
// //                 borderSide:  BorderSide(
// //                     color: Colors.grey, width: 0.0),
// //               ),
// //
// //               labelStyle: TextStyle(
// //                   fontFamily: ConstantData.fontFamily,
// //
// //                   color:  color
// //               ),
// //
// //
// //               labelText: s,
// //               // hintText: 'Full Name',
// //             ),
// //           ),
// //         ),
// //       );
// //
// //     },
// //     );
// //   }
// //
// //
// //
// // }
