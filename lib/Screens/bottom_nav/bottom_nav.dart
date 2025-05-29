import 'package:demo2/Screens/Home_screen/home_screen.dart';
import 'package:demo2/Screens/add_screen/add_screen.dart';
import 'package:demo2/Screens/profile_screen/profile_screen.dart';
import 'package:demo2/Screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _selectedIndex = 0;
  int _currentCarouselIndex = 0;

  // Your different pages/screens
  late List<Widget> screens;
  late HomeScreen _homeScreen;
  late SearchScreen _searchScreen;
  late AddScreen _addScreen;
  late  ProfileScreen _profileScreen;
@override
  void initState() {
   _homeScreen= HomeScreen();
   _profileScreen=ProfileScreen();
   _searchScreen=SearchScreen();
   _addScreen = AddScreen();
   screens =[_homeScreen,_searchScreen,_addScreen,_profileScreen];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
    bottomNavigationBar:
    Padding(
      padding:  EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.015,
        right: MediaQuery.of(context).size.width*0.015,
        top: MediaQuery.of(context).size.width*0.015,
        bottom: MediaQuery.of(context).size.width*0.055,
      ),
      child: SafeArea(
        child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.blueAccent,
            iconSize: 30.0,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04, vertical: 12),
            tabBackgroundColor: Colors.blueAccent.withOpacity(0.1),
            color: Colors.grey[800],
          onTabChange: (val){
            setState(() {
              _selectedIndex=val;
            });
          },
            tabs: [
          GButton(icon: Icons.home, text: 'Home',),
          GButton(icon: Icons.search, text: 'Search',),
          GButton(icon: Icons.add, text: 'Upload',),
          GButton(icon: Icons.person, text: 'Profile',),
        ]),
      ),
    ),
    );
  }
}
