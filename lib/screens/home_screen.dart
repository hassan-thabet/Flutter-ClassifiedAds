import 'package:classified_ads/screens/Tabs/messages_tab.dart';
import 'package:classified_ads/screens/Tabs/notifications_tab.dart';
import 'package:classified_ads/screens/Tabs/settings_tab.dart';
import 'package:classified_ads/screens/add_product.dart';
import 'package:classified_ads/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = prefs.get(key) ?? null;
    if (value != null) {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new AddProduct(),
      ));
    } else {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new LoginScreen(),
      ));
    }
  }

  // @override
  // initState(){
  //   read();
  // }

  int currentTab = 0;
  final List<Widget> screens = [
    HomeTab(),
    MessagesTab(),
    NotificationsTab(),
    SettingsTab(),
  ];
  Widget currentScreen = HomeTab();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          // Navigator.pushNamed(context, '/login');
          read();
        },
        backgroundColor: Color(0xFFAC7FFD),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomeTab(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.category,
                          color:
                              currentTab == 0 ? Color(0xFFAC7FFD) : Colors.grey,
                        ),
                        Text(
                          'Browse',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xFFAC7FFD)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            NotificationsTab(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications_active,
                          color:
                              currentTab == 2 ? Color(0xFFAC7FFD) : Colors.grey,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color(0xFFAC7FFD)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MessagesTab(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color:
                              currentTab == 1 ? Color(0xFFAC7FFD) : Colors.grey,
                        ),
                        Text(
                          'Chats',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xFFAC7FFD)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            SettingsTab(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color:
                              currentTab == 3 ? Color(0xFFAC7FFD) : Colors.grey,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color(0xFFAC7FFD)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      //body: PageStorage(bucket: bucket, child: currentScreen),
    );
  }
}
