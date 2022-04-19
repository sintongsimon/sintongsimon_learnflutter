import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/car.dart';
import '../../providers/carsprovider.dart';

final carListProvider =
    StateNotifierProvider<CarList, AsyncValue<List<Car>>>((ref) {
  var provider = CarList(AsyncLoading(), ref.read(carDataSourceProvider));
  provider.LoadData();
  return provider;
});

class CarList extends StateNotifier<AsyncValue<List<Car>>> {
  final CarDataSource _carDataSource;

  CarList(AsyncValue<List<Car>> state, CarDataSource carDataSource)
      : _carDataSource = carDataSource,
        super(state);

  LoadData() async {
    try {
      state = AsyncLoading();
      List<Car> result = await _carDataSource.getAll();
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}
