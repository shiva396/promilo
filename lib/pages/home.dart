import 'package:flutter/material.dart';
import 'package:promilo/pages/home_widgets.dart';
import 'package:promilo/utils/theme.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({super.key});

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: UIcolor.themecolor,
            )),
        backgroundColor: UIcolor.bg,
        elevation: 20,
        // foregroundColor: Colors.grey,
        title: UItext.txt("Individual Meetup", 20, FontWeight.w900),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            children: [
              searchBar(context, height, width),
              const SizedBox(
                height: 20,
              ),
              sliderBar(
                context,
                height,
                width,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: UItext.txt(
                      "Trending Popular People", 16, FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              peopleCardsSlider(context, width, height)
            ],
          ),
        ),
      ),
    );
  }
}
