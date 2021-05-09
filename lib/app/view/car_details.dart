import 'package:car_anotations_app/app/view/viewBack/car_details_back.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var carBack = CarDetailsBack(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        
        var width = constraints.biggest.width;
        var radius = width/4;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.car_repair,
                  size: width/3,
                ),
                radius: radius,
              ),
              SizedBox(height: 20,),
              Center(
                child: Text('${carBack.car.carName.toUpperCase()} ${carBack.car.board.toUpperCase()}', style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text('${carBack.car.color.toUpperCase()}\n', textAlign: TextAlign.center,),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Total: ${carBack.car.partPrice + carBack.car.segPrice} ', 
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  subtitle: Padding(
                    child: Text(
                    'Part: ${carBack.car.partPrice} \nSeg: ${carBack.car.segPrice}',
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
                child: ListTile(
                  title: Text(
                    'Descrição Serviço', 
                    style: TextStyle(
                      fontSize: 19
                      ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Padding(
                    child: Text('${carBack.car.description}',
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
                child: ListTile(
                  title: Text(
                    carBack.car.finishDate == null ? 'Não Informado' : 'Entregue ${carBack.car.finishDate}'
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
                                content: Text('O veículo ${carBack.car.carName.toUpperCase()} \nPlaca: ${carBack.car.board.toUpperCase()} foi mesmo entregue?'),
                                actions: [
                                  FlatButton(
                                    child: Text('Não'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  FlatButton(
                                    child: Text('Sim'),
                                    onPressed: () => null,  
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
                    carBack.goToBack();
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