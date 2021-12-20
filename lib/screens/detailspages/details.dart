import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/users.dart';
import '../../service/httpservice.dart';

class DetailsPage extends StatefulWidget {
  final int indd;

  const DetailsPage({required this.indd});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FutureBuilder(
                future: HttpService().getRequest(),
                builder:
                    (BuildContext context, AsyncSnapshot<Users?> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.results![widget.indd];
                    return FlexibleSpaceBar(
                      background: SizedBox(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            "https://www.themoviedb.org/t/p/original${data.backdropPath}",
                            fit: BoxFit.fill,
                          )),
                      // centerTitle: true,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            actions: <Widget>[
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.chromecast),
                tooltip: 'Add new entry',
                onPressed: () {},
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.cancel_outlined))
            ]),
        SliverToBoxAdapter(
          child: FutureBuilder(
              future: HttpService().getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot<Users?> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.results![widget.indd];

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${data.title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${data.voteAverage.toString()}%',
                                style: TextStyle(color: HexColor("#579165")),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '   ${data.releaseDate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  TextSpan(
                                      text: '   ${data.originalLanguage}',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14, top: 8),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.height / 1.2,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14, top: 8),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.height / 1.2,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        HexColor("#2A2A2A"))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Download",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ))),
                      ),
                      Text(
                        "${data.overview}",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
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
                                    SizedBox(
                                      height: 6,
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
                                onPressed: () {},
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Rate",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.paperPlane,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Share",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        )
      ]),
    );
  }
}
