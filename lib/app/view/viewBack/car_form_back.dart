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

  CarFormBackBase(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    if(parameter == null){
      car = Car();
    }else{
      isUpdate = true;
      car = parameter;
      formatDateShow(DateTime.parse(car.finishDate == null ? DateTime.now().toString() : car.finishDate));
    }
  }

  Car car;
  var _service = GetIt.I.get<CarService>();

  bool _nameIsValid;
  bool get isValid => _nameIsValid;
  String dateLabel;

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
          //Formato para salvar no Banco de Dados
          DateFormat dateFormat = DateFormat('yyyy-MM-dd');
          dateFormatted = dateFormat.format(value);
          carBack.car.finishDate = dateFormatted;

          formatDateShow(value);
        }
      }
    );
  }

  //Formato de data para visualizar
  String formatDateShow(DateTime value){
    DateFormat dateFormatLabel = DateFormat('dd-MM-yyyy');
    return dateLabel = dateFormatLabel.format(value);
  }

  String validateCarName(String nome){
    try{
      _service.validateNameCar(nome);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }

  validaPricePart(String newValue){
    if(newValue == ''){
      newValue = 0.0.toString();
      car.partPrice = double.parse(newValue);
    }else{
      car.partPrice = double.parse(newValue);
    }
  }

  validaPriceSeg(String newValue){
    if(newValue == ''){
      newValue = 0.0.toString();
      car.segPrice = double.parse(newValue);
    }else{
      car.segPrice = double.parse(newValue);
    }
  }

  saveCar() async{
    await _service.saveCar(car);
  }

  deleteCar(int id) async{
    await _service.deleteCar(id);
  }


}
