// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finances_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FinancesStore on _FinancesStore, Store {
  late final _$financesAtom =
      Atom(name: '_FinancesStore.finances', context: context);

  @override
  List<FinancesModel> get finances {
    _$financesAtom.reportRead();
    return super.finances;
  }

  @override
  set finances(List<FinancesModel> value) {
    _$financesAtom.reportWrite(value, super.finances, () {
      super.finances = value;
    });
  }

  late final _$entriAtom = Atom(name: '_FinancesStore.entri', context: context);

  @override
  double get entri {
    _$entriAtom.reportRead();
    return super.entri;
  }

  @override
  set entri(double value) {
    _$entriAtom.reportWrite(value, super.entri, () {
      super.entri = value;
    });
  }

  late final _$exitAtom = Atom(name: '_FinancesStore.exit', context: context);

  @override
  double get exit {
    _$exitAtom.reportRead();
    return super.exit;
  }

  @override
  set exit(double value) {
    _$exitAtom.reportWrite(value, super.exit, () {
      super.exit = value;
    });
  }

  late final _$saldoAtom = Atom(name: '_FinancesStore.saldo', context: context);

  @override
  double get saldo {
    _$saldoAtom.reportRead();
    return super.saldo;
  }

  @override
  set saldo(double value) {
    _$saldoAtom.reportWrite(value, super.saldo, () {
      super.saldo = value;
    });
  }

  late final _$_FinancesStoreActionController =
      ActionController(name: '_FinancesStore', context: context);

  @override
  void inform() {
    final _$actionInfo = _$_FinancesStoreActionController.startAction(
        name: '_FinancesStore.inform');
    try {
      return super.inform();
    } finally {
      _$_FinancesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
finances: ${finances},
entri: ${entri},
exit: ${exit},
saldo: ${saldo}
    ''';
  }
}
