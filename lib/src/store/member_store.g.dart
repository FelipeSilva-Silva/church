// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemberStore on _MemberStore, Store {
  late final _$memberAtom = Atom(name: '_MemberStore.member', context: context);

  @override
  List<MemberModel> get member {
    _$memberAtom.reportRead();
    return super.member;
  }

  @override
  set member(List<MemberModel> value) {
    _$memberAtom.reportWrite(value, super.member, () {
      super.member = value;
    });
  }

  late final _$findByMemberAsyncAction =
      AsyncAction('_MemberStore.findByMember', context: context);

  @override
  Future<List<MemberModel>> findByMember() {
    return _$findByMemberAsyncAction.run(() => super.findByMember());
  }

  @override
  String toString() {
    return '''
member: ${member}
    ''';
  }
}
