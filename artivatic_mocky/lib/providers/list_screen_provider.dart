import 'package:artivatic_mocky/models/mocky_model.dart';
import 'package:artivatic_mocky/utils/network/api_provider.dart';
import 'package:artivatic_mocky/utils/network/response_api.dart';
import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  Mocky? listData;
  String searchKey = '';
  bool isSearchActive = false;

  updateSearchActive(bool val) {
    if (!val) {
      searchKey = '';
    }
    isSearchActive = val;
    notifyListeners();
  }

  updateSearchKey(String key) {
    searchKey = key.toLowerCase();
    notifyListeners();
  }

  getListData() async {
    ResponseAPI responseAPI = await ApiProvider().callListData();

    if (responseAPI.status == Status.success) {
      listData = responseAPI.data as Mocky;
      notifyListeners();
    }
  }
}
