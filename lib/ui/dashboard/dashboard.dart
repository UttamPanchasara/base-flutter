import 'package:flutter/material.dart';
import 'package:flutter_base/ui/base/base_stateful_widget.dart';

class Dashboard extends BaseStatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends BaseStatefulWidgetState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text(
          'Body will be here soon..',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
