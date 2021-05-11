import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/view/viewBack/car_details_back.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var carBackDetails = CarDetailsBack(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        
        var width = constraints.biggest.width;
        var radius = width/4;

        return Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              CircleAvatar(
                child: carBackDetails.car.isSeviceOk == 'N' ? Icon(Icons.car_repair, size: width/3, color: Colors.black,) : Icon(Icons.car_rental, size: width/3, color: Colors.black,),
                radius: radius,
                backgroundColor: carBackDetails.car.isSeviceOk != 'N' ? Colors.green[400] : Colors.blue[400],
              ),
              SizedBox(height: 20,),
              Center(
                child: Text('${carBackDetails.car.carName.toUpperCase()} ${carBackDetails.car.board.toUpperCase()}', style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text('${carBackDetails.car.color.toUpperCase()}\n', textAlign: TextAlign.center,),
              ),
              Card(
                elevation: 20,
                child: ListTile(
                  title: Text(
                    'Total: ${carBackDetails.car.partPrice + carBackDetails.car.segPrice} ', 
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  subtitle: Padding(
                    child: Text(
                    'Part: ${carBackDetails.car.partPrice} \nSeg: ${carBackDetails.car.segPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.only(top: 10),
                  ),
                ),
              ),
              Card(
                elevation: 20,
                child: ListTile(
                  title: Text(
                    'Descrição Serviço', 
                    style: TextStyle(
                      fontSize: 19
                      ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Padding(
                    child: Text('${carBackDetails.car.description}',
                      style: TextStyle(
                        fontSize: 16
                      ),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.only(top: 10),
                  ),
                ),
              ),
              Card(
                elevation: 20,
                child: ListTile(
                  title: Text(
                    carBackDetails.changeLabelDate(),
                  ),
                  trailing: Container(
                    width: width/7,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.assignment_turned_in_outlined,
                            color: Colors.purple,
                            ), 
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmar Entrega'),
                                content: Text('O veículo ${carBackDetails.car.carName.toUpperCase()} \nPlaca: ${carBackDetails.car.board.toUpperCase()} já foi mesmo entregue?'),
                                actions: [
                                  FlatButton(
                                    child: Text('Não'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  FlatButton(
                                    child: Text('Sim'),
                                    onPressed: () {
                                      carBackDetails.isOk(carBackDetails.car.isSeviceOk, carBackDetails.car.id);
                                      Navigator.of(context).pushNamed(AppRoutes.HOME);
                                    }  
                                  )
                                ],
                              )
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back),            
                  onPressed: (){
                    carBackDetails.goToBack();
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}