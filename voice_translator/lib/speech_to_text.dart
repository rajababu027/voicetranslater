import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_translator/constant.dart';
import 'package:voice_translator/controller/language_controller.dart';

class SpeechToTextPage extends GetView<LanguageController> {
 
  @override
  Widget build(BuildContext context) {
    Get.isRegistered<LanguageController>()
        ? Get.find<LanguageController>()
        : Get.put(LanguageController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(controller.language.value.isNotEmpty
              ? controller.language.value
              : "Welcome"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          endRadius: 75.0,
          animate: controller.isListening.value,
          duration: Duration(milliseconds: 2000),
          glowColor: bgColor,
          repeat: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) async {
              controller.setOnTapDown();
              // if (!isListening) {
              //   var available = await speechToText.initialize();
              //   if (available) {
              //     setState(() {
              //       isListening = true;
              //       speechToText.listen(
              //         onResult: (result) {
              //           setState(() {
              //             text = result.recognizedWords;
              //             translate();
              //             Future.delayed(Duration(seconds: 2), () {
              //               print(text);
              //               print(translatedText);
              //               speak(widget.code, translatedText);
              //             });
              //           });
              //         },
              //       );
              //     });
              //   }
              // }
            },
            onTapUp: (details) {
              controller.setOnTapUp();
              // setState(() {
              //   isListening = false;
              // });
              // speechToText.stop();
            },
            child: CircleAvatar(
              backgroundColor: bgColor,
              radius: 35,
              child: Icon(
                controller.isListening.value ? Icons.mic : Icons.mic_none,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Container(
                    width: Get.width,
                    // height: Get.height * .5,
                    alignment: Alignment.center,
                    child: Text(
                      // controller.text.value.isNotEmpty
                      controller.translatedText.value.toString(),
                      // : "Please try Again",
                      style: TextStyle(
                          fontSize: 24,
                          color: controller.isListening.value
                              ? Colors.black87
                              : Colors.black54,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  // height: Get.height * .5,
                  alignment: Alignment.center,
                  child: Text(
                    // controller.text.value.isNotEmpty
                    controller.text.value.toString(),
                    // : "Please try Again",
                    style: TextStyle(
                        fontSize: 24,
                        color: controller.isListening.value
                            ? Colors.black87
                            : Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
