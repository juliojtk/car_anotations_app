import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'car_list_back.g.dart';

class CarListBack = CarListBackBase with _$CarListBack;

abstract class CarListBackBase with Store {

//Instanciando, usando injeção de dependencia
var _carService = GetIt.I.get<CarService>();

@observable
Future<List<Car>> listCar;


goToCarForm(BuildContext ctx, [Car car]){
  Navigator.of(ctx).pushNamed(AppRoutes.CAR_FORM, arguments: car).then(refresListCar());
}

@action
refresListCar([dynamic value]){
  listCar = _carService.listAllCar();
}

CarListBackBase(){
refresListCar();
}

remove(int id){
  return null;
}

}