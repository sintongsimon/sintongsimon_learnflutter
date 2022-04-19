import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sintongsimon_learnflutter/models/car.dart';

List<Car> cars = [
  Car("1", "Classic Car", "\$34/day", "assets/images/classiccar.png",
      "assets/images/classiccar.png", 0xffB67853, false),
  Car("2", "Sport Car", "\$55/day", "assets/images/sportcar.png",
      "assets/images/Beep-Beep-Medium-Vehicle.png", 0xff60B5F4, false),
  Car("3", "Flying Car", "\$500/day", "assets/images/flyingcar.png",
      "assets/images/flyingcar.png", 0xff8382C2, false),
  Car("4", "Electric Car", "\$45/day", "assets/images/electriccar.png",
      "assets/images/electriccar.png", 0xff2A3640, false)
];

final carDataSourceProvider = Provider<CarDataSource>((ref) {
  return CarDataSourceDummy();
});

abstract class CarDataSource {
  Future<List<Car>> getAll();
  Future<Car> getById(int index);
  Future<Car> toggleStarred(int index);
}

class CarDataSourceDummy implements CarDataSource {
  @override
  Future<List<Car>> getAll() {
    return Future.delayed(const Duration(seconds: 1), () => cars);
  }

  @override
  Future<Car> getById(int index) =>
      Future.delayed(const Duration(seconds: 1), () => cars[index]);

  @override
  Future<Car> toggleStarred(int index) {
    List<Car> temp = [...cars];
    temp[index] = temp[index].CopyWith(isStarred: !temp[index].IsStarred);
    cars = [...temp];
    return Future.delayed(const Duration(milliseconds: 500), () => temp[index]);
  }
}
// final carsProvider = StateNotifierProvider<Cars, CarsModel>((ref) {
//   return Cars(CarsModel(null, null, null, null, null, null));
// });

// class Cars extends StateNotifier<CarsModel> {
//   Cars(state) : super(state);

//   SetCar(String id, String name, String rent, String image, Color color,
//       bool isStarred) {
//     state = CarsModel(id, name, rent, image, color, isStarred);
//   }
// }
