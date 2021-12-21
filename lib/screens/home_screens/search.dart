import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/model/toprated_movies.dart';
import 'package:netflix_clone/model/users.dart';
import 'package:netflix_clone/screens/detailspages/details.dart';
import 'package:netflix_clone/service/httpservice.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchkey = "";
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  style:TextStyle(color:Colors.white),
                  onChanged: (String text) {
                    setState(() {
                      searchkey = text;
                    });
                  },
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
              searchkey == ""
                  ? Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder(
                            future: HttpService().getRequest(),
                            builder: (BuildContext context,
                                AsyncSnapshot<Users?> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  itemBuilder: (ctx, index) {
                                    final data = snapshot.data!.results![index];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DetailsPage(
                                                            indd: index,
                                                          )));
                                        },
                                        child: ListTile(
                                          trailing:const Icon(Icons.play_circle,color: Colors.white,),
                                          tileColor: HexColor("#221F20"),
                                          title: Text("${data.title}",style: const TextStyle(color: Colors.white),),
                                          leading: SizedBox(
                                              child: Image.network(
                                            "https://www.themoviedb.org/t/p/original${data.posterPath}",
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) =>
                                      const SizedBox(
                                    height: 10,
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
                  )
                  : Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width ,
                        child: FutureBuilder(
                            future: HttpService().search(txt: searchkey.replaceAll(" ", "%20")),
                            builder: (BuildContext context,
                                AsyncSnapshot<Welcome?> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  itemBuilder: (ctx, index) {
                                    final data = snapshot.data!.results![index];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DetailsPage(
                                                            indd: index,
                                                          )));
                                        },
                                        child:ListTile(
                                            trailing:const Icon(Icons.play_circle,color: Colors.white,),
                                            tileColor: HexColor("#221F20"),
                                            title: Text("${data.title}",style: const TextStyle(color: Colors.white),),
                                            leading: SizedBox(
                                                child: Image.network(
                                              "https://www.themoviedb.org/t/p/original${data.posterPath}",
                                              fit: BoxFit.cover,
                                            )),
                                          ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) =>
                                      const SizedBox(
                                    height: 10,
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
                  )
            ],
          ),
        ));
  }
}
