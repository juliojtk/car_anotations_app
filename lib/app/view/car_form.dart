import 'package:car_anotations_app/app/view/viewBack/car_form_back.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Row(
              children: [
                fieldCarName(_back),
                SizedBox(width: 10),
                fieldCarBoard(_back),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
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
          labelText: 'Modelo Veículo'
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

  
}