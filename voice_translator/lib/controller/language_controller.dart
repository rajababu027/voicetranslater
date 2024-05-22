import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';
import 'package:voice_translator/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';

class LanguageController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  SpeechToText speechToText = SpeechToText();
  TextToSpeech tts = TextToSpeech();
  RxString dropdownvalue = 'Malayalam'.obs;
  RxString code = ''.obs;
  RxString language = ''.obs;
  RxString translatedText = "".obs;
  RxString text = "Hold the button and speack".obs;
  RxBool isListening = false.obs;
  var items = [
    'Malayalam',
    'Kannada',
    'Tamil',
    'Telugu',
  ].obs;

  setDropdownValue(String newValue) {
    dropdownvalue.value = newValue;
  }

  getTranslateCode() {
    // setState(() {
    if (dropdownvalue.value == 'Malayalam') {
      code.value = 'ml';
      language.value = 'Malayalam';
    } else if (dropdownvalue.value == 'Kannada') {
      code.value = 'kn';
      language.value = 'Kannada';
    } else if (dropdownvalue.value == 'Tamil') {
      code.value = 'ta';
      language.value = 'Tamil';
    } else if (dropdownvalue.value == 'Telugu') {
      code.value = 'te';
      language.value = 'Telugu';
    }
    Get.to(() => SpeechToTextPage());
    print(code);
    // });
  }

  Future speak(String languageCode, String text) async {
    // tts.setLanguage(languageCode);
    // tts.setPitch(0.5);
    // tts.setVolume(1);
    // tts.setRate(0.5);
    // tts.speak(text);

    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(0.25);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  // Future translate() async {
  //   if (text.value.isNotEmpty) {
  //     Translation translation =
  //         await translator.translate(text.value, to: code.value);
  //     translatedText.value = translation.text;
  //   } else {
  //     print("Text is Empty");
  //   }
  // }

  setOnTapDown() async {
    if (!isListening.value) {
      var available = await speechToText.initialize();
      if (available) {
        // setState(() {
        isListening.value = true;
        speechToText.listen(
          onResult: (result) async {
            // setState(() {
            text.value = result.recognizedWords;

            // translate();
            // if (result.recognizedWords.isNotEmpty) {
            //   Translation translation = await translator
            //       .translate(result.recognizedWords, to: code.value);
            //   translatedText.value = translation.text;
            //   print(result.recognizedWords);
            //   print(translation.text);
            //   speak(code.value, translation.text);
            // } else {
            //   print("Text is Empty");
            // }

            // });
          },
        );
        // });
      }
    }
  }

  setOnTapUp() async {
    // setState(() {
    isListening.value = false;
    // });
    speechToText.stop();
    // translate();
    if (text.value.isNotEmpty) {
      Translation translation =
          await translator.translate(text.value, to: code.value);
      translatedText.value = translation.text;
      print(text.value);
      print(translatedText.value);
      speak(code.value, translatedText.value);
    } else {
      print("Text is Empty");
    }

    // translate();
    // print("Text ${text.value}");
    // print("Translated text ${translatedText.value}");
    // speak(code.value, translatedText.value);
  }
}
