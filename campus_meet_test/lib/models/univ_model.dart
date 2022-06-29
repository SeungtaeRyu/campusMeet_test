class Univ{
  String univId;
  String univName;
  String univURL;

  Univ({
    required this.univId,
    required this.univName,
    required this.univURL
  });

  factory Univ.fromJson(Map<String, dynamic> parsedJson){
    return Univ(
        univId: parsedJson['id'],
        univName : parsedJson['schoolName'],
        univURL : parsedJson ['link']
    );
  }
}