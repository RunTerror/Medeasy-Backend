// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:medicare_web/constants/style/style_constants.dart';
import 'package:medicare_web/constants/utils.dart';
import 'package:medicare_web/providers/appwriteProvider.dart';
import 'package:medicare_web/routes/routes_constants.dart';
import 'package:medicare_web/services/ai_model_service.dart';
import 'package:medicare_web/services/apiService.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  State<SymptomsPage> createState() => PersonalDetailsState();
}

class PersonalDetailsState extends State<SymptomsPage> {
  String? _selectedFilePath;
  String? gem1Response;
  String? gem2Response;
  String? gem3Response;
  FilePickerResult? selectedFile;
  bool isLoading = false;
  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      selectedFile = result;
      print(result.files.single.name);
      setState(() {
        _selectedFilePath = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }

  Future<String?> _readFileAsBinary(PlatformFile file) async {
    if (selectedFile != null) {
      try {
        var listint = file.bytes!.toList();
        var bytes = Uint8List.fromList(listint);

        String binaryString = '';
        for (int byte in bytes) {
          // Convert each byte to its binary representation and pad with zeros to ensure 8 bits
          String byteString = byte.toRadixString(2).padLeft(8, '0');
          binaryString += byteString;
        }
        return binaryString;
      } catch (e) {
        print('Error reading file: $e');
        return null;
      }
    }
    return null;
  }

  List<Widget> navItems = [
    TextButton(
        onPressed: () {},
        child: const Text(
          "Home",
          style: TextStyle(
            fontSize: 18,
            color: StyleConstants.colorTitle,
            fontWeight: FontWeight.bold,
          ),
        )),
    TextButton(
        onPressed: () {},
        child: const Text(
          "Past Records",
          style: TextStyle(
            fontSize: 18,
            color: StyleConstants.colorTitle,
            fontWeight: FontWeight.bold,
          ),
        )),
    Padding(
      padding: const EdgeInsets.only(right: 250),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            "AI Help",
            style: TextStyle(
              fontSize: 18,
              color: StyleConstants.colorTitle,
              fontWeight: FontWeight.bold,
            ),
          )),
    ),
  ];
  final String firstContainerText = 'Ask Below Questions';

  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _inputText = '';
  void _toggleListening() {
    if (!_isListening) {
      _startListening();
    } else {
      _stopListening();
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Status: $status');
      },
      onError: (error) {
        print('Error: $error');
      },
    );

    if (available) {
      setState(() {
        _isListening = true;
      });
      _speech.listen(
        onResult: (result) async {
          setState(() {
            _inputText = result.recognizedWords;
          });
        },
      );
    }
  }

  void _stopListening() async {
    setState(() {
      _isListening = false;
    });

    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AppwriteProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              "assets/images/logo2.png",
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: size.height * 0.1,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: navItems,
        ),
        body: Container(
          color: StyleConstants.scaffoldBackgroundColor,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: size.height / 1.5,
              color: StyleConstants.scaffoldBackgroundColor,
              child: Scaffold(
                backgroundColor: StyleConstants.scaffoldBackgroundColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: Container(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.0,
                        ),
                        children: [
                          TextSpan(
                            style: TextStyle(
                                fontSize: 40,
                                color: StyleConstants.colorTitle,
                                fontWeight: FontWeight.w700),
                            text: 'ADD',
                          ),
                          TextSpan(
                              text: ' SYMPTOMS DESCRIPTION',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: StyleConstants.colorTitle,
                                  fontWeight: FontWeight.w100)),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(100),
                      Visibility(
                        visible: _inputText == '' ? false : true,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 25,
                                alignment: Alignment.centerLeft,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 200),
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: const Text(
                                  'MEDEASY',
                                  style: TextStyle(
                                      color: StyleConstants.colorTitle),
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 200),
                              constraints: const BoxConstraints(minHeight: 50),
                              decoration: const BoxDecoration(
                                  color: StyleConstants.colorTitle,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              width: double.infinity / 1.4,
                              child: Text(_inputText,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _inputText == '' ? false : true,
                        child: const Gap(20),
                      ),
                      Container(
                        width: 400,
                        margin: const EdgeInsets.symmetric(horizontal: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: _toggleListening,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: StyleConstants.colorTitle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                height: 50,
                                width: 350,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      _isListening == false
                                          ? Icons.mic
                                          : Icons.stop,
                                      color: _isListening == false
                                          ? Colors.white
                                          : Colors.red,
                                    ),
                                    Text(
                                      _isListening
                                          ? 'Stop Listening'
                                          : 'Record Patient Audio',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Gap(5)
                                  ],
                                ),
                              ),
                            ),
                            const Gap(30),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  _inputText == '' ? Colors.grey : Colors.green,
                              child: const Icon(
                                Icons.check,
                                size: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        'Max file size 50 MB    ',
                        style: TextStyle(
                            color: StyleConstants.colorTitle, fontSize: 14),
                      ),
                      const Gap(50),
                      const Text(
                        'Add previous health records (if any)      ',
                        style: TextStyle(
                            color: StyleConstants.colorTitle, fontSize: 14),
                      ),
                      const Gap(5),
                      Container(
                        width: 400,
                        margin: const EdgeInsets.symmetric(horizontal: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            SizedBox(
                              height: 50,
                              width: 350,
                              child: ElevatedButton(
                                onPressed: _selectFile,
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: StyleConstants.colorTitle,
                                    foregroundColor:
                                        StyleConstants.scaffoldBackgroundColor),
                                child: const Text(
                                  "Select File",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            const Gap(30),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: _selectedFilePath == null
                                  ? Colors.grey
                                  : Colors.green,
                              child: const Icon(
                                Icons.check,
                                size: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      if (_selectedFilePath != null)
                        Text('Selected File: $_selectedFilePath',
                            style: const TextStyle(
                                color: StyleConstants.colorTitle,
                                fontSize: 14)),
                      const Gap(5),
                      const Text(
                        'Max file size 50 MB',
                        style: TextStyle(
                            color: StyleConstants.colorTitle, fontSize: 14),
                      ),
                      const Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 600),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            //To Do
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: const Icon(Icons.add),
                              ),
                              const Gap(10),
                              const Text('Add more records (if any)',
                                  style: TextStyle(
                                      color: StyleConstants.colorTitle,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  _inputText.trim().toString();
                  if (_inputText.isEmpty) {
                    Utils()
                        .showSnackBar(context, 'Please record a audio first');
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  // if (selectedFile != null) {
                  //   // here is the selected file in binary format for sending to api
                  //   final binary =
                  //       await _readFileAsBinary(selectedFile!.files.first);
                  //   log(binary.toString());
                  // }

                  // if (gem1Response != null) {
                  //   gem2Response = await AIService().findQuesApi(gem1Response!);
                  // }
                  // if (gem2Response != null) {
                  //   gem3Response = await AIService().findQuesApi(gem2Response!);
                  // }
                  // if (gem3Response != null) {
                  //   setState(() {
                  //     isLoading = true;
                  //   });

                  // try {} catch (e) {
                  //   log(e.toString());
                  // }

                  gem1Response = await AIService().api(_inputText);
                  log(gem1Response.toString());
                  if (gem1Response == null) return;
                  final response =
                      await provider.sendAudio(gem1Response!.toString(), {});
                  provider.statement = gem1Response!.toString();
                  if (response != null) {
                    if (context.mounted) {
                      Navigator.of(context).pushNamed(
                        RoutesConstants.genQuesRoute,
                      );
                    }
                  }
                },
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: StyleConstants.colorTitle,
                      )
                    : const Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 28,
                          color: StyleConstants.colorTitle,
                          fontWeight: FontWeight.w900,
                        ),
                      )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "MEDEASY",
                        style: TextStyle(
                          fontSize: 38,
                          color: StyleConstants.colorTitle,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "AI HEALTH ASSISTANT",
                        style: TextStyle(
                          fontSize: 15,
                          color: StyleConstants.colorTitle,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      );
    });
  }
}
