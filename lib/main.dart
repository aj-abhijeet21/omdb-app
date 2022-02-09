import 'package:flutter/material.dart';
import 'package:omdb_app/screens/favourites_page.dart';
import 'package:omdb_app/screens/home_page.dart';
import 'package:omdb_app/screens/saved_page.dart';
import 'package:omdb_app/screens/setting_page.dart';
import 'package:omdb_app/services/constants.dart';
import 'package:omdb_app/services/movie_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieDetailProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  static const List<Widget> _pages = [
    HomePage(),
    FavouritesPage(),
    SavedPage(),
    SettingsPage(),
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final bottomNavBarList = const [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Favourites',
      icon: Icon(
        Icons.star,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Saved',
      icon: Icon(
        Icons.bookmark,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(
        Icons.line_weight_sharp,
      ),
    ),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Home._pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkGray,
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: pink,
        unselectedItemColor: gray,
        iconSize: 30,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        items: bottomNavBarList,
      ),
    );
  }
}
