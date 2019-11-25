import 'package:flutter/material.dart';
import 'package:flutter_base/ui/base/base_view.dart';
import 'package:flutter_base/utils/app_utils.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseStatefulWidget extends StatefulWidget {}

abstract class BaseStatefulWidgetState extends State<BaseStatefulWidget>
    implements BaseView {
  CompositeSubscription _compositeSubscription = CompositeSubscription();

  CompositeSubscription getDisposable() {
    return _compositeSubscription;
  }

  @override
  void dispose() {
    _compositeSubscription?.clear();
    super.dispose();
  }

  @override
  void onError(String errorMessageKey) {
    // do nothing
  }

  @override
  void showError(String errorMessage) {
    AppUtils.instance.showMessage(errorMessage, Colors.red, context);
  }

  @override
  void hideProgress() {
    AppUtils.instance.hideProgress(context);
  }

  @override
  void onDataAvailable(data) {
    // do nothing
  }

  @override
  void showProgress() {
    AppUtils.instance.showProgress(context);
  }

  @override
  void setState(fn) {
    // this is to avoid memory leak,
    // avoid setState() call if already disposed
    if (mounted) {
      super.setState(fn);
    }
  }
}
