import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/font_size.dart';
import 'text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isMargin = false})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final bool isMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        margin: EdgeInsets.symmetric(
            horizontal: isMargin == true ? AppFontSize.paddingSizeSmall : 0),
        padding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: AppFontSize.paddingSizeSmall),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(AppFontSize.radiusDefault)),
        child: CommonText(
          text: text,
          fontSize: AppFontSize.fontSizeLarge,
          fontColor: Theme.of(context).cardColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
