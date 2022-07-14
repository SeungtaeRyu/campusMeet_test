class ChangePW {
  ChangePW({
    required this.currentPw,
    required this.newPw,
  });

  String currentPw;
  String newPw;

  factory ChangePW.fromJson(Map<String, dynamic> json) => ChangePW(
    currentPw: json["currentPw"],
    newPw: json["newPw"],
  );

  Map<String, dynamic> toJson() => {
    "currentPw": currentPw,
    "newPw": newPw
  };
}
