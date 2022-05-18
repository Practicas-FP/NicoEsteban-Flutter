import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/utils/custom_text_normal.dart';
import 'package:movies_app_flutter/widgets/moviedetails/movieDetails.dart';

class PopularMovies extends StatelessWidget {
  final List popularMovies;

  const PopularMovies({Key? key, required this.popularMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Const?---------------------------------------------------
            const custom_text_normal(
              text: 'Popular Movies',
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(height: 10),
            Container(
              height: 220,
              child: ListView.builder(
                  itemCount: popularMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        title: popularMovies[index]['title'],
                                        overview: popularMovies[index]
                                            ['overview'],
                                        release_date: popularMovies[index]
                                            ['release_date'],
                                        poster_path:
                                            "https://image.tmdb.org/t/p/w500/" +
                                                popularMovies[index]
                                                    ['poster_path'],
                                        backdrop_path:
                                            "https://image.tmdb.org/t/p/w500/" +
                                                popularMovies[index]
                                                    ['backdrop_path'],
                                        vote_average: popularMovies[index]
                                                ['vote_average']
                                            .toString(),
                                      )));
                        },
                        child: Container(
                          width: 130,
                          child: Column(
                            children: [
                              Container(
                                //POSTER ------------------------------
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500/" +
                                                popularMovies[index]
                                                    ['poster_path']))),
                              ),
                              Container(
                                  //MOVIE TITLE -------------------------
                                  child: custom_text_normal(
                                      text: popularMovies[index]['title'],
                                      color: Colors.white,
                                      size: 14))
                            ],
                          ),
                        ));
                  }),
            )
          ],
        ));
  }
}
