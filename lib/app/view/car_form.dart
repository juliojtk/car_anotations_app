import 'package:car_anotations_app/app/view/viewBack/car_form_back.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarForm extends StatelessWidget {

  final _carForm = GlobalKey<FormState>();
  bool part = false;
  bool seg = false;
  String dateFormatted;

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
                SizedBox(width: 15),
                fieldCarBoard(_back),
                ],
              ),
              SizedBox(height: 10),
              fieldCarColor(_back),
              labelTypeService(context),
              Row(
                children: [
                  checkPart(context),
                  checkSeg(context),
                ],
              ),
              Row(
                children: [
                  fieldPartPrice(_back),
                  SizedBox(width: 15),
                  fieldSegPrice(_back),
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

  Widget checkPart(BuildContext context){
    return Expanded(
      child: CheckboxListTile(
        title: Text('Particular'),
        value: part,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue){
          part = newValue;
        }
      ),
    );
  }

  Widget checkSeg(BuildContext context){
    return Expanded(
      child: CheckboxListTile(
        title: Text('Seguro'),
        value: seg,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue){
          seg = newValue;
        },
      ),
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
      child: Text( dateFormatted == null ? 'Selecione a data da entrega' : 'Entrege: ' + dateFormatted,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        )
      )
    );
  }

  Widget iconDate(BuildContext context, CarFormBack carBack){
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.date_range),
        onPressed: (){
          _formatDate(context, carBack);
        },
      )
    );
  }

  _formatDate(BuildContext context, CarFormBack carBack){
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime(2050)).then((value){
        if(value == null){
          return;
        }else{
          DateFormat dateFormat = DateFormat('dd/MM/yyyy');
          dateFormatted = dateFormat.format(value);
          carBack.car.finishDate = dateFormatted;
        }
      }
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