import 'package:flutter/material.dart';

class LoadingBuilderWidget extends StatelessWidget {
  const LoadingBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
