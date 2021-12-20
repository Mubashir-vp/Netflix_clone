import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/model/users.dart';
import 'package:netflix_clone/screens/detailspages/details.dart';
import 'package:netflix_clone/service/httpservice.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                  width: 20,
                  height: 20,
                  image: AssetImage(
                      "assets/ce1a68b494cd4914a8e724d40645ac6c.png")),
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, color: HexColor("#B4B4B4")),
                      suffixIcon: Icon(Icons.mic, color: HexColor("#B4B4B4")),
                      hintText: "Search for a movie",
                      hintStyle: TextStyle(color: HexColor("#5D5D5D")),
                      fillColor: HexColor("#323232"),
                      filled: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Text("Top Searches",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500))
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
                                        final data =
                                            snapshot.data!.results![index];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          DetailsPage(
                                                            indd: index,
                                                          )));
                                            },
                                            child: SizedBox(
                                                height: 70,
                                                width: 100,
                                                child: Image.network(
                                                  "https://www.themoviedb.org/t/p/original${data.posterPath}",
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
        ));
  }
}
