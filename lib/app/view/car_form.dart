import 'package:car_anotations_app/app/view/viewBack/car_form_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarForm extends StatelessWidget {

  final _carForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
        actions: [],
      ),
      body: _body(context)
    );
  }

  Widget _body(BuildContext context){
    var _back = CarFormBack(context);

    return SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _carForm,
        child: Observer(builder: (context){
          return Column(
            children: [
              Row(
                children: [
                  fieldCarName(_back),
                  SizedBox(width: 15),
                  fieldCarBoard(_back),
                  ],
                ),
              SizedBox(height: 10),
              fieldCarColor(_back),
              labelTypeService(context),
              Row(
                children: [
                  checkPart(context, _back),
                  checkSeg(context, _back),
                ],
              ),
              Row(
                children: [
                  _back.part == true ? fieldPartPrice(_back) : Row(),
                  SizedBox(width: 15),
                  _back.seg == true ? fieldSegPrice(_back) : Row(),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
              Row(
                children: [
                  labelDescription(_back),
                  iconDate(context, _back),
                ],
              ),
              SizedBox(height: 10),
              fieldDescription(_back),
              SizedBox(height: 15),
              buttonSaveCar(_back),
                ],
              );
            },
          ) , 
        ),
      ),
    );
  }

  Widget fieldCarName(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: null,
        onSaved: (newValue) => carBack.car.carName = newValue,
        initialValue: carBack.car.carName,
        decoration: InputDecoration(
          labelText: 'Nome Veículo'
        ),
      ),
    );
  }

  Widget fieldCarBoard(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: null,
        onSaved: (newValue) => carBack.car.board = newValue,
        initialValue: carBack.car.board,
        decoration: InputDecoration(
          labelText: 'Placa',
        ),
      ),
    );
  }

  Widget fieldCarColor(CarFormBack carBack){
    return TextFormField(
      validator: null,
      onSaved: (newValue) => carBack.car.color = newValue,
      initialValue: carBack.car.color,
      decoration: InputDecoration(
        labelText: 'Cor',
      ),
    );
  }

  Widget labelTypeService(BuildContext context){
    return Text(
      'Tipo de Serviço', 
      style: TextStyle(
        fontSize: 17, 
        color: Colors.black,
        height: 3,
        ),
    );
  }

  Widget checkPart(BuildContext context, CarFormBack carBack){
    return Expanded(
      child: Observer(builder: (context) {
        return CheckboxListTile(
          title: Text('Particular'),
          value: carBack.part,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (newValue) => carBack.changePart(newValue),
          );
        },
      ),
    );
  }

  Widget checkSeg(BuildContext context, CarFormBack carBack){
    return Expanded(
      child: Observer(builder: (context) { 
        return CheckboxListTile(
          title: Text('Seguro'),
          value: carBack.seg,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (newValue) => carBack.changeSeg(newValue),
          );
        },
      )
    ); 
  }

  Widget fieldPartPrice(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: null,
        onSaved: (newValue) => carBack.car.partPrice = newValue,
        initialValue: carBack.car.partPrice,
        decoration: InputDecoration(
          labelText: 'Valor Particular'
        ),
      )
    );
  }

  Widget fieldSegPrice(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: null,
        onSaved: (newValue) => carBack.car.segPrice = newValue,
        initialValue: carBack.car.segPrice,
        decoration: InputDecoration(
          labelText: 'Valor Seguro'
        ),
      ),
    );
  }

  Widget labelDescription(CarFormBack carBack){
    return Expanded(
      child: Observer(builder: (context) {
        return Text( carBack.dateFormatted == null ? 'Selecione a data da entrega' : 'Entrege: ' + carBack.dateFormatted,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
            )
          );
        },
      ) 
    );
  }

  Widget iconDate(BuildContext context, CarFormBack carBack){
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.date_range),
        onPressed: (){
          carBack.formatDate(context, carBack);
        },
      ),
    ); 
  }

  Widget fieldDescription(CarFormBack carBack){
    return TextFormField(
      onSaved: (newValue) => carBack.car.description = newValue,
      initialValue: carBack.car.description,
      decoration: InputDecoration(
        labelText: 'Descrição do Serviço'
      ),
    );
  }

  Widget buttonSaveCar(CarFormBack carBack){
    return Container(
      width: 150,
      child: FlatButton( 
        child: Text(
          'Salvar', 
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        color: Colors.green,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: (){

        },
      ),
    );
  }

}