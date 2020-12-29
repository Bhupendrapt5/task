import 'package:finnovation_task/dashboard/home_page.dart';
import 'package:finnovation_task/dashboard/notification_page.dart';
import 'package:finnovation_task/dashboard/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({Key key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    NotificationPage(),
    UserProfileScreen(),
  ];

  bool showSearchBar = false;

  Widget searchBarAppBar() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 2000),
      opacity: showSearchBar ? 1.0 : 0,
      child: Row(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeLeft: true,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  showSearchBar = !showSearchBar;
                });
              },
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Icon(
            Icons.mic,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 2000),
      opacity: !showSearchBar ? 1.0 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/crux-circle.svg',
              color: Colors.white,
              width: 25,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  showSearchBar = !showSearchBar;
                });
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 10,
            top: MediaQuery.of(context).padding.top + 15,
            bottom: 15,
          ),
          color: Color(0xFF050505),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: showSearchBar ? searchBarAppBar() : appBar()),
        ),
        Expanded(child: _pages[_currentIndex])
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}
