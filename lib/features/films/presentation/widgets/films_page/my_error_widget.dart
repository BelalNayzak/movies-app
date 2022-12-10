import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMsg;
  const MyErrorWidget({required this.errorMsg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMsg));
  }
}
