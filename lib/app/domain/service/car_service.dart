import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:get_it/get_it.dart';


class CarService{

var _carDao = GetIt.I.get<CarDao>();

saveCar(Car car){
  _carDao.saveCar(car);
  
}

deleteCar(int id){
_carDao.deleteCar(id);

}

Future<List<Car>> listAllCar(){
  return _carDao.listAllCar();
}


}