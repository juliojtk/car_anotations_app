import 'package:car_anotations_app/app/appRoutes/app_routes.dart';
import 'package:car_anotations_app/app/view/car_details.dart';
import 'package:car_anotations_app/app/view/car_form.dart';
import 'package:car_anotations_app/app/view/car_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME : (context) => CarList(),
        AppRoutes.CAR_FORM : (context) => CarForm(),
        AppRoutes.CAR_DETAILS : (context) => CarDetails(),
      },
    );
  }
}