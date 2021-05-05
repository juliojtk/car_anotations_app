// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarListBack on CarListBackBase, Store {
  final _$listCarAtom = Atom(name: 'CarListBackBase.listCar');

  @override
  Future<List<Car>> get listCar {
    _$listCarAtom.reportRead();
    return super.listCar;
  }

  @override
  set listCar(Future<List<Car>> value) {
    _$listCarAtom.reportWrite(value, super.listCar, () {
      super.listCar = value;
    });
  }

  final _$CarListBackBaseActionController =
      ActionController(name: 'CarListBackBase');

  @override
  dynamic refresListCar([dynamic value]) {
    final _$actionInfo = _$CarListBackBaseActionController.startAction(
        name: 'CarListBackBase.refresListCar');
    try {
      return super.refresListCar(value);
    } finally {
      _$CarListBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCar: ${listCar}
    ''';
  }
}
