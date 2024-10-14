class ClassName {
  final BigInt id;
  final String name;
  final String leader;
  final String date;

  // informaçoes de endereço
  final String cep;
  final String city;
  final String neighborhood;
  final String address;
  final String uf;

  ClassName(
      {required this.id,
      required this.name,
      required this.leader,
      required this.date,
      required this.cep,
      required this.city,
      required this.neighborhood,
      required this.address,
      required this.uf});
}
