import 'package:flutter/material.dart';
import 'map.dart';
import 'assist.dart';
import 'healthinfo.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), // Use MyHomePage as the home page
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

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
      // Body Content
      body: Center(
        child: Image.asset('assets/images/summon.png'),
      ),
      // Bottom Navigation Bar
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
                if (_selectedIndex == 2) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirmation"),
                        content: Text(
                            "AI assist is not a real person. You can ask this AI for advice or first aid tips."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("I Understand"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AssistPage()),
                              );
                              showToast('Successfully Redirected');
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              } else if (_selectedIndex == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthinfoPage()),
                );
                //Toast
                showToast('Successfully Redirected');
              } else if (_selectedIndex == 4) {
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
