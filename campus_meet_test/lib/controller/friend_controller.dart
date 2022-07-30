import 'dart:convert';
import 'dart:io';
import 'package:campus_meet_test/models/Friend/friend_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<List<FriendList>> getMyFriend() async {

  final Response response = new Response('[{"id" : 1, "friend" : {"id" : 1,"email" : "dojin@mju.ac.kr","name" : "친구1","nickname" : "친구1"}}, {"id" : 2, "friend" : {"id" : 2,"email" : "dojin@mju.ac.kr","name" : "친구2","nickname" : "친구2"}},{"id" : 3, "friend" : {"id" : 3,"email" : "dojin@mju.ac.kr","name" : "친구3","nickname" : "친구3"}},{"id" : 4, "friend" : {"id" : 4,"email" : "dojin@mju.ac.kr","name" : "친구4","nickname" : "친구4"}}]', 200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });

  // final response = await http.get(Uri.parse("http://localhost:3000/api/v1/users/:#${myId}/friends"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    // return MeetingPostTest.fromJson(json.decode(response.body));

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<FriendList>.from(l.map((model) => FriendList.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}