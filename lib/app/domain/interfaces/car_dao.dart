 import 'package:car_anotations_app/app/domain/entities/car.dart';

abstract class CarDao{

  
   saveCar(Car car);

   deleteCar(int id);

   Future<List<Car>> listAllCar();



}