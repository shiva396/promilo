import 'package:flutter/material.dart';
import 'package:promilo/pages/home.dart';
import 'package:promilo/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget searchBar(BuildContext context, height, width) {
  return Container(
    width: width,
    height: height * 0.06,
    child: const TextField(
        decoration: InputDecoration(
      // labelText: "Search",
      hintText: "Search",
      hintStyle: TextStyle(fontSize: 20),
      hoverColor: UIcolor.themecolor,
      // focusColor: UIcolor.themecolor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 2, color: UIcolor.themecolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 2, color: UIcolor.themecolor),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
        child: ImageIcon(
          AssetImage("assets/search.png"),
          color: UIcolor.themecolor,
        ),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 20),
        child: ImageIcon(
          AssetImage("assets/mic.png"),
          color: UIcolor.themecolor,
        ),
      ),
    )),
  );
}

// HomeSCreen funcUse = new HomeSCreen();

Widget sliderBar(BuildContext context, height, width) {
  List<Widget> items = [
    vignettePics(
        "assets/meet1.jpg", "Popular Meetups \nin India", width, height),
    vignettePics("assets/meet2.jpg", "Discover India's \nbest presentations",
        width, height),
    vignettePics(
        "assets/meet3.jpg", "Attend top \nmeetings in India", width, height),
  ];
  int currentIndex = 0;
  return Container(
      child: Column(
    children: [
      CarouselSlider(
        items: items,
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            // funcUse.newStat
            // currentIndex = changeState(currentIndex, index);
          },
          viewportFraction: 1,
          height: 180,
          aspectRatio: 16 / 9,
          initialPage: 0,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.1,
          scrollDirection: Axis.horizontal,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < items.length; i++)
            Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == i ? Colors.black : Colors.grey),
            )
        ],
      )
    ],
  ));
}

Widget vignettePics(String path, text, width, height) {
  return Stack(
    children: [
      Container(
        width: width,
        height: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          width: width,
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const RadialGradient(
              center: Alignment.bottomLeft,
              radius: 3,
              colors: [
                Color.fromRGBO(33, 33, 33, 0.796),
                Color.fromARGB(0, 54, 57, 57),
                Color.fromARGB(0, 67, 70, 70),
              ],
              stops: [0.2, 0.8, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 25),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18, color: UIcolor.bg, fontWeight: FontWeight.w700),
            ),
          )),
    ],
  );
}
