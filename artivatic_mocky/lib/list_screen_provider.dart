import 'package:artivatic_mocky/api_provider.dart';
import 'package:artivatic_mocky/mocky_model.dart';
import 'package:artivatic_mocky/response_api.dart';
import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier{
  Mocky? listData;

  getListData() async {
    ResponseAPI responseAPI = await ApiProvider().callListData();

    if (responseAPI.status == Status.success) {
      listData = responseAPI.data as Mocky;
      notifyListeners();
    }
  }
}