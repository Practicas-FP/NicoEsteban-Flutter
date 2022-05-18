import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/widgets/profile.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'upcoming.dart';
import 'toprated.dart';
import 'popular.dart';

class HomeMovies extends StatefulWidget {
  @override
  _HomeMoviesState createState() => _HomeMoviesState();
}

class _HomeMoviesState extends State<HomeMovies> {
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
    return Container(

        child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
      UpcomingMovies(upcomingMovies: upcomingMoviesList),
      PopularMovies(popularMovies: popularMoviesList),
      TopRatedMovies(topratedMovies: topRatedMoviesList)
    ])
    );
  }
}
