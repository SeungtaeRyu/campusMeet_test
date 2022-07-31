import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../models/Location/location_model.dart';

Future<List<Location>> getAllLocations() async {

  final Response response = new Response('[{"id": 1,"state_name": "서울특별시","city_name": "전체"},{"id": 2,"state_name": "서울특별시","city_name": "종로구"}]', 200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });


  if (response.statusCode == 200) {

    Iterable l = json.decode(response.body);

    return List<Location>.from(l.map((model) => Location.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<Location> getOneLocation(int id) async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/locations/${id}"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    return Location.fromJson(json.decode(response.body));

  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}