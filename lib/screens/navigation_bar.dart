
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/screens/fast_laugh.dart';
import 'package:netflix_clone/screens/new_hot.dart';
import 'package:netflix_clone/screens/search.dart';

import 'downloads.dart';
import 'home.dart';



class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  _HomeeState createState() => _HomeeState();
}

final screens = [
  const HomePage(),
  const New(),
  const Fast(),
  const Search(),
  const Downloads()
];

class _HomeeState extends State<Homee> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 11.56,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: HexColor("#666366"),
          showUnselectedLabels: true,
          backgroundColor: HexColor("#020004"),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items:  const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.photoVideo,
              ),
              label: "New & Hot",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.smileBeam,
              ),
              label: "Fast Laughs",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.search,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.arrowAltCircleDown,
              ),
              label: "Downloads",
            )
          ],
        ),
      ),
      body: IndexedStack(index: currentIndex, children: screens),
    );
  }
}
