import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/widgets/home/home_movies.dart';
import 'package:movies_app_flutter/widgets/profile/pages/profile_page.dart';
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
            brightness: Brightness.light,
            //backgroundColor: Colors.red,
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
    Watchlist(),
    ProfilePage()

  ];

  //3) BottomNavigation: Selected options
  void _selectedOptionNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Lists of movies
  List trendingMoviesList = [];
  List upcomingMoviesList = [];
  List popularMoviesList = [];
  List topRatedMoviesList = [];

  //API KEY
  final String API_KEY = '572f6e73385919e6eb3a365a3e144cce';
  final String READ_ACCESS_TOKEN =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzJmNmU3MzM4NTkxOWU2ZWIzYTM2NWEzZTE0NGNjZSIsInN1YiI6IjYxZDc2MWFhZDQ4Y2VlMDA4YmU0ZDJmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Y9e4P70XmkO_FAPsDm_hA1yAAwITuRagyWIxbq75DLs';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(API_KEY, READ_ACCESS_TOKEN),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    //We get a Map from the API, not a List
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map upcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    //Updating state
    setState(() {
      trendingMoviesList = trendingResult['results'];
      upcomingMoviesList = upcomingResult['results'];
      popularMoviesList = popularResult['results'];
      topRatedMoviesList = topRatedResult['results'];
    });
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
        child: _widgetOptions.elementAt(_selectedIndex),),
      /*ListView(children: [
        UpcomingMovies(upcomingMovies: upcomingMoviesList),
        PopularMovies(popularMovies: popularMoviesList),
        TopRatedMovies(topratedMovies: topRatedMoviesList)
      ]),*/
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Watchlist"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile")
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
