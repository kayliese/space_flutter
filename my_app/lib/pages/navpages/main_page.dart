import 'package:flutter/material.dart';
import 'package:my_app/pages/navpages/eventpage.dart';
import 'package:my_app/pages/navpages/explorepage.dart';
import 'package:my_app/pages/navpages/homepage.dart';
import 'package:my_app/pages/navpages/launchpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), EventPage(), LaunchPage(), ExplorePage()];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191826),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff191826),
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: ("Event"), icon: Icon(Icons.newspaper)),
            BottomNavigationBarItem(
                label: ("Launch"), icon: Icon(Icons.rocket_launch)),
            BottomNavigationBarItem(
                label: ("Explore"), icon: Icon(Icons.travel_explore))
          ]),
    );
  }
}
