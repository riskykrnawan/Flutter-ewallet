import 'dart:convert';

import 'package:etam_wallet/models/pin_model.dart';
import 'package:etam_wallet/services/auth_service.dart';
import 'package:etam_wallet/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class WalletService {
  Future<void> updatePin(PinModel data) async {
    // karena tidak banyak parameternya, boleh tidak menggunakan model
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: { // kirimkan token lewat headers
          'Authorization': token,
        }  
      );

      if (res.statusCode != 200) {
         {
          throw jsonDecode(res.body)['message'];
         }
      }
    } catch (e) {
      rethrow;
    }
  }
}