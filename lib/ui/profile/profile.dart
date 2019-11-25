import 'package:flutter/material.dart';
import 'package:flutter_base/ui/base/base_stateful_widget.dart';

class Profile extends BaseStatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseStatefulWidgetState {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming soon..',
        textAlign: TextAlign.center,
      ),
    );
  }
}
