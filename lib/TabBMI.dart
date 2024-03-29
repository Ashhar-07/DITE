// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:start/util/ConstantData.dart';
import 'package:start/util/ConstantWidget.dart';
import 'package:start/util/MyAssetsBar.dart';
import 'package:start/util/PrefData.dart';
import 'package:start/util/SizeConfig.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'generated/l10n.dart';

class TabBMI extends StatefulWidget {
  // final ValueChanged<int> valueChanged;
  //
  // TabBMI(this.valueChanged);

  @override
  _TabBMI createState() {
    return _TabBMI();
  }
}

class _TabBMI extends State<TabBMI> {
  double radius = 0;
  double val = 155;
  double age = 25;
  double weight = 30;
  double height = 30;
  int bmi = 0;
  bool isKg = true;

  void getBmiVal() {
    double weightKg = weight;
    double heightCm = height;

    double meterHeight = heightCm / 100;
    double bmiGet = weightKg / (meterHeight * meterHeight);
    print("getbmival---$bmiGet--$meterHeight--$weightKg");
    setState(() {
      // String s = "$bmiGet";
      bmi = bmiGet.toInt();
      // bmi = int.parse("$bmiGet");
    });
  }

  var myControllerIn = TextEditingController();

  getHeights() async {
    double getWeight = await PrefData().getWeight();
    double getHeight = await PrefData().getHeight();
    isKg = await PrefData().getIsKgUnit();
    weight = getWeight;
    height = getHeight;
    getBmiVal();
  }

  DateTime dateTime = DateTime.now();

  void showAddWeightDialog(BuildContext contexts) async {
    var myControllerWeight = TextEditingController();

    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {



            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    getScreenPercentSize(context, 1)),
              ),
              elevation: 0,
              backgroundColor: cellColor,
              child: Container(

                padding:
                        EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[



                    Container(
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: primaryColor,
                        selectedTextColor: Colors.white,
                        dayTextStyle:  TextStyle(
                            color: textColor
                        ),
                        monthTextStyle:  TextStyle(
                            color: textColor
                        ),
                        dateTextStyle: TextStyle(
                          color: textColor
                        ),
                        onDateChange: (date) {

                          setState(() {
                            dateTime = date;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: getScreenPercentSize(context, 3),
                    ),
                    getCustomText("Weight", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),


                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myControllerWeight,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "KG", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: getScreenPercentSize(context, 3),
                    ),
                    Row(
                      children: [

                        new Spacer(),
                        new TextButton(
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                  fontFamily: ConstantData.fontFamily,
                                  fontSize: 15,
                                  color: primaryColor,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        new TextButton(
                            // color: lightPink,
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child: Text(
                              'CHECK',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantData.fontFamily,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              if (myControllerWeight.text.isNotEmpty) {
                                // weight = myControllerWeight.text;

                                setState(() {
                                  // list = _createSampleData(
                                  //     new OrdinalSales(dateTime.day.toString(), weight1.toInt()));
                                });
                              }

                              Navigator.pop(context);
                            }),

                       ],
                    )
                  ],
                ),
              ));

          },
        );
      },
    ).then((value) {
      // setState(() {
      getBmiVal();
      // selectedGender=value;
      // })
    });
  }

  String spinValue="Sedentary- little or no exercise";
  void showCalDialog(BuildContext contexts) async {
    var myControllerWeight = new TextEditingController(text: "25");
    var myController = new TextEditingController(text: "152");
    var myAgeController = new TextEditingController(text: "25");
    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: cellColor,
              title: getMediumTextWithMaxLine(
                  "BMR", textColor, 1),
              content: Container(
                width: 300.0,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getCustomText("Age", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myAgeController,
                          ),
                          flex: 1,
                        ),
                        Visibility(
                          child: Text(
                            " , ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        Visibility(
                          child: Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  )),
                              // cursorRadius: Radius.circular(16.0),
                              // cursorHeight: ,
                              // cursorWidth: 16.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color:textColor,
                                  decorationColor: primaryColor,
                                  fontFamily: ConstantData.fontFamily),
                              controller: myControllerIn,
                            ),
                            flex: 1,
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        getMediumNormalTextWithMaxLine(
                            (isKg) ? "Year" : "FT/In",
                            Colors.grey,
                            1,
                            TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    getCustomText("Height", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myController,
                          ),
                          flex: 1,
                        ),
                        Visibility(
                          child: Text(
                            " , ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        Visibility(
                          child: Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  )),
                              // cursorRadius: Radius.circular(16.0),
                              // cursorHeight: ,
                              // cursorWidth: 16.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: textColor,
                                  decorationColor: primaryColor,
                                  fontFamily: ConstantData.fontFamily),
                              controller: myControllerIn,
                            ),
                            flex: 1,
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        getMediumNormalTextWithMaxLine((isKg) ? "CM" : "FT/In",
                            Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    getCustomText("Weight", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    // getCustomText("Weight", Colors.black87, 1, TextAlign.start,
                    //     FontWeight.w600, 20),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color:textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myControllerWeight,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "KG", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    getCustomText("Method", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),

                    new Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: cellColor,
                      ),
                      child: DropdownButton<String>(

                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: textColor,
                          size: getScreenPercentSize(context, 3),
                        ),

                        underline: Container(height: 1, color: textColor),
                        isExpanded: true,
                        items: <String>['Sedentary- little or no exercise', 'Light Active - 1-3 times /week',
                          'Moderate Active - 3-5 times/week', 'Very Active - 6-7 times/week',"Extra Active -2 times /day whole week","Professional athlete"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: textColor),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState((){
                            spinValue = val as String;
                          });
                        },

                        style: TextStyle(
                            color: textColor,

                            fontSize: getScreenPercentSize(context, 2)),
                        value: spinValue,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                new TextButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new TextButton(
                    // color: lightPink,
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          },
        );
      },
    ).then((value) {
      // setState(() {
      getBmiVal();
      // selectedGender=value;
      // })
    });
  }

  void showWeightHeightDialog(BuildContext contexts) async {
    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: cellColor,
              title: getMediumTextWithMaxLine(
                  "Enter Height and Weight", textColor, 1),
              content: Container(
                width: 300.0,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getCustomText("Height", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myController,
                          ),
                          flex: 1,
                        ),
                        Visibility(
                          child: Text(
                            " , ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        Visibility(
                          child: Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  )),
                              // cursorRadius: Radius.circular(16.0),
                              // cursorHeight: ,
                              // cursorWidth: 16.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: textColor,
                                  decorationColor: primaryColor,
                                  fontFamily: ConstantData.fontFamily),
                              controller: myControllerIn,
                            ),
                            flex: 1,
                          ),
                          visible: (!isKg) ? true : false,
                        ),
                        getMediumNormalTextWithMaxLine((isKg) ? "CM" : "FT/In",
                            Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    getCustomText("Weight", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),


                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: myControllerWeight,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "KG", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                new TextButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new TextButton(
                    // color: lightPink,
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      if (myController.text.isNotEmpty) {
                        if (isKg) {
                          height = double.parse(myController.text);

                          // height = myController.text;
                        } else {
                          double inch = 0;
                          if (myControllerIn.text.isNotEmpty) {
                            inch = double.parse(myControllerIn.text);
                          }
                          double feet = double.parse(myController.text);
                          double cm = feetAndInchToCm(feet, inch);
                          height = cm;
                        }
                        PrefData().addHeight(height);
                      }

                      if (myControllerWeight.text.isNotEmpty) {
                        // weight = myControllerWeight.text;
                        double weight1 = double.parse(myControllerWeight.text);
                        if (isKg) {
                          weight = weight1;
                          PrefData().addWeight(weight1);
                        } else {
                          weight = poundToKg(weight1);
                          PrefData().addWeight(weight);
                        }
                        // Navigator.pop(context, weight);
                      }

                      Navigator.pop(context, weight);

                      // else {
                      //   print("getWeight===$weight");
                      //   Navigator.pop(context, "");
                      // }
                    }),
              ],
            );
          },
        );
      },
    ).then((value) {
      // setState(() {
      getBmiVal();
      // selectedGender=value;
      // })
    });
  }

  // var list;

  var myController = TextEditingController();
  var myControllerWeight = TextEditingController();

  @override
  void initState() {
    getBmiVal();
    getHeights();
    // list = _createSampleData(
    //   new OrdinalSales('9', 4),
    // );
    // TODO: implement initState
    super.initState();
  }

  // final List<charts.Series> seriesList = [];


  void onBackPress(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double margin = getScreenPercentSize(context, 0.5);
    double allMargin = getScreenPercentSize(context, 2);
    double width = getWidthPercentSize(context, 100)-(allMargin*2)-(margin*2);

    return WillPopScope(
      onWillPop: () async {
        // widget.valueChanged(0);
        onBackPress();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(
              context, S.of(context).bmiCalculator.toUpperCase()),
          backgroundColor: primaryColor,
          centerTitle: true,
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
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(margin),
            children: [
              Container(
                margin: EdgeInsets.all(allMargin),
                width: double.infinity,
                height: SizeConfig.safeBlockVertical! * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Image.asset(
                            ConstantData.assetsPath + "path.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                child: getMediumBoldTextWithMaxLine(
                                    "BMI", Colors.white, 1),
                                padding: EdgeInsets.all(5),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: getCustomText(
                                    "$bmi ${(isKg) ? "kg/m²" : "lb/in²"}",
                                    Colors.white,
                                    1,
                                    TextAlign.center,
                                    FontWeight.bold,
                                    22),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    (bmi < 18)
                                        ? "Underweight"
                                        : (bmi < 25)
                                            ? "Normal Weight"
                                            : (bmi < 30)
                                                ? "Overweight"
                                                : "Obesity",
                                    style: TextStyle(
                                        color: getColorFromHex("FBC02D"),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  )
                                  // , 1,
                                  // TextAlign.center, , 22),
                                  ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    child: MyAssetsBar(
                                      width:
                                      width,
                                      background: getColorFromHex("CFD8DC"),
                                      //height: 50,
                                      height: 5,
                                      radius: 5,
                                      pointer: bmi,
                                      //radius: 10,
                                      assetsLimit: 50,
                                      order: OrderType.None,
                                      // order: OrderType.Ascending,
                                      assets: [
                                        MyAsset(
                                            size: 15,
                                            color: getColorFromHex("D0E2E2"),
                                            title: "0"),
                                        MyAsset(
                                            size: 3,
                                            color: getColorFromHex("9ADF9C"),
                                            title: "16"),
                                        MyAsset(
                                            size: 7,
                                            color: getColorFromHex("1EDC3E"),
                                            title: "18"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("DCE683"),
                                            title: "25"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("FF9A00"),
                                            title: "30"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("E26F76"),
                                            title: "35"),
                                        MyAsset(
                                            size: 10,
                                            color: getColorFromHex("EF3737"),
                                            title: "40"),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Color(0xFF01635A),
                      ),
                      padding: EdgeInsets.all(7),
                      child: InkWell(
                        onTap: () {
                          if (isKg) {
                            myController.text =
                                ConstantData.formatter.format(height);
                            myControllerWeight.text =
                                ConstantData.formatter.format(weight);
                          } else {
                            meterToInchAndFeet(
                                height, myController, myControllerIn);
                            myControllerWeight.text = ConstantData.formatter
                                .format(kgToPound(weight));
                          }
                          showWeightHeightDialog(context);
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: getMediumNormalTextWithMaxLine("Check Now",
                                  Colors.white, 1, TextAlign.center),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(allMargin),
                width: double.infinity,
                height: SizeConfig.safeBlockVertical! * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF057B71),
                  // color: "#F6A32A".toColor(),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Image.asset(
                            ConstantData.assetsPath + "path.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                child: getMediumBoldTextWithMaxLine(
                                    "BMR", Colors.white, 1),
                                padding: EdgeInsets.all(5),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: getCustomText(
                                    "$bmi ${"kcal Per Day"}",
                                    Colors.white,
                                    1,
                                    TextAlign.center,
                                    FontWeight.bold,
                                    22),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        color: getColorFromHex("FBC02D"),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  )
                                  // , 1,
                                  // TextAlign.center, , 22),
                                  ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    child: MyAssetsBar(
                                      width:
                                          width,
                                      background: getColorFromHex("CFD8DC"),
                                      //height: 50,
                                      height: 5,
                                      radius: 5,
                                      pointer: bmi,
                                      //radius: 10,
                                      assetsLimit: 50,
                                      order: OrderType.None,
                                      // order: OrderType.Ascending,
                                      assets: [
                                        MyAsset(
                                            size: 15,
                                            color: getColorFromHex("D0E2E2"),
                                            title: "0"),
                                        MyAsset(
                                            size: 3,
                                            color: getColorFromHex("9ADF9C"),
                                            title: "16"),
                                        MyAsset(
                                            size: 7,
                                            color: getColorFromHex("1EDC3E"),
                                            title: "18"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("DCE683"),
                                            title: "25"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("FF9A00"),
                                            title: "30"),
                                        MyAsset(
                                            size: 5,
                                            color: getColorFromHex("E26F76"),
                                            title: "35"),
                                        MyAsset(
                                            size: 10,
                                            color: getColorFromHex("EF3737"),
                                            title: "40"),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Color(0xFF01635A),
                      ),
                      padding: EdgeInsets.all(7),
                      child: InkWell(
                        onTap: () {
                          // if (isKg) {
                          //   myController.text = Constants.formatter.format(height);
                          //   myControllerWeight.text =
                          //       Constants.formatter.format(weight);
                          // } else {
                          //   Constants.meterToInchAndFeet(
                          //       height, myController, myControllerIn);
                          //   myControllerWeight.text = Constants.formatter
                          //       .format(Constants.kgToPound(weight));
                          // }
                          showCalDialog(context);
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: getMediumNormalTextWithMaxLine("Check Now",
                                  Colors.white, 1, TextAlign.center),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: margin,
              ),
              Padding(
                child: Row(
                  children: [
                    Expanded(
                      child:
                          getMediumBoldTextWithMaxLine(S.of(context).weight, textColor, 1),
                    ),
                    InkWell(
                      onTap: () {
                        showAddWeightDialog(context);
                      },

                      child:Row(
                        children: [
                          Text(
                            S.of(context).addWeight,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontFamily: ConstantData.fontFamily,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),

                        Icon(
                                Icons.edit,
                                color: primaryColor,
                                size: getScreenPercentSize(context, 2.5),
                              )
                        ],
                      )
                      // child: Container(
                      //   height: getScreenPercentSize(context, 3.8),
                      //   width: getScreenPercentSize(context, 3.8),
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle, color: primaryColor),
                      //   child: Center(
                      //     child: Icon(
                      //       Icons.add,
                      //       color: Colors.white,
                      //       size: getScreenPercentSize(context, 2.5),
                      //     ),
                      //   ),
                      // ),
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: allMargin),
              ),

              Container(
                margin: EdgeInsets.all(allMargin),
                height: getScreenPercentSize(context, 40),
                // child: new charts.BarChart(
                //   list,
                //   animate: false,
                // ),

                child: LineChart(
                  mainData(),

                ),
              )


            ],
          ),
        ),
      ),
    );
  }


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: textColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: textColor.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];




  //
  //
  // List<charts.Series<OrdinalSales, String>> _createSampleData(OrdinalSales ai) {
  //   final data = [
  //     new OrdinalSales('3', 0),
  //     new OrdinalSales('6', 5),
  //     new OrdinalSales('15', 8),
  //     new OrdinalSales('18', 10),
  //     new OrdinalSales('21', 50),
  //   ];
  //     data.add(ai);
  //
  //
  //   return [
  //     new charts.Series<OrdinalSales, String>(
  //       id: 'Sales',
  //       colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
  //       patternColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
  //
  //       // colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: (OrdinalSales sales, _) => sales.year,
  //       measureFn: (OrdinalSales sales, _) => sales.sales,
  //       data: data,
  //
  //       // seriesColor: primaryColor
  //     )
  //   ];
  //
  // }

  getDecoration() {
    return BoxDecoration(
        color: cellColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
