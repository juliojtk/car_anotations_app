import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsBack{

  BuildContext context;
  Car car;

  CarDetailsBack(this.context){
    car = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }



}