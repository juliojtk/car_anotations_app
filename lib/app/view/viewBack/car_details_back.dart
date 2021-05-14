import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CarDetailsBack{

  BuildContext context;
  Car car;

  String dateFormatted;

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

  changeLabelDate(String value){

    String labelDate;

    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    dateFormatted = dateFormat.format(DateTime.parse(value));

    if(car.finishDate == null){
      labelDate = 'Não Informado';
    }else if(car.isSeviceOk == 'N'){
      labelDate = 'Entrega Prevista $dateFormatted';
    }else{
      labelDate = 'Entregue $dateFormatted';
    }
    return labelDate;
  }

  validatePrice(double part, double seg){
    if (part == null) part = 0.0;
    if (seg == null) seg = 0.0;

    return 'Total: ${part + seg}';
  }

  showPrice(double part, double seg){
    if (part == null) part = 0.0;
    if (seg == null) seg = 0.0;

    return 'Particular: ${part.toDouble()} \nSeguro: ${seg.toDouble()}';
  }

  goToBack(){
    Navigator.of(context).pop();
  }

}