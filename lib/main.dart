import 'package:car_anotations_app/app/injection.dart';
import 'package:car_anotations_app/app/my_app.dart';
import 'package:flutter/material.dart';

void main() { 
  setupInjection(); //Injetando na inicialização do projeto
  runApp(MyApp());
}
