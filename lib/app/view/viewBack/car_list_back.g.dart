// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarListBack on CarListBackBase, Store {
  final _$dateFormattedStartAtom =
      Atom(name: 'CarListBackBase.dateFormattedStart');

  @override
  String get dateFormattedStart {
    _$dateFormattedStartAtom.reportRead();
    return super.dateFormattedStart;
  }

  @override
  set dateFormattedStart(String value) {
    _$dateFormattedStartAtom.reportWrite(value, super.dateFormattedStart, () {
      super.dateFormattedStart = value;
    });
  }

  final _$dateFormattedEndAtom = Atom(name: 'CarListBackBase.dateFormattedEnd');

  @override
  String get dateFormattedEnd {
    _$dateFormattedEndAtom.reportRead();
    return super.dateFormattedEnd;
  }

  @override
  set dateFormattedEnd(String value) {
    _$dateFormattedEndAtom.reportWrite(value, super.dateFormattedEnd, () {
      super.dateFormattedEnd = value;
    });
  }

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

  final _$listAtom = Atom(name: 'CarListBackBase.list');

  @override
  List<Car> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Car> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
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
  dynamic searchCar(String value) {
    final _$actionInfo = _$CarListBackBaseActionController.startAction(
        name: 'CarListBackBase.searchCar');
    try {
      return super.searchCar(value);
    } finally {
      _$CarListBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic serviceNotFinish() {
    final _$actionInfo = _$CarListBackBaseActionController.startAction(
        name: 'CarListBackBase.serviceNotFinish');
    try {
      return super.serviceNotFinish();
    } finally {
      _$CarListBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateFormattedStart: ${dateFormattedStart},
dateFormattedEnd: ${dateFormattedEnd},
listCar: ${listCar},
list: ${list}
    ''';
  }
}
