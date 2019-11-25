import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static final AppUtils instance = AppUtils._privateConstructor();

  bool _isProgressDialogShowing = false;

  void showMessage(String message, Color color, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    if (context != null) {
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  void showProgress(BuildContext context) {
    if (!_isProgressDialogShowing) {
      _isProgressDialogShowing = !_isProgressDialogShowing;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new CircularProgressIndicator(),
                ],
              ),
            ],
          );
        },
      );
    }
  }

  void hideProgress(BuildContext context) {
    if (_isProgressDialogShowing) {
      _isProgressDialogShowing = !_isProgressDialogShowing;
      Navigator.of(context).pop();
    }
  }
}
