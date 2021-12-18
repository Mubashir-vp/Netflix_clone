import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/screens/details.dart';
import 'package:netflix_clone/screens/httpservice.dart';
import 'package:netflix_clone/screens/popularmovies.dart';
import 'package:netflix_clone/screens/upcoming_details.dart';
import 'package:netflix_clone/upcoming.dart';

import '../users.dart';
import 'continuewatcing_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
                leading: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage(
                        "assets/netflixlogo.0.0-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 41.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("TV Shows",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                          const Text("Movies",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                floating: true,
                expandedHeight: 500.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "https://pldthome.com/images/default-source/news/the-king-eternal-monarch.png",
                        fit: BoxFit.fill,
                      )),
                  // centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.chromecast),
                    tooltip: 'Add new entry',
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                            "assets/ce1a68b494cd4914a8e724d40645ac6c.png")),
                  )
                ]),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  "My List",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Info",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Text(
                            "Trending",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                          future: HttpService().getRequest(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Users?> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  final data = snapshot.data!.results![index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(indd: index,)));
                                      },
                                      child: SizedBox(
                                          height: 70,
                                          width: 100,
                                          child: Image.network("https://www.themoviedb.org/t/p/original/${data.posterPath}",
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: snapshot.data!.results!.length,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Text(
                            "Continue Watching",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                          future: HttpService().popularMovie(),
                          builder: (BuildContext context,
                              AsyncSnapshot<PopularMovie?> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  final data = snapshot.data!.results![index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContinueWatching(indd: index,)));
                                      },

                                      child: SizedBox(
                                          height: 70,
                                          width: 100,
                                          child: Image.network("https://www.themoviedb.org/t/p/original/${data.posterPath}",
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: snapshot.data!.results!.length,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Text(
                            "UpComing",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                          future: HttpService().upComing(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Upcoming?> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  final data = snapshot.data!.results![index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: GestureDetector(
                                       onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Upcoming_deails(indd: index,)));
                                      },
                                      child: SizedBox(
                                          height: 70,
                                          width: 100,
                                          child: Image.network("https://www.themoviedb.org/t/p/original/${data.posterPath}",
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: snapshot.data!.results!.length,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
