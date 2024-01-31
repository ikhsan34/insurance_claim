import 'package:get/get.dart';
import 'package:insurance_claim/models/result_model.dart';
import 'package:insurance_claim/modules/form_claim/controllers/capture_document_controller.dart';
import 'package:insurance_claim/modules/form_claim/controllers/form_claim_controller.dart';

class ResultController extends GetxController {
  final formClaimController = Get.find<FormClaimController>();
  final captureDocumentController = Get.find<CaptureDocumentController>();
  late final ResultModel resultModel;

  RxBool isShowJson = RxBool(false);

  @override
  void onInit() {
    resultModel = ResultModel(
      idCardNumber: captureDocumentController.idCardNumber.value,
      firstName: formClaimController.firstNameController.text,
      lastName: formClaimController.lastNameController.text,
      province: formClaimController.provinceDropdownValue.value!['name'],
      city: formClaimController.cityDropdownValue.value!['name'],
      district: formClaimController.subDistrictDropdownValue.value!['name'],
      village: formClaimController.subVillageDropdownValue.value!,
    );

    super.onInit();
  }

  void toggleShowJson() {
    isShowJson.value = !isShowJson.value;
  }
}
