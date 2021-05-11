import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CarDetailsBack{

  BuildContext context;
  Car car;

  var _carService = GetIt.I.get<CarService>();

  CarDetailsBack(this.context){
    car = ModalRoute.of(context).settings.arguments;
  }

  isOk(String value, int id){
    if(value == 'N'){
      value = 'S';
      _carService.updateServiceOk(value, id);
    }
  }

  changeLabelDate(){
    String labelDate;
    if(car.finishDate == null){
      labelDate = 'Não Informado';
    }else if(car.isSeviceOk == 'N'){
      labelDate = 'Entrega Prevista ${car.finishDate}';
    }else{
      labelDate = 'Entregue ${car.finishDate}';
    }
    return labelDate;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

}