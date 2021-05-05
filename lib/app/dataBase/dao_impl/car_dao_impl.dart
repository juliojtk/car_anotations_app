import 'package:car_anotations_app/app/dataBase/connection.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:sqflite/sqflite.dart';

class CarDaoImplement implements CarDao{

Database _db;

    @override
    Future<List<Car>> listAllCar() async{
      _db = await Connection.getDatabase();
      List<Map<String, dynamic>> resultList = await _db.query('carTable');
      List<Car> carList = List.generate(resultList.length, (i){
        var line = resultList[i];
        return Car(
          id: line['id'],
          carName: line['carName'],
          board: line['board'],
          color: line['color'],
          partPrice: line['partPrice'],
          segPrice: line['segPrice'],
          finishDate: line['finishDate'],
          description: line['description'],
          isSeviceOk: line['isSeviceOk']
        );
      });
    return carList;
    }
  
    @override
    saveCar(Car car) {
    }

    @override
    deleteCar(int id) {

    }

}