import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/utils/text_edit_uppercase.dart';
import 'package:car_anotations_app/app/view/viewBack/car_form_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarForm extends StatelessWidget {

  final _carForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _back = CarFormBack(context);
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        title: Text( _back.isUpdate == false ? 'Cadastrar Veículo' : 'Alterar: ${_back.car.carName}'),
        actions: [],
      ),
      body: _body(context, _back)
    );
  }

  Widget _body(BuildContext context, CarFormBack _back){
    observerCheck(_back);
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
                  labelDate(_back),
                  iconDate(context, _back),
                ],
              ),
              SizedBox(height: 10),
              fieldDescription(_back),
              SizedBox(height: 15),
              buttonSaveCar(context, _back),
                ],
              );
            },
          ) , 
        ),
      ),
    );
  }

  observerCheck(CarFormBack carBack){
    if(carBack.car.partPrice != null && carBack.part == false){
      carBack.part = true;
    }
    if(carBack.car.segPrice != null && carBack.seg == false){
      carBack.seg = true;
    }
  }

  Widget fieldCarName(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: carBack.validateCarName,
        onSaved: (newValue) => carBack.car.carName = newValue,
        initialValue: carBack.car.carName,
        decoration: InputDecoration(
          labelText: 'Nome Veículo',
          labelStyle: TextStyle(fontSize: 17, color: Colors.black),
        ),
      ),
    );
  }

  Widget fieldCarBoard(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        inputFormatters: [
          TextEditUppercase(),
          LengthLimitingTextInputFormatter(7),
        ],
        validator: null,
        onSaved: (newValue) => carBack.car.board = newValue.toUpperCase(),
        initialValue: carBack.car.board,
        decoration: InputDecoration(
          labelText: 'Placa',
          labelStyle: TextStyle(fontSize: 17, color: Colors.black),
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
        labelStyle: TextStyle(fontSize: 17, color: Colors.black),
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
          title: Text('Particular', style: TextStyle(fontSize: 18, color: Colors.black),),
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
          title: Text('Seguro', style: TextStyle(fontSize: 18, color: Colors.black),),
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
        keyboardType: TextInputType.number,
        onSaved: (newValue) => carBack.validaPricePart(newValue),
        initialValue: carBack.car.partPrice == null ? '' : carBack.car.partPrice.toString(),
        decoration: InputDecoration(
          labelText: 'Valor Particular',
          labelStyle: TextStyle(fontSize: 17, color: Colors.black),
        ),
        style: TextStyle(fontSize: 19),
      )
    );
  }

  Widget fieldSegPrice(CarFormBack carBack){
    return Expanded(
      child: TextFormField(
        validator: null,
        keyboardType: TextInputType.number,
        onSaved: (newValue) => carBack.validaPriceSeg(newValue),
        initialValue: carBack.car.segPrice == null ? '' : carBack.car.segPrice.toString(),
        decoration: InputDecoration(
          labelText: 'Valor Seguro',
          labelStyle: TextStyle(fontSize: 17, color: Colors.black),
        ),
        style: TextStyle(fontSize: 19),
      ),
    );
  }

  Widget labelDate(CarFormBack carBack){
    return Expanded(
      child: Observer(builder: (context) {
        return Text( (carBack.dateFormatted == null && carBack.car.finishDate == null) ? 'Data prevista da entrega' : 'Previsão de entrega: ${carBack.dateLabel}',
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
        labelText: 'Descrição do Serviço',
        labelStyle: TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }

  Widget buttonSaveCar(BuildContext context, CarFormBack carBack){
    return Container(
      width: 150,
      child: FlatButton( 
        child: Text(
          carBack.isUpdate == false ? 'Salvar' : 'Alterar', 
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        color: carBack.isUpdate == false ? Colors.green : Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: (){
          _carForm.currentState.validate();
          _carForm.currentState.save();
          if (carBack.isValid) {
          carBack.saveCar();
          Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          }
        },
      ),
    );
  }
  

}