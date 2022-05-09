import 'package:start/constants/constants.dart';
import 'package:start/fit/screens/home_page/open_home_page/open_home_page.dart';
import 'package:start/fit/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //  backgroundColor: const Color(0xff1c1b20),
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("Fit Fitness"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: ("Trainer"),
              ),
              Tab(
                text: ("Standard"),
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: Color(0xff1ce5c1),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: ColorRemover(
          child: TabBarView(children: [
            ColorRemover(
              child: ListView.builder(
                  // shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: constants.trainer.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const OpenHomePage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.all(12),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                        child: Text(
                          constants.trainer[index].name,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: AssetImage(
                                "Assets/fit/images/${constants.trainer[index].image}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            ColorRemover(
              child: ListView.builder(
                  // shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: constants.standard.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const OpenHomePage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Container(
                          height: 200,
                          alignment: Alignment.bottomLeft,
                          padding:
                              const EdgeInsets.only(bottom: 12.0, left: 12.0),
                          child: Text(
                            constants.standard[index].name,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: AssetImage(
                                  "Assets/fit/images/${constants.standard[index].image}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        ),
        // body:
      ),
    );
  }
}
