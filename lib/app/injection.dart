
import 'package:car_anotations_app/app/dataBase/dao_impl/car_dao_impl.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<CarDao>(CarDaoImplement());
  getIt.registerSingleton<CarService>(CarService());
}