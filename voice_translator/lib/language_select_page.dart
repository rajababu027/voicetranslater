import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_translator/controller/language_controller.dart';

class SelectLanguage extends GetView<LanguageController> {
  const SelectLanguage({Key? key}) : super(key: key);

  // Initial Selected Value
  @override
  Widget build(BuildContext context) {
    Get.isRegistered<LanguageController>()
        ? Get.find<LanguageController>()
        : Get.put(LanguageController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Select Language"),
        ),
        body: Center(
          child: DropdownButton(
            // Initial Value
            value: controller.dropdownvalue.value,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: controller.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.setDropdownValue(newValue.toString());
              print("New Value $newValue");
            },
            // After selecting the desired option,it will
            // change button value to selected value
            // onChanged: (String newValue) {
            //   controller.setDropdownValue(newValue);
            //   // setState(() {
            //   //   dropdownvalue = newValue!;
            //   //   // print(newValue);
            //   // });
            // },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getTranslateCode();
            // setState(() {
            //   if (dropdownvalue == 'Hindi') {
            //     code = 'hi';
            //   } else if (dropdownvalue == 'English United States') {
            //     code = 'en';
            //   } else if (dropdownvalue == 'Russian') {
            //     code = 'ru';
            //   } else if (dropdownvalue == 'French') {
            //     code = 'fr';
            //   } else if (dropdownvalue == 'chinese') {
            //     code = 'zh-cn';
            //   }
            //   Get.to(() => SpeechToTextPage(code: code!));
            //   print(code);
            // });
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.arrow_forward),
        ),
      );
    });
  }
}
