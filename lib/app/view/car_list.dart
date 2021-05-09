import 'package:car_anotations_app/app/domain/entities/car.dart';
import 'package:car_anotations_app/app/view/viewBack/car_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarList extends StatelessWidget {

  final _backListCar = CarListBack();

  TextEditingController editingController = TextEditingController();

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
            color: Colors.grey,
            child: futureBuilde(context),     
          ),
        );
      }
    );
  }

  Widget futureBuilde(BuildContext context){
    return FutureBuilder(
      future: _backListCar.changeFutureBuilder(context, _backListCar.listCar, _backListCar.listCarName),
      builder: (context, futuro){
        if (!futuro.hasData) {
          return CircularProgressIndicator();
        }else{
          _backListCar.mainList = futuro.data;  
          return mainColumn(context, _backListCar.mainList);
        }
      },
    );
  }

  Widget mainColumn(BuildContext context, List<Car> listCar){
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
              itemCount: listCar.length,
              itemBuilder: (context, i){
                var car = listCar[i];
                var soma = _backListCar.somaPrices(car.partPrice, car.segPrice);
                return Card(
                  child: ListTile(
                    leading: circleAvatar(),
                    title: Text(car.carName),
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
    //enabled: true,
    controller: editingController,
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
    /*onTap: (){
      _backListCar.searchCar(editingController.text.toString());
    },*/
  );
}

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

}