import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/controllers/capture_document_controller.dart';
import 'package:insurance_claim/modules/form_claim/controllers/form_claim_controller.dart';

class FormClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FormClaimController());
    Get.put(CaptureDocumentController());
  }
}
