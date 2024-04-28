import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  // final mainRepository = MainRepository();

  final _configData = {}.obs;

  get configData => _configData.value;

  set configData(value) {
    _configData.value = value;
  }

  final _distanceData = {}.obs;

  get distanceData => _distanceData.value;

  set distanceData(value) {
    _distanceData.value = value;
  }

  final _distanceKm = "".obs;

  get distanceKm => _distanceKm.value;

  set distanceKm(value) {
    _distanceKm.value = value;
  }

  final _serverDown = false.obs;

  get serverDown => _serverDown.value;

  set serverDown(value) {
    _serverDown.value = value;
  }

  final _savedCookiesData = false.obs;

  get savedCookiesData => _savedCookiesData.value;

  set savedCookiesData(value) {
    _savedCookiesData.value = value;
  }

  final _getConfigSuccess = true.obs;

  get getConfigSuccess => _getConfigSuccess.value;

  set getConfigSuccess(value) {
    _getConfigSuccess.value = value;
  }

  final _onBoardingList = <dynamic>[].obs;

  get onBoardingList => _onBoardingList.value;

  set onBoardingList(value) {
    _onBoardingList.value = value;
  }

  final _onboardSelectedIndex = 0.obs;

  get onboardSelectedIndex => _onboardSelectedIndex.value;

  set onboardSelectedIndex(value) {
    _onboardSelectedIndex.value = value;
  }

  showLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var language = pref.getString('language');
    if (language != null && language.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  setLanguage({language}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('language', '$language');
  }

  getConfigData() async {
    // getConfigSuccess = false;
    // try {
    //   var res = await mainRepository.getConfigData();
    //   if (statusCode == 200) {
    //     getConfigSuccess = true;
    //     debugPrint("Successfully get config data");
    //     configData = res;
    //     // Timer(const Duration(seconds: 3), () {
    //     //   Get.offNamed('/');
    //     // });
    //     debugPrint("Config Data is: $configData");
    //   } else if (statusCode == 404) {
    //     getConfigSuccess = false;
    //     serverDown = true;
    //     debugPrint("Server down, base url");
    //   } else {
    //     serverDown = false;
    //     configData = {};
    //     getConfigSuccess = false;
    //     debugPrint("Failed to get config data");
    //   }
    // } catch (e) {
    //   getConfigSuccess = false;
    //   debugPrint("Error on get config data $e");
    // }
  }
}
