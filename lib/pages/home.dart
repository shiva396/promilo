import 'package:flutter/material.dart';
import 'package:promilo/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UIcolor.bg,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: height * 0.11,
                child: const Text(
                  "promilo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: height * 0.08,
                child: const Text(
                  "Hi, Welcome Back!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 27, 60, 84)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "   Please Sign in to continue",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 18, 79, 99),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      hintText: 'Enter Email or Mob No.',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Sign In with OTP  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 25, 122, 155),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "   Password",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 18, 79, 99),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      hintText: 'Enter Password',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: checkBoxValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkBoxValue = newValue!;
                                });
                              }),
                          const Text(
                            "Remember Me",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const Text(
                        "Forget Password  ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 25, 122, 155),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: width * 0.93,
                height: 55,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 145, 176, 205),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 0, 126, 204))),
                child: const Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(
                      color: UIcolor.bg,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  endIndent: 3.0,
                  indent: 9.0,
                )),
                Text("or"),
                Expanded(
                    child: Divider(
                  indent: 3.0,
                  endIndent: 9.0,
                )),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(height: 50, image: AssetImage("assets/google.png")),
                  Image(height: 50, image: AssetImage("assets/linkedin.png")),
                  Image(height: 50, image: AssetImage("assets/facebook.png")),
                  Image(height: 50, image: AssetImage("assets/instagram.png")),
                  SizedBox(
                    width: 5,
                  ),
                  Image(height: 35, image: AssetImage("assets/whatsapp.png")),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buisness User?",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("Don't have an account",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Login Here",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 25, 122, 155),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 25, 122, 155),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "By continuing, you agree to",
                    style: TextStyle(color: Color.fromARGB(255, 133, 133, 133)),
                  ),
                  Text.rich(
                    TextSpan(
                      // text: 'Promilo\'s ', style: TextStyle(color: Color.fromARGB(255, 133, 133, 133),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Promilo's ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 133, 133))),
                        TextSpan(
                            text: 'Terms of Use & Privacy Policy',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
