import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_claim/modules/form_claim/widgets/result_page.dart';

class CaptureDocumentController extends GetxController {
  Rx<Uint8List?> selfieImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> idCardImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> freeImage = Rx<Uint8List?>(null);
  Rx<String?> idCardNumber = Rx<String?>(null);

  Future<void> pickSelfieImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (photo != null) {
      selfieImage.value = await photo.readAsBytes();
    }
  }

  Future<void> pickIdCardImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      idCardImage.value = await photo.readAsBytes();
      final bool result = await scanIdCard(File(photo.path));
      if (!result) {
        Get.snackbar('Failed', 'Failed to scan id card number, please retake the photo');
      }
    }
  }

  Future<void> pickFreeImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      freeImage.value = await photo.readAsBytes();
    }
  }

  Future<bool> scanIdCard(File file) async {
    bool result = false;
    final InputImage inputImage = InputImage.fromFile(file);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    RegExp regExp = RegExp(r'327[\d\w]{0,13}', multiLine: false);

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        if (regExp.hasMatch(line.text)) {
          idCardNumber.value = line.text;
          result = true;
        }
      }
    }
    textRecognizer.close();
    return result;
  }

  Future<void> onSubmit() async {
    if (selfieImage.value == null) {
      Get.snackbar('Failed', 'Please take selfie photo');
      return;
    }
    if (idCardImage.value == null) {
      Get.snackbar('Failed', 'Please take id card photo');
      return;
    }
    if (freeImage.value == null) {
      Get.snackbar('Failed', 'Please take free photo');
      return;
    }
    Get.to(() => const ResultPage());
  }
}
