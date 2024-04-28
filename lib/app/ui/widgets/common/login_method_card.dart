import 'package:flutter/material.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class LoginMethodCard extends StatelessWidget {
  const LoginMethodCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: AppFontSize.paddingSizeSmall),
      padding: const EdgeInsets.symmetric(
          vertical: AppFontSize.paddingSizeSmall,
          horizontal: AppFontSize.paddingSizeSmall),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.090),
          borderRadius: BorderRadius.circular(AppFontSize.radiusDefault)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/$image',
            height: 30,
          ),
          const SizedBox(width: 10),
          CommonText(
            text: title,
            fontSize: AppFontSize.fontSizeDefault,
            fontColor: Theme.of(context).hintColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
