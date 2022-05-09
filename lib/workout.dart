import 'package:start/constants/constants.dart';
import 'package:start/fit/screens/home_page/open_home_page/open_home_page.dart';
import 'package:start/fit/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Workout extends StatelessWidget {
  const Workout(Null Function(dynamic i) param0, {Key? key}) : super(key: key);

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













// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:start/util/ConstantData.dart';
// import 'package:start/util/ConstantWidget.dart';
// import 'package:start/util/DataFile.dart';
//
// import 'DishDetailPage.dart';
// import 'generated/l10n.dart';
// import 'model/DishModel.dart';
//
// class TabDishes extends StatefulWidget {
//   final ValueChanged<int> valueChanged;
//
//   TabDishes(this.valueChanged);
//
//   @override
//   _TabDishes createState() {
//     return _TabDishes();
//   }
// }
//
// class _TabDishes extends State<TabDishes> {
//   List<DishModel> dishList = DataFile.getDishList();
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double margin = getScreenPercentSize(context, 1.5);
//
//     return WillPopScope(
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         appBar: AppBar(
//           elevation: 0,
//           title: getPrimaryAppBarText(context, S.of(context).dishes),
//           backgroundColor: primaryColor,
//           centerTitle: true,
//           // leading: null,
//
//
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: getPrimaryAppBarIcon(),
//                 onPressed: (){
//                   onBackPress();
//                 },
//               );
//             },
//           ),
//
//         ),
//         body: SafeArea(
//           child: Container(
//             child: Container(
//               child: ListView.builder(
//                 itemCount: 7,
//                 shrinkWrap: true,
//                 itemBuilder: (context, pos) {
//                   double width = getWidthPercentSize(context, 33);
//                   double height = getScreenPercentSize(context, 30);                  double cellHeight = getPercentSize(height, 78);
//                   double remainSize = height-cellHeight;
//                   dishList = dishList.reversed.toList();
//
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(margin),
//                         child: getBoldTextWidget(
//                             "Day " + (pos + 1).toString(),
//                             textColor,
//                             TextAlign.start,
//                             FontWeight.bold,
//                             getScreenPercentSize(context, 3)),
//                       ),
//                       Container(
//                         height: height,
//                         margin: EdgeInsets.symmetric(vertical: margin),
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: dishList.length,
//                           itemBuilder: (context, index) {
//
//                             DishModel model = dishList[index];
//                             return InkWell(
//                               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                                     DishDetailPage(model.image!, "Day " + (pos + 1).toString()),));
//                                     // DetailPage(model, "Day " + (pos + 1).toString()),));
//                               },
//                               child: Container(
//                                 width: width,
//                                 margin: EdgeInsets.only(left: margin,right: (index==dishList.length-1)?margin:0),
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       height: cellHeight,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(
//                                                   getPercentSize(width, 6))),
//                                           color: cellColor,
//                                           image: DecorationImage(
//                                             image: new ExactAssetImage(
//                                               ConstantData.assetsPath +
//                                                   // "homemade_receipe.jpg",
//                                                   dishList[index].image!,
//                                             ),
//                                             fit: BoxFit.cover,
//                                           )),
//                                     ),
//
//
//                                     SizedBox(height:getPercentSize(remainSize,
//                                         12) ,),
//                                     getCustomTextWidget(dishList[index].title!,
//                                         textColor, 2, TextAlign.start, FontWeight.w800, getPercentSize(remainSize,
//                                             27))
//
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//       onWillPop: () async {
//         onBackPress();
//         return true;
//       },
//     );
//   }
//
//   void onBackPress() {
//     widget.valueChanged(0);
//   }
// }
