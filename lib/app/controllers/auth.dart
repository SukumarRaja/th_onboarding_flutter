import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:th_onboarding_flutter/app/ui/pages/auth/choose.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  ///text controllers
  final lEmail = TextEditingController();

  ///variable
  final _onboardingSelectedIndex = 0.obs;

  get onboardingSelectedIndex => _onboardingSelectedIndex.value;

  set onboardingSelectedIndex(value) {
    _onboardingSelectedIndex.value = value;
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    debugPrint("token is:  $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    Get.to(() => const AuthChoose());
  }
}
