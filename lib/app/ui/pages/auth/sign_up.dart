import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/text.dart';
import '../../widgets/common/textform_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppFontSize.radiusDefault),
                        color:
                            Theme.of(context).primaryColor.withOpacity(.070)),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'setup_account',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fontSizeOverLarge,
                  ),
                  const SizedBox(height: 10),
                  CommonText(
                    text: 'complete_account',
                    fontSize: AppFontSize.fontSizeSmall,
                    fontColor: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Name',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Name", controller: AuthController.to.lEmail),
                    CommonText(
                      text: 'Email',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Email",
                        controller: AuthController.to.lEmail,
                        keyboardType: TextInputType.emailAddress),
                    CommonText(
                      text: 'Phone',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Phone",
                        controller: AuthController.to.lEmail,
                        keyboardType: TextInputType.number),
                    CommonText(
                      text: 'Password',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Password",
                        controller: AuthController.to.lEmail,
                        obscureText: true),
                    CommonText(
                      text: 'Confirm Password',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                      hintText: "Confirm Password",
                      controller: AuthController.to.lEmail,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
                bottom: 20,
                right: AppFontSize.paddingSizeDefault,
                left: AppFontSize.paddingSizeDefault),
            height: 50,
            child: CommonButton(text: 'save', onPressed: () {})),
      ),
    );
  }
}
