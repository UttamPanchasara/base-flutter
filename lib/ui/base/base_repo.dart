import 'package:flutter_base/network/api_manager.dart';

class BaseRepo {
  ApiManager _apiManager;

  ApiManager getApiManager() {
    if (_apiManager == null) {
      _apiManager = new ApiManager();
    }
    return _apiManager;
  }
}
