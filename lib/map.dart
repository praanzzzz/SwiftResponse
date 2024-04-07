import 'package:flutter/material.dart';
import 'main.dart';
import 'assist.dart';
import 'healthinfo.dart';
import 'user.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to SwiftResponse',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      'I\'m only one tap away, I\'ll be there to save the day',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 60.0),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child:
                    Image.asset('assets/images/S.png', width: 50, height: 50),
              ),
            ],
          ),
          backgroundColor: Color(0xFFBF0000),
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/map.png',),
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFBF0000),
        unselectedItemColor: Colors.black,
        iconSize: 30.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop_rounded), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent), label: 'AI Assist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Account'),
        ],
        //function or command to redirect
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              if (_selectedIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                 //Toast
                            showToast('Successfully Redirected');
              } else if (_selectedIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
                 //Toast
                            showToast('Successfully Redirected');
              } else if (_selectedIndex == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistPage()),
                );
                 //Toast
                            showToast('Successfully Redirected');
              } else if (_selectedIndex == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthinfoPage()),
                );
                 //Toast
                            showToast('Successfully Redirected');
              }else if (_selectedIndex == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
                 //Toast
                            showToast('Successfully Redirected');
              }
            },
          );
        },
      ),
    );
  }
}
