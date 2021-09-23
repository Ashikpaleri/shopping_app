import 'package:flutter/material.dart';
import 'package:ophone/pages/CartPage.dart';
import 'package:ophone/pages/ProdCategoryPage.dart';
import 'package:ophone/pages/Search.dart';
import 'pages/homePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String logo = 'http://omanphone.smsoman.com/api/media/omanphone_icon.png';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Container(
              margin: EdgeInsets.symmetric(vertical: 80),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 40,
                    child: Image.network(
                      logo,
                      height: 50,
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.values[0],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عمان فون',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Changa',
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'OMAN PHONE',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 0.3),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              )
            ],
            bottom: SearchBar(),
          ),
        ),
        bottomNavigationBar: menu(context),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('User'),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: FrontPage(),
      ),
    );
  }
}

Widget menu(BuildContext context) {
  return TabBar(
    enableFeedback: true,
    onTap: (index) {
      if (index == 0) {}
      if (index == 1) {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => SearchPage(),
          ),
        );
      }
      if (index == 2) {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => CategoryPage(),
          ),
        );
      }
      if (index == 3) {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => CartPage(),
          ),
        );
      }
    },
    labelColor: Colors.red,
    unselectedLabelColor: Colors.black54,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        text: "Home",
        icon: Icon(Icons.home),
      ),
      Tab(
        text: "Search",
        icon: Icon(Icons.search),
      ),
      Tab(
        text: "Categories",
        icon: Icon(Icons.apps),
      ),
      Tab(
        text: "Cart",
        icon: Icon(Icons.shopping_cart_outlined),
      ),
    ],
  );
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 450,
      margin: EdgeInsets.all(6),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search products...',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black38,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            hoverColor: Colors.white),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
