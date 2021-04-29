// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_form_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarFormBack on CarFormBackBase, Store {
  final _$partAtom = Atom(name: 'CarFormBackBase.part');

  @override
  bool get part {
    _$partAtom.reportRead();
    return super.part;
  }

  @override
  set part(bool value) {
    _$partAtom.reportWrite(value, super.part, () {
      super.part = value;
    });
  }

  final _$segAtom = Atom(name: 'CarFormBackBase.seg');

  @override
  bool get seg {
    _$segAtom.reportRead();
    return super.seg;
  }

  @override
  set seg(bool value) {
    _$segAtom.reportWrite(value, super.seg, () {
      super.seg = value;
    });
  }

  final _$dateFormattedAtom = Atom(name: 'CarFormBackBase.dateFormatted');

  @override
  String get dateFormatted {
    _$dateFormattedAtom.reportRead();
    return super.dateFormatted;
  }

  @override
  set dateFormatted(String value) {
    _$dateFormattedAtom.reportWrite(value, super.dateFormatted, () {
      super.dateFormatted = value;
    });
  }

  final _$CarFormBackBaseActionController =
      ActionController(name: 'CarFormBackBase');

  @override
  dynamic changePart(bool newValue) {
    final _$actionInfo = _$CarFormBackBaseActionController.startAction(
        name: 'CarFormBackBase.changePart');
    try {
      return super.changePart(newValue);
    } finally {
      _$CarFormBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSeg(bool newValue) {
    final _$actionInfo = _$CarFormBackBaseActionController.startAction(
        name: 'CarFormBackBase.changeSeg');
    try {
      return super.changeSeg(newValue);
    } finally {
      _$CarFormBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic formatDate(BuildContext context, CarFormBack carBack) {
    final _$actionInfo = _$CarFormBackBaseActionController.startAction(
        name: 'CarFormBackBase.formatDate');
    try {
      return super.formatDate(context, carBack);
    } finally {
      _$CarFormBackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
part: ${part},
seg: ${seg},
dateFormatted: ${dateFormatted}
    ''';
  }
}
