import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'car_list_back.g.dart';

class CarListBack = CarListBackBase with _$CarListBack;

abstract class CarListBackBase with Store {

CarListBackBase(){
  refresListCar();
}

//Instanciando, usando injeção de dependencia
var _carService = GetIt.I.get<CarService>();

@observable
Future<List<Car>> listCar;

@observable
List<Car> list;

@action
refresListCar([dynamic value]){
  listCar = _carService.listAllCar();
}

@action
searchCar(String value){
  listCar = _carService.searchCar(value);
}

removeCar(int id){
  _carService.deleteCar(id);
  refresListCar();
}

double somaPrices(double part, double seg){
  double soma;
  if(part == null) part = 0.0;
  if(seg == null) seg = 0.0;
  soma = part + seg;
  return soma;
}

goToCarForm(BuildContext ctx, [Car car]){
  Navigator.of(ctx).pushNamed(AppRoutes.CAR_FORM, arguments: car).then(refresListCar);
}

goToCarDetails(BuildContext context, Car car){
  Navigator.of(context).pushNamed(AppRoutes.CAR_DETAILS, arguments: car);
}

}