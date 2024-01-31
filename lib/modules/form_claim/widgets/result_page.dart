import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/controllers/result_controller.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: GetBuilder<ResultController>(
          init: ResultController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(1),
                        1: IntrinsicColumnWidth(),
                        2: FlexColumnWidth(2),
                      },
                      defaultColumnWidth: const IntrinsicColumnWidth(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(
                          children: [
                            const Text('ID Number'),
                            const Text(': '),
                            Text(
                              controller.resultModel.idCardNumber ?? 'Cannot read ID Number, please retake the photo',
                              style: TextStyle(
                                color: controller.resultModel.idCardNumber == null ? Colors.red : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('First Name'),
                            const Text(':'),
                            Text(controller.resultModel.firstName),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Last Name'),
                            const Text(': '),
                            Text(controller.resultModel.lastName),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Province'),
                            const Text(': '),
                            Text(controller.resultModel.province),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('City'),
                            const Text(': '),
                            Text(controller.resultModel.city),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('District'),
                            const Text(': '),
                            Text(controller.resultModel.district),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Village'),
                            const Text(': '),
                            Text(controller.resultModel.village),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.toggleShowJson,
                      child: Text(controller.isShowJson.value ? 'Hide JSON' : 'Show JSON'),
                    ),
                  ),
                  Obx(
                    () {
                      return AnimatedOpacity(
                        opacity: controller.isShowJson.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          children: [
                            const Divider(),
                            const SizedBox(height: 10),
                            Text(controller.resultModel.toJson().toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
