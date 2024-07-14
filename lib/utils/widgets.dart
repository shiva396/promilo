import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:promilo/pages/description.dart';
import 'package:promilo/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share_plus/share_plus.dart';

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
        ),
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

//Implentaion of the meetup section
Widget meetupCard(BuildContext context, width, height) {
  return Container();
}

Widget bottomNavigationBar(BuildContext context, width, height) {
  List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(
        label: "Home",
        icon: SizedBox(
          height: 30,
          child: Image.asset(
            "assets/m1.png",
            scale: 2,
            color: UIcolor.themecolor,
          ),
        )),
    BottomNavigationBarItem(
        label: "Project",
        icon: SizedBox(
          height: 30,
          child: Image.asset(
            "assets/m2.png",
            scale: 2,
            color: UIcolor.themecolor,
          ),
        )),
    BottomNavigationBarItem(
        label: "Meetup",
        icon: SizedBox(
          height: 40,
          child: Image.asset(
            "assets/m3.png",
            scale: 2,
            color: const Color.fromARGB(255, 0, 255, 251),
          ),
        )),
    BottomNavigationBarItem(
        label: "Explore",
        icon: SizedBox(
          height: 30,
          child: Image.asset(
            "assets/m4.png",
            scale: 2,
            color: UIcolor.themecolor,
          ),
        )),
    BottomNavigationBarItem(
        label: "Account",
        icon: SizedBox(
          height: 30,
          child: Image.asset(
            "assets/m5.png",
            scale: 2,
            color: UIcolor.themecolor,
          ),
        ))
  ];
  return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: Color.fromARGB(255, 0, 255, 251),
      // unselectedLabelStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 251)),
      selectedLabelStyle:
          const TextStyle(color: Color.fromARGB(255, 0, 255, 251)),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      iconSize: 50,
      items: [
        icons[0],
        icons[1],
        icons[2],
        icons[3],
        icons[4],
      ]);
}

Widget imageFitContainer(path, height) {
  return Container(
      height: height * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)));
}

int currentIndex = 0;

List<String> paths = [
  "assets/d1.jpg",
  "assets/d2.jpg",
  "assets/d3.jpg",
  "assets/d4.jpg",
  "assets/d5.jpg",
];
Widget sliderWithOverlayDotIndicator(BuildContext context, width, height) {
  List<Widget> images = [
    imageFitContainer(paths[0], height),
    imageFitContainer(paths[1], height),
    imageFitContainer(paths[2], height),
    imageFitContainer(paths[3], height),
    imageFitContainer(paths[4], height),
  ];

  return StatefulBuilder(builder: (context, changeState) {
    return Stack(
      children: [
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              changeState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            height: height * 0.5,
            aspectRatio: 16 / 9,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < images.length; i++)
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == i
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(196, 247, 244, 244)),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  });
}

Widget shareCardSlider(BuildContext context, width, height) {
  return Stack(
    children: [
      Container(
        height: height * 0.48,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.download,
                      size: 30,
                      color: Colors.black54,
                    ),
                    const Icon(
                      Icons.bookmark_border_outlined,
                      size: 30,
                      color: Colors.black54,
                    ),
                    const Icon(
                      Icons.favorite_outline_rounded,
                      size: 30,
                      color: Colors.black54,
                    ),
                    const Icon(
                      Icons.fullscreen_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                    const Icon(
                      Icons.star_border_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                    GestureDetector(
                      onTap: () async {
                        shareIt(context, [currentIndex]);
                      },
                      child: const Icon(
                        Icons.share_outlined,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        height: height * 0.425,
        width: width,
        child: sliderWithOverlayDotIndicator(context, width, height),
      ),
    ],
  );
}

void shareIt(BuildContext context, Path) async {
  final ByteData bytes = await rootBundle.load('assets/d1.jpg');
  final Uint8List list = bytes.buffer.asUint8List();
  final tempDir = await getTemporaryDirectory();
  final file = await File('${tempDir.path}/d1.jpg').create();
  file.writeAsBytesSync(list);
  Share.shareFiles([file.path], text: 'Great picture');
}

Widget interactRow(BuildContext context, width, height) {
  return Container(
    padding: const EdgeInsets.only(top: 15, bottom: 20),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.bookmark_border_rounded,
          color: Color.fromARGB(255, 2, 93, 150),
          size: 24,
        ),
        const Text(
          "1034",
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 3,
        ),
        const Icon(
          Icons.favorite_outline_rounded,
          color: Color.fromARGB(255, 2, 93, 150),
          size: 24,
        ),
        const Text(
          "1034",
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          height: 22,
          width: 110,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 3; i++)
                const Icon(
                  Icons.star_rounded,
                  size: 18,
                  color: Color.fromARGB(255, 3, 219, 216),
                ),
              const Icon(
                Icons.star_rounded,
                size: 18,
                color: Color.fromARGB(136, 39, 248, 244),
              ),
              const Icon(
                Icons.star_rounded,
                size: 18,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          "3.2",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 2, 93, 150)),
        ),
        const SizedBox(
          width: 65,
        )
      ],
    ),
  );
}

Widget meetCardFitContainer(path, height) {
  return Container(
      height: height * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)));
}

Widget meetCardsSlider(BuildContext context, width, height) {
  List<String> cardnumber = ["01", "02", "03", "04", "05"];

  return CarouselSlider.builder(
    itemCount: cardnumber.length,
    itemBuilder: (BuildContext context, int index, int realIndex) {
      return Transform.translate(
        offset: const Offset(-95, 0.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DescriptionScreen()),
                  );
                },
                child: meetCard(context, width, height, cardnumber[index]))),
      );
    },
    options: CarouselOptions(
      viewportFraction: .52,
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

Widget meetCard(BuildContext context, width, height, cardnumber) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
          height: height * 0.3,
          width: width * 0.43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: const DecorationImage(
                  image: AssetImage("assets/meetcard.jpg"),
                  fit: BoxFit.cover))),
      Container(
        height: 64,
        width: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            cardnumber,
            style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 13, 62)),
          ),
        ),
      ),
    ],
  );
}
