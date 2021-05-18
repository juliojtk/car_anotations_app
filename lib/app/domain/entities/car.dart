
class Car{

int id;
String carName;
String board;
String color;
double partPrice;
double segPrice;
String finishDate;
String description;
String isSeviceOk;

Car({this.id, this.carName, this.board, this.color, this.partPrice, this.segPrice, this.finishDate, this.description, this.isSeviceOk});

Car.mapToModel(Map<String, dynamic> dados){
  this.id = dados['id'];
  this.carName = dados['carName'];
  this.board = dados['board'];
  this.color= dados['color'];
  this.partPrice = dados['partPrice'];
  this.segPrice = dados['segPrice'];
  this.finishDate = dados['finishDate'];
  this.description = dados['description'];
  this.isSeviceOk = dados['isSeviceOk'];

  }
}