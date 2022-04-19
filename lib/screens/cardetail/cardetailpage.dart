import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sintongsimon_learnflutter/models/car.dart';
import 'package:sintongsimon_learnflutter/screens/cardetail/cardetailprovider.dart';
import 'package:sintongsimon_learnflutter/widgets/myappbar.dart';

class CarDetailPage extends ConsumerWidget {
  final int _index;
  CarDetailPage({Key? key, required int index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final car = ModalRoute.of(context)!.settings.arguments as CarsModel;
    final AsyncValue<Car> _state = ref.watch(carDetailProvider(_index));

    return Scaffold(
        appBar: const MyAppBar(title: "Cars"),
        // AppBar(
        //   // foregroundColor: const Color(0xff000000),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   // shadowColor: Colors.white,
        //   leading: IconButton(
        //     padding: const EdgeInsets.only(left: 20),
        //     icon: const Icon(Icons.arrow_back_ios),
        //     onPressed: () => Navigator.pushNamed(context, "/"),
        //   ),
        //   centerTitle: true,
        //   title: const Text("Cars",
        //       style: TextStyle(
        //           fontFamily: "Poppins",
        //           fontWeight: FontWeight.w600,
        //           fontSize: 24)),
        //   actions: [
        //     IconButton(
        //       padding: const EdgeInsets.only(right: 20),
        //       iconSize: 40,
        //       icon: Image.asset('assets/images/Beep-Beep-Avatar.png'),
        //       onPressed: () {},
        //     )
        //   ],
        // ),
        body: _state.when(
            error: (exception, stackTrace) =>
                Center(child: Text("sum ting wen wong")),
            loading: () => Center(child: const CircularProgressIndicator()),
            data: (Car car) {
              return Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset(car.Image, width: 350)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: InkWell(
                        child: Ink(
                            decoration: BoxDecoration(
                                color: Color(car.ThemeColor),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        car.Name,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 39,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(carDetailProvider(_index)
                                                  .notifier)
                                              .toggleStarred(_index);
                                        },
                                        child: Icon(
                                          car.IsStarred
                                              ? Icons.star_rounded
                                              : Icons.star_outline_rounded,
                                          color: car.IsStarred
                                              ? Colors.yellow
                                              : Colors.white,
                                          size: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(car.Rent,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  const SizedBox(height: 25),
                                  const Text("Description",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Wanna ride the coolest ${car.Name.toLowerCase()} in the world?",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
              );
            }));
  }
}
