import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import './model/MoviePopular.dart';
import './model/Tv.dart';
import './model/BestMovie.dart';
import './repository/MoviePopularRepo.dart';
import './repository/TvRepo.dart';
import './repository/BestMovieRepo.dart';

class ListFilm extends StatefulWidget {
  ListFilm({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ListFilm createState() => _ListFilm();
}

class _ListFilm extends State<ListFilm>{
  Future<List<MoviePopular>> futureMovie;
  Future<List<Tv>> futureTv;
  Future<List<BestMovie>> futureBestMovie;


  @override
  void initState() {
    super.initState();
    futureMovie = fetchPopularMovie();
    futureTv = fetchPopularTv();
    futureBestMovie = fetchBestMovie();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
            fit: StackFit.expand,
            children:[
          Column(children: [
            Container(
              width:MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 15),
              child: Text('Popular Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              child:FutureBuilder<List<MoviePopular>>(
                  future: futureMovie,
                  builder: (context, snapshot){
                    if (snapshot.hasData){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:snapshot.data.length,
                          itemBuilder:(context, index ){
                            MoviePopular movie = snapshot.data[index];
                            return Container(
                              width: 150,
                              padding:EdgeInsets.all(5),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHomePage(id: movie.id, tv: false)),
                                    );
                                  },
                                  child: Image.network("https://image.tmdb.org/t/p/w500"+ movie.poster_path)
                              ),

                            );
                          }
                      );
                    } else if (snapshot.hasError){
                      return Text("%{snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 15),
              child: Text('Popular TV Shows',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Tv>>(
                  future: futureTv,
                  builder: (context, snapshot){
                    if (snapshot.hasData){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:snapshot.data.length,
                          itemBuilder:(context, index ){
                            Tv tv = snapshot.data[index];
                            return Container(
                              width: 150,
                              padding:EdgeInsets.all(5),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHomePage(id: tv.id, tv: true)),
                                    );
                                  },
                                  child: Image.network("https://image.tmdb.org/t/p/w500"+ tv.poster_path)
                              ),
                            );
                          }
                      );
                    } else if (snapshot.hasError){
                      return Text("%{snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 15),
              child: Text('Best Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<BestMovie>>(
                  future: futureBestMovie,
                  builder: (context, snapshot){
                    if (snapshot.hasData){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:snapshot.data.length,
                          itemBuilder:(context, index ){
                            BestMovie movie = snapshot.data[index];
                            return Container(
                              width: 150,
                              padding:EdgeInsets.all(5),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHomePage(id: movie.id, tv: false)),
                                    );
                                  },
                                  child: Image.network("https://image.tmdb.org/t/p/w500"+ movie.poster_path)
                              ),
                            );
                          }
                      );
                    } else if (snapshot.hasError){
                      return Text("%{snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }
              ),
            )
          ],)
          ])
    );
  }
}