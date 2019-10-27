import 'package:flutter/material.dart';

import 'Widgets/bottomNavyBar.dart';
import 'Widgets/trending_item.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
    var _selectedIndex = 0;
    final TextEditingController _searchControl = new TextEditingController();

    @override
  Widget build(BuildContext context) {

    PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 124, 174, 1),
        elevation: 1,
//        title: Text("GoodDeeds",
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    fontFamily: "Noto Sans",
//                  ),
//        ),
          title: Image.asset("lib/assets/gooddeeds.jpeg"),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
          child: ListView(
            children: <Widget>[
            Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Buscar...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
          TrendingItem(
//            img: restaurant["img"],
//            title: restaurant["title"],
//            address: restaurant["address"],
//            rating: restaurant["rating"],
            img: "lib/assets/gooddeeds.jpeg",
            title: "Reto Good Deeds Octubre",
            address: "Bosque de Chapultepec",
            rating: "5",
          ),

              TrendingItem(
                img: "lib/assets/frapuccino.jpeg",
                title: "Facebook Walk The City",
                address: "Paseo de la Reforma",
                rating: "4.5",
              ),

              TrendingItem(
                img: null,
                title: "Microsoft Hack Movility",
                address: "Paseo de la Reforma",
                rating: "4.7",
              ),

            ]),



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
              icon: Icon(Icons.person_pin),
              title: Text('Perfil'),
              activeColor: Colors.blue
          ),
        ],
      ),
    );
  }
}
