import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/utils/custom_text_normal.dart';
import 'package:movies_app_flutter/widgets/home/home_movies.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../home/upcoming.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String overview;
  final String backdrop_path;
  final String poster_path;
  final String vote_average;
  final String release_date;

  const MovieDetails(
      {Key? key,
      required this.title,
      required this.overview,
      required this.backdrop_path,
      required this.poster_path,
      required this.vote_average,
      required this.release_date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.white54,
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Container(
                                decoration: const BoxDecoration(
                              color: Colors.white,
                            ))),
                      ),
                      AspectRatio(
                          aspectRatio: 3 / 2,
                          child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: "https://image.tmdb.org/t/p/original/" +
                                  backdrop_path)),
                    ],
                  ),
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(1.0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 1],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      left: 10.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white10,
                                  highlightColor: Colors.white30,
                                  enabled: true,
                                  child: SizedBox(
                                    height: 140.0,
                                    child: AspectRatio(
                                        aspectRatio: 2 / 3,
                                        child: Container(
                                            decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.white,
                                        ))),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  height: 140.0,
                                  child: AspectRatio(
                                      aspectRatio: 2 / 3,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image:
                                                "https://image.tmdb.org/t/p/w200/" +
                                                    poster_path),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Release date: " + release_date,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      /*
                  Icon(Icons.watch, size: 15.0),
                  SizedBox(width: 5.0),
                  Text("0", style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold)),*/
                      SizedBox(
                        width: 10.0,
                      ),
                      /*Expanded(
                    child: Container(
                      height: 40.0,
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movie.genres.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30.0)),
                                    color: Colors.white.withOpacity(0.1)),
                                child: Text(
                                  state.movie.genres[index].name,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      height: 1.4,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),*/
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("OVERVIEW",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: Colors.white70)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(overview,
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}
