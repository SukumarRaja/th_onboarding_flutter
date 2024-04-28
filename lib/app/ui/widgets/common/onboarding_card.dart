import 'package:flutter/material.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(AppFontSize.paddingSizeExtraLarge),
            child: Image.asset(image),
          )),
      Expanded(
        flex: 1,
        child: CommonText(
          text: title,
          fontSize: AppFontSize.fontSizeExtraLarge,
          fontWeight: FontWeight.bold,
          // fontColor: Theme.of(context).primaryColor,
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        flex: 1,
        child: CommonText(
          text: description,
          fontSize: AppFontSize.fontSizeDefault,
          fontColor: Theme.of(context).hintColor,
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
