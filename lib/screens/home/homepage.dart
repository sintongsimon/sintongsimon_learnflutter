import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sintongsimon_learnflutter/providers/themeprovider.dart';
import 'package:sintongsimon_learnflutter/widgets/myappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = false;
    return Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            // const SizedBox(height: 40), //50
            // const Center(
            //     child: Text(
            //   "Beepy",
            //   style: TextStyle(
            //       fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 20),
            // )),
            const SizedBox(height: 30), //40
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
                    fontSize: 24)),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: Text("Find the perfect vehicle for every occasion!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 16))),
            const SizedBox(height: 20),
            Consumer(builder: (context, ref, child) {
              _isDarkMode = ref.read(themeProvider).IsDarkTheme;
              return Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  _isDarkMode = value;
                  if (_isDarkMode) {
                    ref.read(themeProvider.notifier).SetDark();
                  } else {
                    ref.read(themeProvider.notifier).SetLight();
                  }
                },
                activeTrackColor: Colors.orange,
                activeColor: Colors.white,
              );
            }),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.5, horizontal: 115),
                  onPrimary: Colors.white,
                  primary: Theme.of(context).colorScheme.primary,
                  // _isDarkMode
                  //     ? const Color(0xff1814E4)
                  //     : const Color(0xffFA7F35),
                  onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.pushNamed(context, "/Cars"),
                child: const Text("Continue")),
            const SizedBox(height: 20),
          ],
        ));
  }
}
