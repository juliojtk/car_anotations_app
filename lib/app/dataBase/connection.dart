import 'package:car_anotations_app/app/dataBase/scripit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{

  static Database _db;

  static Future<Database> getDatabase() async{
    if(_db == null){
      var path = join(await getDatabasesPath(), 'bd_car');
      //deleteDatabase(path); 
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createTable);
          //db.execute(insert);
        },
      );
    }
    return _db;
  }
}