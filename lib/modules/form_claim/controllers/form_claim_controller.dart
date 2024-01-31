import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/widgets/capture_document_page.dart';

class FormClaimController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController biodataController;

  Rx<Map?> provinceDropdownValue = Rx<Map?>(null);
  Rx<Map?> cityDropdownValue = Rx<Map?>(null);
  Rx<Map?> subDistrictDropdownValue = Rx<Map?>(null);
  Rx<String?> subVillageDropdownValue = Rx<String?>(null);

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    biodataController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    biodataController.dispose();

    super.dispose();
  }

  void onProvinceChange(Map? value) {
    provinceDropdownValue.value = value!;
    cityDropdownValue.value = null;
    subDistrictDropdownValue.value = null;
    subVillageDropdownValue.value = null;
    update();
  }

  void onCityChange(Map? value) {
    cityDropdownValue.value = value!;
    subDistrictDropdownValue.value = null;
    subVillageDropdownValue.value = null;
    update();
  }

  void onSubDistrictChange(Map? value) {
    subDistrictDropdownValue.value = value!;
    subVillageDropdownValue.value = null;
    update();
  }

  void onSubVillageChange(String? value) {
    subVillageDropdownValue.value = value!;
    update();
  }

  void onSubmit() {
    if (subVillageDropdownValue.value != null) {
      Get.to(() => const CaptureDocumentPage());
      Get.snackbar(
        'Success',
        'Form is valid',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please select your address first',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
