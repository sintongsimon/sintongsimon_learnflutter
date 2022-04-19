import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sintongsimon_learnflutter/main.dart';
import 'package:sintongsimon_learnflutter/screens/carlist/carlistprovider.dart';
import 'package:sintongsimon_learnflutter/widgets/myappbar.dart';
import '../../models/car.dart';
import 'package:sintongsimon_learnflutter/router.dart' as router;

class CarListPage extends ConsumerWidget {
  const CarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Car>> _state = ref.watch(carListProvider);
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
            loading: () => Center(child: CircularProgressIndicator()),
            error: (exception, stackTrace) {
              return Center(child: Text("sam ting wen wong"));
            },
            data: (cars) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: cars.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 160,
                    width: 305,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(
                        bottom: 47,
                        left: 35,
                        right: 35,
                        top: index == 0 ? 47 : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(cars[index].ThemeColor),
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, router.CarDetailScreen,
                                arguments: index)
                            .then((value) =>
                                ref.read(carListProvider.notifier).LoadData())
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cars[index].Name,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            cars[index].Rent,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 20,
                              ),
                              Positioned(
                                top: -15,
                                right: -20,
                                child: Container(
                                  height: 124,
                                  width: 200,
                                  child: Image.asset(cars[index].Image),
                                ),
                              )
                            ],
                          ),
                          Icon(
                            cars[index].IsStarred
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            size: 33,
                            color: cars[index].IsStarred
                                ? Colors.yellow
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }));

    // SingleChildScrollView(
    //     child: Padding(
    //         padding:
    //             const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
    //         child: Column(
    //           children: [for (var car in cars) CarCard(car, context)],
    //         ))));
  }

  Widget CarCard(Car car, BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 180,
        child: Stack(children: [
          Container(
              alignment: Alignment.bottomRight,
              child: Image.asset(car.Thumbnail.toString(), width: 200)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: 150,
            child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, "/CarDetail", arguments: car),
                child: Ink(
                    decoration: BoxDecoration(
                        color: Color(car.ThemeColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.Name.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            car.Rent.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Icon(
                                    car.IsStarred
                                        ? Icons.star_rounded
                                        : Icons.star_border_rounded,
                                    color: car.IsStarred
                                        ? Colors.amber
                                        : Colors.white,
                                    size: 40,
                                  )))
                        ],
                      ),
                    ))),
          )
        ]));
  }
}
