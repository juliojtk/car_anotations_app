import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/view/viewBack/car_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarList extends StatelessWidget {

  final _backListCar = CarListBack();

    @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
          body: Container(
            color: Colors.blueGrey[50],
            child: futureBuilde(context),     
          ),
        );
      }
    );
  }

  Widget futureBuilde(BuildContext context){
    return FutureBuilder(
      future: _backListCar.listCar,
      builder: (context, futuro){
        if (!futuro.hasData) {
          return CircularProgressIndicator();
        }else{
          _backListCar.list = futuro.data;  
          return mainColumn(context, _backListCar.list);
        }
      },
    );
  }

  Widget mainColumn(BuildContext context, List<Car> list){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: textFieldSearch(context),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i){
                var car = list[i];
                var soma = _backListCar.somaPrices(car.partPrice, car.segPrice);
                return Card(
                  elevation: 15,
                  child: ListTile(
                    leading: circleAvatar(car.isSeviceOk),
                    title: Text('${car.carName.toUpperCase()} \n${car.board.toUpperCase()}', style: TextStyle(fontSize: 16),),
                    subtitle: Text('R\$: ' + soma.toString()),
                    onTap: (){
                      _backListCar.goToCarDetails(context, car);
                    },
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
                  color: car.isSeviceOk == 'S' ? Colors.green[100] : Colors.blueGrey[50],
                );
              }
            ),
          )
        )
      ],
    );
  }

  Widget textFieldSearch(BuildContext context){
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Buscar Veiculo',
      hintText: 'Buscar Veiculo',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25),
        )
      )
    ),
    onChanged: (value){
      _backListCar.searchCar(value);
    },
  );
}

  //Criando Icon do carro
  CircleAvatar circleAvatar(String serviceOk)  {
    return CircleAvatar(
      child: serviceOk == 'S' ? Icon(Icons.car_rental, color: Colors.black,) : Icon(Icons.car_repair, color: Colors.black,), 
      backgroundColor: serviceOk != 'N' ? Colors.green[400] : Colors.blue[400],
      );
  }

  //Criando Botão Editar
  Widget iconEditButton(Function onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.deepPurple[800], onPressed: onPressed);
  }

  //Criando botao Excluir
   Widget iconRemoveButton(BuildContext context, Function remove){
    return IconButton(
      icon: Icon(Icons.delete), 
      color: Colors.red[800], 
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

}