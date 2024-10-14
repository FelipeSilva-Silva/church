import 'package:igreja/src/model/member_model.dart';
import 'package:igreja/src/repositories/member/member_repository_impl.dart';
import 'package:mobx/mobx.dart';

part 'member_store.g.dart';

class MemberStore = _MemberStore with _$MemberStore;

abstract class _MemberStore with Store {
  final repository = MemberRepositoryImpl();

  @observable
  List<MemberModel> member = ObservableList<MemberModel>();

  void add(MemberModel member) {
    repository.add(member);
    findByMember();
  }

  void update(MemberModel member) {
    repository.update(member);
  }

  @action
  Future<List<MemberModel>> findByMember() async {
    member.clear();
    member = await repository.findByAll();
    return member;
  }

  void delete(MemberModel member) {
    repository.delete(member);
    findByMember();
  }
}
