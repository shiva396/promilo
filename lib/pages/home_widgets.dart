import 'package:flutter/material.dart';
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

// Implementing a new builder for rebuilding the widget for
// tracking the currentindex of the image in carousel slider
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
  return StatefulBuilder(builder: (context, changeState) {
    return Container(
        child: Column(
      children: [
        CarouselSlider(
          items: items,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              changeState(() {
                currentIndex = index;
              });
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
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < items.length; i++)
              Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == i ? Colors.black : Colors.grey),
              )
          ],
        )
      ],
    ));
  });
}

//Below widget gives the vignette effect for the picture to focus banner descripton
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

//Card widget implementation
Widget peopleCards(
    BuildContext context, width, height, cardname, cardiconpaths) {
  List<String> paths = [
    "assets/p1.jpg",
    "assets/p2.jpg",
    "assets/p3.jpg",
    "assets/p4.jpg",
    "assets/p5.jpg",
  ];
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    width: 350,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey)),
    child: Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: cardiconpaths,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UItext.txt(cardname, 20, FontWeight.w700),
                    const Text(
                      "1,028 Meetups",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          indent: 12,
          endIndent: 12,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 0, 8),
          child: Row(
            children: [
              for (int i = 0; i < paths.length; i++)
                Align(
                  widthFactor: 0.8,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(paths[i]),
                  ),
                )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 85,
              height: 26,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 108, 175),
                  borderRadius: BorderRadius.circular(3.0)),
              child: const Center(
                child: Text(
                  "See more",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

//peoplecards slider implementaion
Widget peopleCardsSlider(BuildContext context, width, height) {
  List<String> cardname = ["Author", "Marketer", "Analyst"];
  List<ImageIcon> cardiconpaths = [
    const ImageIcon(
      AssetImage("assets/feather.png"),
      color: UIcolor.themecolor,
      size: 50,
    ),
    const ImageIcon(
      AssetImage("assets/projector.png"),
      color: UIcolor.themecolor,
      size: 40,
    ),
    const ImageIcon(
      AssetImage("assets/analyst.png"),
      color: UIcolor.themecolor,
      size: 40,
    ),
  ];
  List<Widget> cards = [
    peopleCards(context, width, height, cardname[0], cardiconpaths[0]),
    peopleCards(context, width, height, cardname[1], cardiconpaths[1]),
    peopleCards(context, width, height, cardname[2], cardiconpaths[2])
  ];
  return CarouselSlider.builder(
    itemCount: cards.length,
    itemBuilder: (BuildContext context, int index, int realIndex) {
      return Transform.translate(
        offset: const Offset(-35, 0.0),
        child: Container(
          child: cards[index],
        ),
      );
    },
    options: CarouselOptions(
      viewportFraction: .86,
      height: 180,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      enlargeFactor: 0.1,
      reverse: false,
      scrollDirection: Axis.horizontal,
    ),
  );
}
