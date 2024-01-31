import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/controllers/capture_document_controller.dart';
import 'package:insurance_claim/modules/form_claim/widgets/photo_box.dart';
import 'package:insurance_claim/utils/widgets/full_width_button.dart';

class CaptureDocumentPage extends GetView<CaptureDocumentController> {
  const CaptureDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Document'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selfie Photo',
                style: TextStyle(fontSize: 16.dp),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return PhotoBox(
                  onTap: controller.pickSelfieImage,
                  onRemove: () {
                    controller.selfieImage.value = null;
                  },
                  image: controller.selfieImage.value,
                );
              }),
              const SizedBox(height: 40),
              Text(
                'ID Card Photo',
                style: TextStyle(fontSize: 16.dp),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return PhotoBox(
                  onTap: controller.pickIdCardImage,
                  onRemove: () {
                    controller.idCardImage.value = null;
                  },
                  image: controller.idCardImage.value,
                );
              }),
              const SizedBox(height: 40),
              Text(
                'Foto Bebas',
                style: TextStyle(fontSize: 16.dp),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return PhotoBox(
                  onTap: controller.pickFreeImage,
                  onRemove: () {
                    controller.freeImage.value = null;
                  },
                  image: controller.freeImage.value,
                );
              }),
              const SizedBox(height: 40),
              FullWidthButton(onPressed: controller.onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
