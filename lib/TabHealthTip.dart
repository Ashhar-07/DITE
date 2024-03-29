import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start/util/ConstantData.dart';
import 'package:start/util/ConstantWidget.dart';
import 'package:start/util/DataFile.dart';

import 'HealthDetailPage.dart';
import 'model/HealthModel.dart';

class TabHealthTip extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  TabHealthTip(this.valueChanged);

  @override
  _TabHealthTip createState() {
    return _TabHealthTip();
  }
}

class _TabHealthTip extends State<TabHealthTip> {
  List<HealthModel> healthList = [];

  int selectedPosition = 0;
  List<String> list = ["Diet Tips", "Diet Tips", "Supplement"];

  @override
  void initState() {
    super.initState();

    setState(() {
      healthList = DataFile.getHealthList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = getScreenPercentSize(context, 6);

    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, "Diet Plan"),
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: getPrimaryAppBarIcon(),
                onPressed: (){
                  onBackPress();
                },
              );
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: height,
                    child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = (selectedPosition == index);
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: getTextWidget(
                                      list[index],
                                      (isSelected) ? textColor : subTextColor,
                                      TextAlign.start,
                                      (isSelected)
                                          ? FontWeight.w800
                                          : FontWeight.w500,
                                      getPercentSize(height, 35)),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,

                                    child: Container(
                                      height: getScreenPercentSize(context, 0.5),
                                      width: getWidthPercentSize(context, 12),
                                      decoration: BoxDecoration(
                                          color:  (isSelected)
                                                ? primaryColor
                                                : Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(getScreenPercentSize(context, 0.5)))
                                      ),
                                    )

                                  // child: Container(
                                  //   height: 5,
                                  //   width: getWidthPercentSize(context, 5),
                                  //   color: (isSelected)
                                  //       ? primaryColor
                                  //       : Colors.transparent,
                                  // ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedPosition = index;
                              healthList = healthList.reversed.toList();
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: healthList.length,
                      itemBuilder: (context, index) {
                        double imgHeight = getScreenPercentSize(context, 30);
                        double radius = getScreenPercentSize(context, 1.5);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HealthDetailPage(healthList[index]),
                                ));
                          },
                          child: Card(
                            margin: EdgeInsets.all(
                                getScreenPercentSize(context, 1.8)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius),
                            ),
                            color: cellColor,
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: imgHeight,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(radius),
                                        image: DecorationImage(
                                          image: new ExactAssetImage(
                                            ConstantData.assetsPath +
                                                healthList[index].image!,
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: getPercentSize(imgHeight, 80)),
                                    // margin: EdgeInsets.only(top: (height*1.7)),
                                    padding: EdgeInsets.all(
                                        getScreenPercentSize(context, 1.6)),
                                    decoration: BoxDecoration(
                                      color: cellColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              getScreenPercentSize(context, 4)),
                                          bottomRight: Radius.circular(radius),
                                          bottomLeft: Radius.circular(radius)),
                                    ),

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: getCustomTextWidget(
                                                    healthList[index].title!,
                                                    textColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w700,
                                                    getScreenPercentSize(
                                                        context, 1.8))),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              child: Icon(
                                                healthList[index].isFav!?  Icons.favorite:  Icons.favorite_border,
                                                size: getScreenPercentSize(
                                                    context, 3),
                                                color: primaryColor,
                                              ),
                                              onTap: () {
                                               setState(() {
                                                 if (healthList[index].isFav!) {
                                                   healthList[index].isFav =
                                                   false;
                                                 } else {
                                                   healthList[index].isFav =
                                                   true;
                                                 }
                                               });
                                              },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        getCustomTextWidget(
                                            healthList[index].desc!,
                                            subTextColor,
                                            3,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            getScreenPercentSize(context, 1.8)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: getCustomTextWidget(
                                                  healthList[index].time!,
                                                  primaryColor,
                                                  1,
                                                  TextAlign.end,
                                                  FontWeight.w500,
                                                  getScreenPercentSize(
                                                      context, 1.5)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {

onBackPress();
        return true;
      },
    );
  }

  void onBackPress() {
    widget.valueChanged(0);
  }
}
