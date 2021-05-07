import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'car_form_back.g.dart';

class CarFormBack = CarFormBackBase with _$CarFormBack;

abstract class CarFormBackBase with Store{

  Car car;
  var _service = GetIt.I.get<CarService>();

  bool isUpdate = false;

  @observable
  bool part = false;

  @observable
  bool seg = false;

  @observable
  String dateFormatted;

  @action
  changePart(bool newValue){
    part = newValue;
  }

  @action
  changeSeg(bool newValue){
    seg = newValue;
  }

  @action
  formatDate(BuildContext context, CarFormBack carBack){
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime(2050)).then((value){
        if(value == null){
          return;
        }else{
          DateFormat dateFormat = DateFormat('dd/MM/yyyy');
          dateFormatted = dateFormat.format(value);
          carBack.car.finishDate = dateFormatted;
        }
      }
    );
  }

  CarFormBackBase(BuildContext context){

    var parameter = ModalRoute.of(context).settings.arguments;

  if(parameter == null){
    car = Car();
  }else{
    isUpdate = true;
    car = parameter;
  }
    //car = (parameter == null) ? Car() : parameter;
  }

  saveCar() async{
    await _service.saveCar(car);
  }

  deleteCar(int id) async{
    await _service.deleteCar(id);
  }


}