import 'package:flutter/material.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool loading;
  final String title;
  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonBackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: AppColors.whiteColor),
        )),
      ),
    );
  }
}
