
class University {
  University({
    required this.id,
    required this.name,
    required this.domainAddress,
    required this.address,

  });

  int id;
  String name;
  String domainAddress;
  String address;

  factory University.fromJson(Map<String, dynamic> json) => University(
    id: json["id"],
    name: json["name"],
    domainAddress: json["domainAddress"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "domainAddress": domainAddress,
    "address": address,
  };
}
