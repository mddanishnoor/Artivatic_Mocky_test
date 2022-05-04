import 'dart:convert';
import 'package:artivatic_mocky/models/mocky_model.dart';
import 'package:artivatic_mocky/utils/network/response_api.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Uri url =
      Uri.parse("https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf");

  Future<ResponseAPI> callListData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      Mocky data = Mocky.fromJson(decodedJson);
      return ResponseAPI(status: Status.success, data: data);
    } else {
      return ResponseAPI(status: Status.failed, data: null);
    }
  }
}
