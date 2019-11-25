import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_base/ui/base/base_stateful_widget.dart';
import 'package:flutter_base/ui/dashboard/dashboard.dart';

class Splash extends BaseStatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseStatefulWidgetState {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _navigateToDashboard);
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => Dashboard(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hi.., I'm Splash",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
