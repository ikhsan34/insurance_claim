import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/form_claim_binding.dart';
import 'package:insurance_claim/modules/form_claim/form_claim_page.dart';
import 'package:insurance_claim/modules/splash/splash_controller.dart';
import 'package:insurance_claim/modules/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/loader',
          initialBinding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
          getPages: [
            GetPage(
              name: '/loader',
              page: () => const SplashPage(),
            ),
            GetPage(
              name: FormClaimPage.route,
              page: () => const FormClaimPage(),
              binding: FormClaimBinding(),
            ),
          ],
        );
      },
    );
  }
}
