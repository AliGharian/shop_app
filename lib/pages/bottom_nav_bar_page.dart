import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/feed_page.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/search_page.dart';
import 'package:shop_app/pages/user_info_page.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    _pages = [
      HomePage(),
      FeedPage(),
      SearchPage(),
      CartPage(),
      UserInfoPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0, //this line
        clipBehavior:
            Clip.antiAlias, //this line round under the flotactionbutton
        shape: CircularNotchedRectangle(),
        // this widget remotes the effect of items because of center item
        // you can delete this widget later
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(AntDesign.home),
                label: 'Home',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(AntDesign.tago),
                label: 'Feed',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                label: '',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Feather.shopping_bag),
                label: 'Cart',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(AntDesign.user),
                label: 'User',
                backgroundColor: Colors.green,
              ),
            ],
            elevation: 5.0,
            showSelectedLabels:
                false, //this two lines remove the text under the icons
            showUnselectedLabels: false,
            type: BottomNavigationBarType
                .fixed, //this line remove the motion of items when selected
            // fixedColor: Colors.red,//when selectedItemcolor have a value blow line should be remove
            selectedItemColor: Colors.orange,
            backgroundColor: Colors.green,
            unselectedItemColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          AntDesign.search1,
        ),
        onPressed: () {},
      ),
    );
  }
}
