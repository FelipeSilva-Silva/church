class UserModel {
  final BigInt? id;
  final String name;
  final DateTime initMandateDate;
  final DateTime? finalMandatelDate;
  final String userName;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.initMandateDate,
    this.finalMandatelDate,
    required this.userName,
    required this.password,
  });

  // converter um map em uma instacia de userModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: BigInt.from(map['id']),
        name: map['name'],
        initMandateDate: DateTime.parse(map['initMandateDate']),
        finalMandatelDate: DateTime.parse(map['finalMandatelDate']),
        userName: map['userName'],
        password: map['password']);
  }

  // converter em um mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'name': name,
      'initMandateDate': initMandateDate.toString(),
      'finalMandatelDate': finalMandatelDate.toString(),
      'userName': userName,
      'password': password
    };
  }

  static List<UserModel> toListUsermodel(List<Map<String, dynamic>> listMap) {
    List<UserModel> users = [];
    for (Map<String, dynamic> item in listMap) {
      users.add(UserModel.fromMap(item));
    }
    return users;
  }
}
