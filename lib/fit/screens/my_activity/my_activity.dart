import 'package:start/constants/constants.dart';
import 'package:start/fit/screens/my_activity/open_activity.dart';
import 'package:start/fit/widgets/color_remover.dart';
import 'package:start/fit/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyActivity extends StatelessWidget {
  const MyActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return Scaffold(
      //  backgroundColor: const Color(0xff1c1b20),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1b20),
        title: const Text("My Activity"),
      ),
      body: ColorRemover(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
                height: 300, width: double.infinity, child: LineChartWidget()),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: constants.recentActities.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const OpenActivity()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      height: 20.h,
                      // alignment: Alignment.,
                      padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            constants.recentActities[index].name,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          // const SizedBox(
                          //   height: .0,
                          // ),
                          Row(
                            children: [
                              Text(
                                constants.recentActities[index].lastMessage,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.control_point_duplicate_outlined,
                                color: Color(0xff1ce5c1),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(
                              "Assets/fit/images/${constants.recentActities[index].image}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      // body:
    );
  }
}
