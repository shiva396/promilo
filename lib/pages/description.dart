import 'package:flutter/material.dart';
import 'package:promilo/pages/home.dart';
import 'package:promilo/utils/widgets.dart';
import 'package:promilo/utils/theme.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  String para =
      "From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeSCreen()),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: UIcolor.themecolor,
            )),
        backgroundColor: UIcolor.bg,
        elevation: 20,
        // foregroundColor: Colors.grey,
        title: UItext.txt("Description", 20, FontWeight.w900),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shareCardSlider(context, width, height),
              interactRow(context, width, height),
              UItext.txt("Actor Name", 18, FontWeight.w600),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Indian Actress",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.black54,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Duration 20 Mins",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.feed_outlined,
                    color: Colors.black54,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Total Average Fees ₹9,999",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              UItext.txt("About", 18, FontWeight.w600),
              const SizedBox(height: 10),
              Text(
                para,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    "See More",
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 93, 150),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: bottomNavigationBar(context, width, height),
    );
  }
}
