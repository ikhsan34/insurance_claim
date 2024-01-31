import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_claim/modules/form_claim/controllers/form_claim_controller.dart';
import 'package:insurance_claim/utils/variables/province_data.dart';
import 'package:insurance_claim/utils/widgets/full_width_button.dart';

class FormClaimPage extends GetView<FormClaimController> {
  static const String route = '/';
  const FormClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Claim'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                  controller: controller.firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                  controller: controller.lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Biodata is required';
                    }
                    return null;
                  },
                  controller: controller.biodataController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Biodata',
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return DropdownButton<Map>(
                    hint: const Text("Select a province"),
                    value: controller.provinceDropdownValue.value,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    isExpanded: true,
                    itemHeight: 60,
                    onChanged: controller.onProvinceChange,
                    items: ProvinceData.data['provinces'].map<DropdownMenuItem<Map>>((province) {
                      return DropdownMenuItem<Map>(
                        value: province,
                        child: Text(province['name']),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return DropdownButton<Map>(
                    hint: const Text("Select a city"),
                    value: controller.cityDropdownValue.value,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    isExpanded: true,
                    itemHeight: 60,
                    onChanged: controller.onCityChange,
                    items: controller.provinceDropdownValue.value?['cities'].map<DropdownMenuItem<Map>>((city) {
                      return DropdownMenuItem<Map>(
                        value: city,
                        child: Text(city['name']),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return DropdownButton<Map>(
                    hint: const Text("Select a sub district"),
                    value: controller.subDistrictDropdownValue.value,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    isExpanded: true,
                    itemHeight: 60,
                    onChanged: controller.onSubDistrictChange,
                    items: controller.cityDropdownValue.value?['kecamatan'].map<DropdownMenuItem<Map>>((district) {
                      return DropdownMenuItem<Map>(
                        value: district,
                        child: Text(district['name']),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return DropdownButton<String>(
                    hint: const Text("Select a sub village"),
                    value: controller.subVillageDropdownValue.value,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    isExpanded: true,
                    itemHeight: 60,
                    onChanged: controller.onSubVillageChange,
                    items: controller.subDistrictDropdownValue.value?['kelurahan'].map<DropdownMenuItem<String>>((village) {
                      return DropdownMenuItem<String>(
                        value: village,
                        child: Text(village),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: 20),
                FullWidthButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.onSubmit();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
