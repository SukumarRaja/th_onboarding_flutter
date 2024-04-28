import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/login_method_card.dart';
import '../../widgets/common/text.dart';
import 'login.dart';
import 'sign_up.dart';

class AuthChoose extends StatelessWidget {
  const AuthChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Center(
                  child: Image.asset('assets/images/login.png'),
                ),
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
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'lets_sign',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fontSizeOverLarge,
                  ),
                  const SizedBox(height: 10),
                  const LoginMethodCard(
                      title: 'continue_fb', image: "facebook.png"),
                  const LoginMethodCard(
                      title: 'continue_google', image: "google.jpg"),
                  const LoginMethodCard(
                      title: 'continue_insta', image: "insta.png"),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Divider(
                            thickness: 2,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CommonText(
                          text: "Or",
                          fontColor: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Expanded(
                          flex: 2,
                          child: Divider(
                            thickness: 2,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: AppFontSize.paddingSizeDefault),
              child: Column(
                children: [
                  CommonButton(
                      text: 'sign_with',
                      isMargin: true,
                      onPressed: () {
                        Get.to(() => const Login());
                      }),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: 'dont_account',
                        fontSize: AppFontSize.fontSizeDefault,
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                        child: CommonText(
                          text: 'sign_up',
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontSize.fontSizeDefault,
                          fontColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
