import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/view/viewBack/car_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarList extends StatelessWidget {

  final _backListCar = CarListBack();

  //Criando Icon do carro
  CircleAvatar circleAvatar()  {
    return CircleAvatar(child: Icon(Icons.car_repair));
  }

  //Criando Botão Editar
  Widget iconEditButton(Function onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  //Criando botao Excluir
   Widget iconRemoveButton(BuildContext context, Function remove){
    return IconButton(
      icon: Icon(Icons.delete), 
      color: Colors.red, 
      onPressed: () {
        showDialog(
          context: context, 
          builder:  (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a Exclusão?'),
            actions: [
              FlatButton(
                child: Text('Não'), 
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: remove,
              ),
            ],
          )
        );
      }
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Veiículos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              _backListCar.goToCarForm(context);
            },
          ),
        ],
      ),
      body: Observer(builder: (context){
        return FutureBuilder(
          future: _backListCar.listCar,
          builder: (context, futuro){
            if(!futuro.hasData){
              return CircularProgressIndicator();
              }else{
                List<Car> list = futuro.data;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i){
                    var car = list[i];
                    var soma = car.partPrice + car.segPrice;
                    return Card(
                      child: ListTile(
                        leading: circleAvatar(),
                        title: Text(car.carName),
                        subtitle: Text('R\$: ' + soma.toString()),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _backListCar.goToCarForm(context, car);
                              }),
                              iconRemoveButton(context, (){
                                _backListCar.removeCar(car.id);
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            }
          );
        }
      ),
    );
  }
}