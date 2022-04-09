import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
              child: Text(
            "Beepy",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black),
          )),
          const SizedBox(height: 70),
          Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/Beep-Beep-Drifting.png",
                  width: 427)),
          const SizedBox(height: 30),
          const Text("Find Your Vehicle",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black)),
          const SizedBox(height: 15),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
              child: Text("Find the perfect vehicle for every occasion!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black))),
          Expanded(child: Container()),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.5, horizontal: 115),
                onPrimary: Colors.white,
                primary: const Color(0xffFA7F35),
                onSurface: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.pushNamed(context, "/CarDetailPage"),
              child: const Text("Continue")),
          const SizedBox(height: 30),
        ],
      ),
    ));
  }
}
