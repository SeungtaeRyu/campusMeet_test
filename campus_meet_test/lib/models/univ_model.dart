class Univ{
  int id;
  String name;
  String domainAddress;
  String address;

  Univ({
    required this.id,
    required this.name,
    required this.domainAddress,
    required this.address,
  });

  // factory Univ.fromJson(Map<String, dynamic> parsedJson){
  //   return Univ(
  //       id: parsedJson['id'],
  //       name : parsedJson['name'],
  //       domainAddress : parsedJson ['domainAddress'],
  //       address : parsedJson ['address']
  //   );
  // }
  factory Univ.fromJson(Map<String, dynamic> json) => Univ(
    id: json["id"],
    name: json["name"],
    domainAddress: json["domainAddress"],
    address: json["address"],
  );
}