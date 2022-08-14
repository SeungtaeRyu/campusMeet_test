import 'dart:convert';
import 'dart:io';
import 'package:campus_meet_test/models/Location/Location_model.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meeting_member_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<List<Post>> getAllPost() async {

  // 30은 나중에 변수로 받는다 ???
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/posts?page=0&size=30"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<Post>.from(l.map((model) => Post.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<Post> getOnePost(int id) async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/Posts/${id}"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    return Post.fromJson(json.decode(response.body));

  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<List<Post>> getAllPostByKeyword(String searchText) async {

  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/posts/search?keyword=${searchText}"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<Post>.from(l.map((model) => Post.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<List<Post>> getAllPostWithFilter(int numOfMember, List<Location> locations, int minEntryYear, int maxEntryYear,
    int minAge, int maxAge, List<String> keywords, MeetingMember) async {

  // /api/v1/posts/filter?num=3&locations[]=1&locations[]=2&minEntry=0&maxEntry=99&minAge=19&maxAge=99&keywords[]=3&keywords[]=15
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/posts/filter?num=$numOfMember&locations[]=1&locations[]=2&minEntry=0&maxEntry=99&minAge=19&maxAge=99&keywords[]=3&keywords[]=15"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<Post>.from(l.map((model) => Post.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}


Future<List<MeetingMember>> getMeetingMember(int id) async {

  final Response response = new Response('[{"id": 1, "univ":"명지대학교", "entryYear": 20, "name": "홍길동", "profileImages":["12345"]}, '
      '{"id": 2, "univ":"명지대학교", "entryYear": 20, "name": "홍길동", "profileImages":["12345"]}, {"id": 3, "univ":"명지대학교", "entryYear": 20, "name": "홍길동", "profileImages":["12345"]},'
      '{"id": 4, "univ":"명지대학교", "entryYear": 20, "name": "홍길동", "profileImages":["12345"]}]', 200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });

  // 추후에 users 대신 searchText 사용하기!!
  // final response = await http.get(Uri.parse("http://localhost:3000/api/v1/posts/:$id/members"));


  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 복수 객체 일때
    Iterable l = json.decode(response.body);

    return List<MeetingMember>.from(l.map((model) => MeetingMember.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

