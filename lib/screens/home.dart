import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/screens/httpservice.dart';
import 'package:netflix_clone/user.dart';
import 'package:netflix_clone/user_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

   HttpService http=HttpService();
   List<User> users=[];
   ListUserResponse listUserResponse=ListUserResponse();
  Future getUser() async {
    Response response;
    try {
      isLoading = true;

      response = await http.getRequest(
          "https://api.themoviedb.org/3/movie/8?api_key=3e801f599186241c08d9adfa803d6fd0&language=en-US");

      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          users = listUserResponse.users;
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
       HttpService http=HttpService();

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
                            "Tv shows",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child:  Image.network(
                                          "https://www.kerala9.com/wp-content/uploads/2021/10/minnal-murali-poster-hd-1024x1024.jpg",
                                          fit: BoxFit.cover,
                                        )
                                      ),
                            );
                          },
                          separatorBuilder: (ctx, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: 5),
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
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: SizedBox(
                                height: 150,
                                width: 100,
                                child: Image.network(
                                  "https://wallpapercave.com/wp/wp10363322.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: 5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Text(
                            "Trending Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: SizedBox(
                                height: 150,
                                width: 100,
                                child: Image.network(
                                  "https://www.filmibeat.com/ph-big/2021/08/pushpa_163012974311.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: 5),
                    )
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
