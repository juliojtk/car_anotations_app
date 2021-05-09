 import 'package:car_anotations_app/app/domain/entities/car.dart';

abstract class CarDao{

  
   saveCar(Car car);

   deleteCar(int id);

   Future<List<Car>> searchCar(String carName);

   Future<List<Car>> listAllCar();



}