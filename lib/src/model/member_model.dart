class MemberModel {
  // Informaçoes pessoais
  final int? id;
  //final String image;
  final String name;
  final String surname;
  final String cpf;
  final String phone;
  final String dateOfBirthDay;
  final int age;
  //final String ageRange;
  final String maritalStatus;

  // informaçoes de endereço
  final String cep;
  final String city;
  final String neighborhood;
  final String address;
  final String uf;

  // Informaçoes refente a igreja
  final String congregation;
  final String status;
  final bool baptized;
  final String dateOfBaptized;
  final String obs;

  MemberModel(
      {this.id,
      //required this.image,
      required this.name,
      required this.surname,
      required this.cpf,
      required this.phone,
      required this.dateOfBirthDay,
      required this.age,
      //required this.ageRange,
      required this.maritalStatus,
      required this.cep,
      required this.city,
      required this.neighborhood,
      required this.address,
      required this.uf,
      required this.congregation,
      required this.status,
      required this.baptized,
      required this.dateOfBaptized,
      required this.obs});

  // Método para converter de Map para MemberModel
  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: map['id'],
      //image: map['image'],
      name: map['name'],
      surname: map['surName'],
      cpf: map['cpf'],
      phone: map['phone'],
      dateOfBirthDay: map['dateOfBirthDay'],
      age: map['age'],
      //ageRange: map['ageRange'],
      maritalStatus: map['maritalStatus'],
      cep: map['cep'],
      city: map['city'],
      neighborhood: map['neighborhood'],
      address: map['address'],
      uf: map['uf'],
      congregation: map['congregation'],
      status: map['status'],
      baptized: map['baptized'] == 1, // Considerando que 1 é true e 0 é false
      dateOfBaptized: map['dateOfBaptized'],
      obs: map['obs'],
    );
  }

  // Método para converter de MemberModel para Map
  Map<String, dynamic> toMap() {
    return {
      //'image': image,
      'name': name,
      'surname': surname,
      'cpf': cpf,
      'phone': phone,
      'dateOfBirthDay': dateOfBirthDay,
      'age': age,
      //'ageRange': ageRange,
      'maritalStatus': maritalStatus,
      'cep': cep,
      'city': city,
      'neighborhood': neighborhood,
      'address': address,
      'uf': uf,
      'congregation': congregation,
      'status': status,
      'baptized': baptized ? 1 : 0, // Convertendo bool para 1 ou 0
      'dateOfBaptized': dateOfBaptized,
      'obs': obs,
    };
  }

  // Método para converter de List<Map> para List<MemberModel>
  static List<MemberModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MemberModel.fromMap(map)).toList();
  }
}
