import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/exception/layerException.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:get_it/get_it.dart';


class CarService{

var _carDao = GetIt.I.get<CarDao>();

saveCar(Car car){
  validateNameCar(car.carName);
  _carDao.saveCar(car);
  
}

deleteCar(int id){
_carDao.deleteCar(id);

}

Future<List<Car>> listAllCar(){
  return _carDao.listAllCar();
}

validateNameCar(String nome){
  var min = 2;
  var max = 50;

  if(nome == null || nome == ''){
    throw new LayerException('O nome é obrigatorio');
  }else if(nome.length < min){
    throw new LayerException('O nome deve possuir pelo menos $min caracteres');
  }else if(nome.length >= max){
    throw new LayerException('O nome deve possuir no máximo $max caracteres');
  }

}


}