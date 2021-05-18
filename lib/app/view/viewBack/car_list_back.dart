import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/service/car_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'car_list_back.g.dart';

class CarListBack = CarListBackBase with _$CarListBack;

abstract class CarListBackBase with Store {

CarListBackBase(){
  refresListCar();
}

//Instanciando, usando injeção de dependencia
var _carService = GetIt.I.get<CarService>();

Car car;

int swap = 0; //Troca
bool isDateStart;

String dateLabelStart;
String dateLabelEnd;

@observable
String dateFormattedStart;

@observable
String dateFormattedEnd;

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

@action
serviceNotFinish(){
  listCar = _carService.serviceNotFinish();
  swap = 1;
}

Future<void> refresIndicator() async{
  refresListCar();
  swap = 0;
}

searchBetweenDates(String dateStart, String dateEnd){
  listCar = _carService.searchBetweenDates(dateStart, dateEnd);
  swap = 1;
}

removeCar(int id){
  _carService.deleteCar(id);
  refresListCar();
}

formatDate(BuildContext context, CarListBack carBack){
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
        if (isDateStart) {
          dateFormattedStart = dateFormat.format(value);
        }else{
          dateFormattedEnd = dateFormat.format(value);
        }
        formatDateShow(value);       
      }
    }
  );
}

String formatDateShow(DateTime value){
  DateFormat dateFormatLabel = DateFormat('dd-MM-yyyy');
  if (isDateStart) {
    print(dateLabelStart);
    return dateLabelStart = dateFormatLabel.format(value);
  } else{
    return dateLabelEnd = dateFormatLabel.format(value);
  }
}

double somaPrices(double part, double seg){
  double soma;
  if(part == null) part = 0.0;
  if(seg == null) seg = 0.0;
  soma = part + seg;
  return soma;
}

cleanDates(){
  dateFormattedStart = null;
  dateFormattedEnd = null;
}

goToCarForm(BuildContext ctx, [Car car]){
  Navigator.of(ctx).pushNamed(AppRoutes.CAR_FORM, arguments: car).then(refresListCar);
}

goToCarDetails(BuildContext context, Car car){
  Navigator.of(context).pushNamed(AppRoutes.CAR_DETAILS, arguments: car);
}

}