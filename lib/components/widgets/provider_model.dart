import 'package:flutter/cupertino.dart';

class ProviderModel with ChangeNotifier {
  bool loading = false;

  void loadingg(bool loading) {
    this.loading = loading;
    notifyListeners();
  }

}

enum ViewState { Loading, Success, Failure, None }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.None;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
