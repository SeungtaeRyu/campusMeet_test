class ChangePW {
  ChangePW({
    required this.currentPw,
    required this.newPw,
  });

  String currentPw;
  String newPw;

  Map<String, dynamic> toJson() => {
    "currentPw": currentPw,
    "newPw": newPw
  };
}
