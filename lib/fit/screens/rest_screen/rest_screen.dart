import 'package:start/fit/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  double vaule = 70.0;
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
                          image: AssetImage(
                              "Assets/fit/images/Soft Curve Workout.jpg"),
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
                            horizontal: 0, vertical: 0),
                        child: Column(
                          children: [
                            AppBar(
                              leading: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                              backgroundColor: Colors.transparent,
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.info_outline)),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "Take a Rest",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            const Text(
                              "You going grate !!",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SleekCircularSlider(
                          initialValue: vaule,
                          max: 100,
                          appearance: CircularSliderAppearance(
                            // infoProperties: InfoProperties(),
                            angleRange: 360,
                            size: MediaQuery.of(context).size.width * 0.5,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 12.0, trackWidth: 6.0),
                            customColors: CustomSliderColors(
                              hideShadow: true,
                              progressBarColor: const Color(0xff1ce5c1),
                              dotColor: Colors.transparent,
                              trackColor: const Color(0xff404040),
                              progressBarColors: [
                                const Color(0xff1ce5c1),
                                const Color(0xff1ce5c1),
                              ],
                            ),
                          ),
                          innerWidget: (re) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "0:20",
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    "mins",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          onChange: (e) {
                            setState(() {
                              vaule = e;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    // alignment: Alignment.center,
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
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // child: MyButton(name: "Stop", whenpress: () {}),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Center(
                    child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1ce5c1),
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Full Crunches",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "5 mins |2 set |26 reps",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
