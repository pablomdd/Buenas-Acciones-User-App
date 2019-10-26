import 'package:flutter/material.dart';

import 'Widgets/bottomNavyBar.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
    var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Buenas Acciones"),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
//          _pageController.animateToPage(index,
//              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Feed'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Social'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text('Cupones'),
              activeColor: Colors.pink
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Perfil'),
              activeColor: Colors.blue
          ),
        ],
      ),
    );
  }
}
