import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/widgets/home/home_movies.dart';
import 'package:movies_app_flutter/widgets/profile/pages/profile_page.dart';
import 'package:movies_app_flutter/widgets/search.dart';
import 'package:movies_app_flutter/widgets/watchlist.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.amber));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //1) BottomNavigation: Index
  int _selectedIndex = 0;

  //2) BottomNavigation: Navigation options
  static List<Widget> _widgetOptions = <Widget>[
    HomeMovies(),
    SearchPage(),
    Watchlist(),
    ProfilePage()
  ];

  //3) BottomNavigation: Selected options
  void _selectedOptionNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*appBar: AppBar(
          //backgroundColor: Colors.transparent,
        toolbarOpacity: 0.5,
          backgroundColor: Colors.black87,
          elevation: 15,
          title: const custom_text_bold(
            text: 'MoviesApp',
            color: Colors.white,
            size: 24,
          )),*/
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      /*ListView(children: [
        UpcomingMovies(upcomingMovies: upcomingMoviesList),
        PopularMovies(popularMovies: popularMoviesList),
        TopRatedMovies(topratedMovies: topRatedMoviesList)
      ]),*/
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Watchlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: Colors.white,
        onTap: _selectedOptionNavigation,
      ),
    );
  }
}
