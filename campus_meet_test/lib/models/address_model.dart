class Address {
  final int id;
  final String firstAddress;
  final String secondAddress;

  Address.fromMap(
      Map<String, dynamic> map,
      )   : id = map['id'],
        firstAddress = map['firstAddress'],
        secondAddress = map['secondAddress'];

  @override
  String toString() => "Address<$firstAddress:$secondAddress>";
}
