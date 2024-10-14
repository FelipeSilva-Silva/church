import 'package:igreja/src/model/finances_model.dart';

abstract class RepositoryFinances {
  void add(FinancesModel finances);
  void update(FinancesModel finances);
  Future<List<FinancesModel>> findByAll();
  void delete(FinancesModel finances);
}
