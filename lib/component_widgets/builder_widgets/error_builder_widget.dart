import 'package:flutter/material.dart';
class ErrorBuilderWidget extends StatelessWidget {
  ErrorBuilderWidget({Key? key,required this.error,this.fromFuture="Builder Err "}) : super(key: key);
  Object? error;
  String fromFuture;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(fromFuture + " : " + error.toString()),);
  }
}
