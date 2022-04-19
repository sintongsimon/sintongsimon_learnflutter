import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/car.dart';
import '../../providers/carsprovider.dart';

final carDetailProvider = StateNotifierProvider.family
    .autoDispose<CarDetail, AsyncValue<Car>, int>((ref, index) {
  var provider = CarDetail(AsyncLoading(), ref.read(carDataSourceProvider));
  provider.getDataById(index);
  return provider;
});

class CarDetail extends StateNotifier<AsyncValue<Car>> {
  final CarDataSource _carDataSource;

  CarDetail(AsyncValue<Car> state, CarDataSource carDataSource)
      : _carDataSource = carDataSource,
        super(state);

  getDataById(int index) async {
    try {
      state = AsyncLoading();
      Car result = await _carDataSource.getById(index);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }

  toggleStarred(int index) async {
    try {
      state = AsyncLoading();
      Car result = await _carDataSource.toggleStarred(index);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}
