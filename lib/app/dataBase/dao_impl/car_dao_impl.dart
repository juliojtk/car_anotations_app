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
        partPrice: line['partPrice'].toString(),
        segPrice: line['segPrice'].toString(),
        finishDate: line['finishDate'],
        description: line['description'],
        isSeviceOk: line['isSeviceOk']
      );
    });
  return carList;
  }

  @override
  saveCar(Car car) async{
    _db = await Connection.getDatabase();
    var sql;
    if(car.id == null){
      sql = 'INSERT INTO carTable (carName, board, color, partPrice, segPrice, finishDate, description, isSeviceOk) VALUES(?,?,?,?,?,?,?,?)';
      _db.rawInsert(sql, [car.carName, car.board, car.color, car.partPrice, car.segPrice, car.finishDate, car.description, car.isSeviceOk]);
    }else{
      sql = 'UPDATE carTable SET carName = ?, board = ?, color = ?, partPrice = ?, segPrice = ?, finishDate = ?, description = ?, isSeviceOk = ? WHERE id = ?';
      _db.rawUpdate(sql, [car.carName, car.board, car.color, car.partPrice, car.segPrice, car.finishDate, car.description, car.isSeviceOk, car.id]);
    }
  }

  @override
  deleteCar(int id) async{
    _db = await Connection.getDatabase();
    var sql = 'DELETE FROM carTable WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

}