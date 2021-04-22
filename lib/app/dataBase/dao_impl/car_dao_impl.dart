import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:sqflite/sqflite.dart';

class CarDaoImplement implements CarDao{

Database _db;

  @override
  deleteCar(int id) {

    }
  
    @override
    Future<List<Car>> listAllCar() {

    }
  
    @override
    saveCar(Car car) {

  }

}