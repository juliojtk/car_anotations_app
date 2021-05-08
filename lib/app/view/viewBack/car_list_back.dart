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
  Navigator.of(ctx).pushNamed(AppRoutes.CAR_FORM, arguments: car).then(refresListCar);
}

goToCarDetails(BuildContext context, Car car){
  Navigator.of(context).pushNamed(AppRoutes.CAR_DETAILS, arguments: car);
}

@action
refresListCar([dynamic value]){
  listCar = _carService.listAllCar();
}

CarListBackBase(){
refresListCar();
}

removeCar(int id){
  _carService.deleteCar(id);
  refresListCar();
}

double somaPrices(double part, double seg){
  double soma;
  if (part != null || seg != null) {
    soma = part + seg;
  }else{
    part = 0.0;
    seg = 0.0;
    soma = part + seg;
  }
  return soma;
}

}