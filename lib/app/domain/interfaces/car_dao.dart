 import 'package:car_anotations_app/app/domain/entities/car.dart';

abstract class CarDao{

  Future<List<Car>> listAllCar();
  Future<List<Car>> searchCar(String value);
  Future<List<Car>> serviceNotFinish();
  Future<List<Car>> searchBetweenDates(String dateStart, String dateEnd);
  saveCar(Car car);
  deleteCar(int id);
  updateServiceOk(String value, int id);


}