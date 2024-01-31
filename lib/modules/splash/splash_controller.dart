import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/form_claim_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(FormClaimPage.route);
    });
  }
}
