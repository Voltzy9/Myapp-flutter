import 'package:First_app/model/BestMovie.dart';
import 'package:First_app/model/DetailFilm.dart';
import './repository/DetailRepo.dart';
import 'package:flutter/material.dart';
import 'listFilm.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

void main() {
  runApp(MyApp());
}


Future<http.Response> fetchMovies() {
  return http.get('https://jsonplaceholder.typicode.com/albums/1');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.id, this.tv = false}) : super(key: key);
  int id;
  bool tv;

  @override
  _MyHomePageState createState() => _MyHomePageState(id, tv);
}

class _MyHomePageState extends State<MyHomePage> {
  Future<DetailFilm> futureDetail;
  int id;
  bool tv;

  _MyHomePageState(id, tv) {
    this.id = id;
    this.tv = tv;
  }

  @override
  void initState() {
    super.initState();
    if (tv) {
      futureDetail = fetchDetailTv(id);
    } else
      futureDetail = fetchDetail(id);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DetailFilm>(
            future: futureDetail,
            builder: (context, snapshot) {
              DetailFilm film = snapshot.data;
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/w500" + film.poster_path),
                        fit: BoxFit.cover
                    )
                ),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height * 0.5,
                      pinned: true,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListFilm()),
                          );
                        },
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: const EdgeInsets.only(left: 10),
                        title: Text(film.title),
                      )
                    ),
                    SliverFillRemaining(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.9,
                                  1]
                            )
                        ),
                        child: Column(children: [
                          Row(children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                              child:Text('15+', style: TextStyle(color: Colors.white)
                              ),
                            ),
                            Text('-', style: TextStyle(color: Colors.white)),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5, right: 10, left: 10),
                              child:Text(
                                  film.release_date.substring(0,4),
                                  style: TextStyle(color: Colors.white)
                              ),
                            ),
                            Text('-', style: TextStyle(color: Colors.white)),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5,left: 10),
                              child: Icon(
                                Icons.grade,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5, left: 2),
                              child:Text(
                                snapshot.data.vote_average,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]),
                          Wrap(children:
                          film.genres.map((e) => Container(
                              margin: EdgeInsets.only(top:5, bottom:15, right:5, left:10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.white,
                              ),
                              child: Text(e["name"]))
                          ).toList(),
                          ),
                          Wrap(children: [
                            Container(
                              // margin: EdgeInsets.only(top:15),
                              child: Text(
                                  'Cast: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                            Wrap(children:
                            film.cast.map((e) => Container(
                               margin: EdgeInsets.only( bottom:10, left:10),
                                child: Text(e["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                    )
                                )
                            )
                            ).toList(),
                            ),
                          ],),
                          Row(children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                  'Summary',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            )
                          ],),
                          Column(children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                  film.overview,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ),
                          ],)
                        ],),
                      ),
                    )
                  ],
                ),
              );
            }
        )
    );
  }
}


