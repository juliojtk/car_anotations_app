import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
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
          drawer: Drawer(
            elevation: 50,
            child: ListView(
              children:[
                SingleChildScrollView(
                  child: Container(
                    color: Colors.blue[500],
                    child: DrawerHeader(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/procurando-o-carro-que-vende-%C3%ADcone-109371324.jpg'),
                            maxRadius: 55,
                            ),
                            SizedBox(height: 8,),
                          Text(' + Opções de buscas', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ],
                      ),     
                    ),
                  ),
                ),
                ListTile(
                leading: Icon(Icons.find_in_page_outlined),
                title: Text('Veículos em aberto', style: TextStyle(fontSize: 17),),
                onTap: (){
                  _backListCar.serviceNotFinish();
                  Navigator.of(context).pop();
                },
                ),
                ListTile(
                  leading: Icon(Icons.find_in_page_rounded),
                  title: Text('Por periodo de data', style: TextStyle(fontSize: 17),
                  ),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Selecione as Datas'),
                        actions: [
                          Padding(
                            padding: EdgeInsets.all(10), 
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    labelDateStart(_backListCar),
                                    iconDateStart(context, _backListCar),
                                  ],
                                ),
                                Row(
                                  children: [
                                    labelDateEnd(_backListCar),
                                    iconDateEnd(context, _backListCar),
                                  ],
                                ),
                                Row(
                                  children: [
                                    iconSearchDate(context, _backListCar),
                                  ],
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    );
                  },
                ),
              ] 
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _backListCar.refresIndicator,
              child: Container(
                color: Colors.blueGrey[50],
                child: futureBuilde(context),     
            ),
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
          child: _backListCar.swap == 0 ? textFieldSearch(context) : null,
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
        labelText: 'Buscar Veículo por nome ou placa',
        hintText: 'Buscar Veículo',
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

  Widget labelDateStart(CarListBack carBack){
    return Observer(builder: (context) {
        return Text( (carBack.dateFormattedStart == null) ? 'Selecione a Data Início' : carBack.dateLabelStart,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
            )
          );
        },
      );
  }

  Widget iconDateStart(BuildContext context, CarListBack carBack){
    return IconButton(
      icon: Icon(Icons.date_range),
      onPressed: (){
        carBack.isDateStart = true;
        carBack.formatDate(context, carBack);
      },
    );
  }

  Widget labelDateEnd(CarListBack carBack){
    return Observer(builder: (context) {
      return Text( (carBack.dateFormattedEnd == null) ? 'Selecione a Data Final' : carBack.dateLabelEnd,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
          )
        );
      },
    );
  }

  Widget iconDateEnd(BuildContext context, CarListBack carBack){
    return IconButton(
      icon: Icon(Icons.date_range),
      onPressed: (){
        carBack.isDateStart = false;
        carBack.formatDate(context, carBack);
      },
    );
  }

  Widget iconSearchDate(BuildContext context, CarListBack carBack){
    return FlatButton(
      child: Icon(Icons.search),
      onPressed: () {
        carBack.searchBetweenDates(carBack.dateFormattedStart, carBack.dateFormattedEnd);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
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