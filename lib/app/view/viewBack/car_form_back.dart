import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CarFormBack{
  Car car;
  var _service = GetIt.I.get<CarService>();

  CarFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    car = (parameter == null) ? Car() : parameter;
  }
}