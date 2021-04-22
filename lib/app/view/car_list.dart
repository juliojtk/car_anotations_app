import 'package:car_anotations_app/app/view/viewBack/car_list_back.dart';
import 'package:flutter/material.dart';

class CarList extends StatelessWidget {

  final _backListCar = CarListBack();
  
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
    );
  }
}