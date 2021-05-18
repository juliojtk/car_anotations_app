import 'package:car_anotations_app/app/dataBase/connection.dart';
import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/domain/interfaces/car_dao.dart';
import 'package:sqflite/sqflite.dart';

class CarDaoImplement implements CarDao{

String tableName = 'carTable';
String id = 'id';
String carName = 'carName';
String board = 'board';
String color = 'color';
String partPrice = 'partPrice';
String segPrice = 'segPrice';
String finishDate = 'finishDate';
String description = 'description';
String isSeviceOk = 'isSeviceOk';

Database _db;

@override
Future<List<Car>> listAllCar() async{
  _db = await Connection.getDatabase();
  List<Map<String, dynamic>> resultList = await _db.query(tableName);
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
  Future<List<Car>> searchCar(String value) async{
    _db = await Connection.getDatabase();
    var sql = "SELECT * FROM $tableName WHERE $carName LIKE '%$value%' OR $board LIKE '%$value%'";
    List<Map<String, dynamic>> resultlist = await _db.rawQuery(sql);
    List<Car> listNameCar = List.generate(resultlist.length, (i) {
      return Car.mapToModel(resultlist[i]);
    });
  return listNameCar;
}

@override
  Future<List<Car>>serviceNotFinish() async{
    _db = await Connection.getDatabase();
    var sql = "SELECT * FROM $tableName WHERE $isSeviceOk = 'N' ";
    List<Map<String, dynamic>> result = await _db.rawQuery(sql);
    List<Car> list = List.generate(result.length, (i) {
      return Car.mapToModel(result[i]);
      }
    );
    return list;
  }

  @override
  Future<List<Car>>searchBetweenDates(String dateStart, String dateEnd) async{
    _db = await Connection.getDatabase();
    //var sql = "SELECT * FROM $tableName WHERE $finishDate >= '01/05/2021' and $finishDate <= '19/05/2021' ";
    var sql = "SELECT * FROM $tableName WHERE $finishDate BETWEEN '$dateStart' AND '$dateEnd' ";
    List<Map<String, dynamic>> result = await _db.rawQuery(sql);
    List<Car> list = List.generate(result.length, (i) {
      return Car.mapToModel(result[i]);
      }
    );
    return list;
  }

@override
  saveCar(Car car) async{
    _db = await Connection.getDatabase();
    var sql;
    if(car.id == null){
      sql = 'INSERT INTO $tableName ($carName, $board, $color, $partPrice, $segPrice, $finishDate, $description, $isSeviceOk) VALUES(?,?,?,?,?,?,?,?)';
      _db.rawInsert(sql, [car.carName, car.board, car.color, car.partPrice, car.segPrice, car.finishDate, car.description, 'N']);
    }else{
      sql = 'UPDATE $tableName SET $carName = ?, $board = ?, $color = ?, $partPrice = ?, $segPrice = ?, $finishDate = ?, $description = ?, $isSeviceOk = ? WHERE id = ?';
      _db.rawUpdate(sql, [car.carName, car.board, car.color, car.partPrice, car.segPrice, car.finishDate, car.description, car.isSeviceOk, car.id]);
    }
  }

@override
  deleteCar(int id) async{
    _db = await Connection.getDatabase();
    var sql = 'DELETE FROM $tableName WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

@override
  updateServiceOk(String value, int id) async{
    _db = await Connection.getDatabase();
    var sql = 'UPDATE $tableName SET $isSeviceOk = ? WHERE id = ?';
    _db.rawUpdate(sql, [value, id]);
  }

}