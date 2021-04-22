
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<CarService>(CarService());
}