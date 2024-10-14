import 'package:igreja/src/model/finances_model.dart';
import 'package:igreja/src/repositories/finances/finances_repository_impl.dart';
import 'package:mobx/mobx.dart';

part 'finances_store.g.dart';

class FinancesStore = _FinancesStore with _$FinancesStore;

abstract class _FinancesStore with Store {
  final FinancesRepositoryImpl repository = FinancesRepositoryImpl();

  @observable
  List<FinancesModel> finances = ObservableList<FinancesModel>();

  @observable
  double entri = 0;
  @observable
  double exit = 0;
  @observable
  double saldo = 0;

  @action
  void inform() {
    double en = 0;
    double ex = 0;

    for (var f in finances) {
      if (f.type == 'Entrada') {
        en += f.value;
      } else {
        ex += f.value;
      }
    }
    entri = en;
    exit = ex;
    saldo = entri - exit;
  }

  void add(FinancesModel finances) {
    repository.add(finances);
    findByAll();
  }

  void update(FinancesModel finances) {
    repository.update(finances);
    findByAll();
  }

  Future<List<FinancesModel>> findByAll() async {
    finances.clear();
    finances = await repository.findByAll();
    inform();
    return finances;
  }

  void delete(FinancesModel finances) {
    repository.delete(finances);
    findByAll();
  }
}
