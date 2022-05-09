import 'package:start/fit/screens/forget_password/forget_password.dart';
import 'package:start/fit/screens/register_screen/register_screen.dart';
import 'package:start/fit/widgets/color_remover.dart';
import 'package:start/fit/widgets/cus_bottom_bar.dart';
import 'package:start/fit/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/fit/images/5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xff1c1b20),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const Register()));
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        "+ ",
                                        style: TextStyle(
                                          fontSize: 18,
                                         // color: kFirstColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // RichText(
                            //   text: TextSpan(
                            //     text: 'Sign in\t',
                            //     style: const TextStyle(
                            //       fontFamily: "Bebas",
                            //       fontSize: 20,
                            //     ),
                            //     children: <InlineSpan>[
                            //       WidgetSpan(
                            //           alignment: PlaceholderAlignment.baseline,
                            //           baseline: TextBaseline.alphabetic,
                            //           child: SizedBox(width: 33.w)),
                            //       const TextSpan(
                            //         text: 'ELEMENT',
                            //         style: TextStyle(color: kFirstColor),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Fit Fitness",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email Address",
                        style: TextStyle(
                          color: Color(0xFF8c8c8e),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "samanthasmith@gmail.com",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                              color: Color(0xFF8c8c8e),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const ForgetPassword()));
                            },
                            child: const Text(
                              "Forget ?",
                              style: TextStyle(color: Color(0xff1ce5c1)),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        obscureText: true,
                        controller: TextEditingController(text: "sabirbugti"),
                        decoration: const InputDecoration(
                          // hintText: "********",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          // hintStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      MyButton(name: "Sign in now", whenpress: () {
                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (ctx) => const CusBottomBar()));
                      }),
                      SizedBox(height: 1.h),
                      const Center(
                        child: Text(
                          "Or Continue With",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 6.h,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  side: const BorderSide(
                                    width: 1.5,
                                    color: Color(0xff1ce5c1),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Text(
                                      "f",
                                      style: TextStyle(
                                          color: Color(0xff1ce5c1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 6.h,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  side: const BorderSide(
                                    width: 1.5,
                                    color: Color(0xff1ce5c1),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Text(
                                      "G",
                                      style: TextStyle(
                                          color: Color(0xff1ce5c1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
