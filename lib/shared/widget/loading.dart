import 'package:flutter/material.dart';

import '../../ui/resources/colors/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.blue,
      ),
    );
  }
}
