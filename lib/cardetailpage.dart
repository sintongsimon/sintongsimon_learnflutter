import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xff000000),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // shadowColor: Colors.white,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff2A3640),
            onPressed: () => Navigator.pushNamed(context, "/"),
          ),
          centerTitle: true,
          title: const Text("Cars",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black)),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              iconSize: 40,
              icon: Image.asset('assets/images/Beep-Beep-Avatar.png'),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Beep-Beep-Medium-Vehicle.png",
                    width: 375)),
            const SizedBox(height: 20),
            Expanded(
              child: InkWell(
                  child: Ink(
                      decoration: const BoxDecoration(
                          color: Color(0xff60B5F4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// left (description)
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sport Car",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 39,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const Text("\$55/day",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                    ]),

                                /// right (star)
                                Container(
                                  alignment: Alignment.topRight,
                                  child: StarButton(
                                    valueChanged: (_) {},
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 25),
                            const Text("Description",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            const SizedBox(height: 5),
                            const Text(
                                "Wanna ride the coolest sport car in the world?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Expanded(child: Container()),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.5, horizontal: 110),
                                  onPrimary: Colors.white,
                                  primary: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () => {},
                                child: const Text("Book Now",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)))
                          ],
                        ),
                      ))),
            ),
          ],
        ));
  }
}
