import 'dart:convert';

import 'package:etam_wallet/models/signin_form_model.dart';
import 'package:etam_wallet/models/signup_form_model.dart';
import 'package:etam_wallet/models/user_model.dart';
import 'package:etam_wallet/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {
          'email': email
        }
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user.copyWith(password: data.password);

        return user;

      } else {
        throw jsonDecode(res.body)['messages']; // gunakan throw bukan return karena ingin errornya ditangkap oleh catch di auth bloc
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user.copyWith(password: data.password);

        return user;

      } else {
        throw jsonDecode(res.body)['messages']; // gunakan throw bukan return karena ingin errornya ditangkap oleh catch di auth bloc
      }

    } catch (e) {
      rethrow;
    }
  }
}