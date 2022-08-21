import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Either<String, String>> sendOtp(String phoneNumber) async {
    var url = Uri.parse("https://62ff55339350a1e548dc3865.mockapi.io/send-otp");

    try {
      final res = await http.post(url, body: {"phone": phoneNumber});
      var decodedjson = jsonDecode(res.body);

      return Right(decodedjson["message"]);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> login(String phoneNumber, String otp) async {
    var url = Uri.parse("https://62ff55339350a1e548dc3865.mockapi.io/login");

    try {
      final res =
          await http.post(url, body: {"phone": phoneNumber, "otp": otp});
      var decodedjson = jsonDecode(res.body);

      return Right(decodedjson["message"]);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> register(
      String name, String email, String gender, String birthday) async {
    var url = Uri.parse("https://62ff55339350a1e548dc3865.mockapi.io/register");

    try {
      final res = await http.post(url, body: {
        "name": name,
        "email": email,
        "gender": gender,
        "birthday": birthday
      });
      var decodedjson = jsonDecode(res.body);

      print("success");
      return Right(decodedjson["message"]);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
