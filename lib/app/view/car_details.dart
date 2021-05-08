import 'package:car_anotations_app/app/view/viewBack/car_details_back.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var carBack = CarDetailsBack(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        
        var width = constraints.biggest.width;
        var radius = width/3;

        return Scaffold(
          backgroundColor: Colors.purple,
        );
      }
    );
  }
}