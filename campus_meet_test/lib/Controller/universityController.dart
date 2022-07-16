import 'dart:convert';
import 'package:campus_meet_test/models/University/univ_model.dart';
import 'package:http/http.dart' as http;


Future<List<University>> getAllUniv() async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/universities"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    // return MeetingPostTest.fromJson(json.decode(response.body));

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<University>.from(l.map((model) => University.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<University> getOneUniv(int id) async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/universities/${id}"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    return University.fromJson(json.decode(response.body));

    // 복수 객체 일때
    // Iterable l = json.decode(response.body);
    // return List<University>.from(l.map((model) => University.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}