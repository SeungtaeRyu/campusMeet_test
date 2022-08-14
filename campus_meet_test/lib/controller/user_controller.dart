
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:campus_meet_test/models/User/find_user_by_id_model.dart';
import 'package:http/http.dart';

Future<FindUserById> getUserById() async {

  final Response response = new Response('{"id" : 1,"email" : "dojin@mju.ac.kr","name" : "유도진","nickname" : "아무닉네임","entryYear" : 21,"birthDate" : "1994-01-28","sex" : "M","createdAt" : "2022-06-26 10:23:12","updatedAt" : "2022-06-26 10:23:12","univ" : {"id": 1,"name":"명지대학교"},"department" : {"id": 1,"name": "융합소프트웨어학부"},"introText" : "어쩌고저쩌고","character" : "다정다감,참을성만땅,소심소심","hobby" : "독서,음악 감상, 카페 투어","ideal" : "키 큰 사람,웃는 게 이쁜 사람","profileImages" : [{"order" : 1,"url" : "이미지 주소 url"}]}', 200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
  // 추후에 users 대신 searchText 사용하기!!
  // final response = await http.get(Uri.parse("http://localhost:3000/api/v1/universities"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    return FindUserById.fromJson(json.decode(response.body));

    // 복수 객체 일때
    // Iterable l = json.decode(response.body);
    // return List<University>.from(l.map((model) => University.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}