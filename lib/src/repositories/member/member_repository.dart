import 'package:igreja/src/model/member_model.dart';

abstract class MemberRepository {
  void add(MemberModel member);
  void update(MemberModel member);
  Future<List<MemberModel>> findByAll();
  void delete(MemberModel member);
}
