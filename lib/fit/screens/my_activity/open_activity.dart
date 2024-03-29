import 'package:start/constants/constants.dart';
import 'package:start/fit/screens/select_exercise/select_exercise.dart';
import 'package:start/fit/screens/start_exercise/start_exercise.dart';
import 'package:start/fit/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class OpenActivity extends StatelessWidget {
  const OpenActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Strecho Workout",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.control_point_duplicate_outlined,
                    color: Color(0xff1ce5c1),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
              // const SizedBox(
              //   height: .0,
              // ),
              const Text(
                "90 hours | Amenda Johnson",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/fit/mages/Strecho Workout.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const StartExercise()));
          },
          backgroundColor: const Color(0xff1ce5c1),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12.0),
                right: Radius.circular(12.0),
              ),
              color: Color(0xff1c1b20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xff38373a),
                  ),
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: ("Workouts"),
                      ),
                      Tab(
                        text: ("Trainer"),
                      ),
                    ],
                    indicatorColor: Colors.transparent,
                    labelColor: Color(0xff1ce5c1),
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  height: 60,
                  width: 240,
                ),
                Expanded(
                  child: ColorRemover(
                    child: TabBarView(children: [
                      ColorRemover(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: constants.workouts.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          const SelectExercise()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image(
                                            height: 80,
                                            width: 90,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "Assets/fit/images/${constants.workouts[index].image}")),
                                      ),
                                      const SizedBox(
                                        width: 18.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            constants.workouts[index].name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            constants
                                                .workouts[index].lastMessage,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // child:
                                  //  ListTile(
                                  //   onTap: () {},
                                  //   title: Text(
                                  //     constants.workouts[index].name,
                                  //     style: const TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  //   subtitle: Text(
                                  //     constants.workouts[index].lastMessage,
                                  //     style: const TextStyle(
                                  //       fontSize: 12,
                                  //     ),
                                  //   ),
                                  //   leading: Image(
                                  //       height: 150,
                                  //       width: 120,
                                  //       fit: BoxFit.cover,
                                  //       image: AssetImage(
                                  //           "assets/images/${constants.workouts[index].image}")),
                                  // ),
                                ),
                              );
                            }),
                      ),
                      ColorRemover(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: constants.chat.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          const SelectExercise()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image(
                                            height: 80,
                                            width: 90,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "Assets/fit/images/${constants.chat[index].image}")),
                                      ),
                                      const SizedBox(
                                        width: 18.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            constants.chat[index].name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          const Text(
                                            "Trainer",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ]),
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
