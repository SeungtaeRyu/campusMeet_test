import 'dart:convert';
import 'dart:io';
import 'package:campus_meet_test/models/Tag/tag_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<List<Tag>> getAllTag() async {

  // 추후에 users 대신 searchText 사용하기!!
  // final response = await http.get(Uri.parse("http://localhost:3000/api/v1/tags"));

  final Response response = new Response('[{"id": 0, "text": "인간 댕댕이"},{"id": 1, "text": "회색 아기 고양이"},{"id": 2, "text": "매력쟁이"},{"id": 3, "text": "건강미 뿜뿜"},{"id": 4, "text": "보기보다 동안"},{"id": 5, "text": "나름 귀여울지도"},{"id": 6, "text": "사람 냄새나는 스타일"},{"id": 7, "text": "카리스마 있는 편"},{"id": 8, "text": "센스 폭발"},{"id": 9, "text":  "배꼽 도둑"},{"id": 10, "text":  "틈새 드립러"},{"id": 11, "text":  "분위기 메이커"},{"id": 12, "text":  "부끄럼쟁이"},{"id": 13, "text":  "리액션 부자"},{"id": 14, "text":  "따뜻 다정"},{"id": 15, "text":  "표현 서툰 츤데레"},{"id": 16, "text":   "어색한건 못 참아"},{"id": 17, "text":   "밥보단 술"},{"id": 18, "text":  "술보단 밥"},{"id": 19, "text":  "편하게 놀아요"},{"id": 20, "text":   "술은 적당히"},{"id": 21, "text":   "몸만 오세요"},{"id": 22, "text":  "멈추지마 가보자고"},{"id": 23, "text":  "분위기 캐리 부탁드립니다"},{"id": 24, "text":  "시간 순삭 책임질게요"},{"id": 25, "text":   "뚝딱이들"}]', 200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    // return MeetingPostTest.fromJson(json.decode(response.body));

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<Tag>.from(l.map((model) => Tag.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<Tag> getOneTag(int id) async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("http://localhost:3000/api/v1/tags/$id"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    return Tag.fromJson(json.decode(response.body));

  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}