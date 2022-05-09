import 'package:start/fit/screens/account_screen/account_screen.dart';
import 'package:start/fit/screens/chat_screen/chat_screen.dart';
import 'package:start/fit/screens/home_page/home_page.dart';
import 'package:start/fit/screens/my_activity/my_activity.dart';
import 'package:flutter/material.dart';

class CusBottomBar extends StatefulWidget {
  const CusBottomBar({Key? key}) : super(key: key);

  @override
  CusBottomBarState createState() => CusBottomBarState();
}

class CusBottomBarState extends State<CusBottomBar> {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = [
    const HomePage1(),
    const MyActivity(),
    const ChatScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.accessibility), label: 'Workouts'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.equalizer), label: 'My Activity'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble), label: 'Messages'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Accounts'),
              ],
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey,
              ),
              // backgroundColor: Colors.black,

              fixedColor: const Color(0xff1ce5c1),
              onTap: onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
