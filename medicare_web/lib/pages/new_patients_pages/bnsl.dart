import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SymptomScreen extends StatefulWidget {
  const SymptomScreen({super.key});

  @override
  State<SymptomScreen> createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  final color = const Color(0XFF1C2932);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(180),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'ADD',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: color)),
                TextSpan(
                    text: ' SYMPTOMS DESCRIPTION',
                    style: TextStyle(
                        fontSize: 40,
                        color: color,
                        fontWeight: FontWeight.w100)),
              ])),
            ),
            const Gap(80),
            Visibility(
              visible: _inputText == '' ? false : true,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 25,
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 200),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: const Text(
                        'MEDEASY',
                        style: TextStyle(color: Colors.white),
                      )),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 200),
                    constraints: const BoxConstraints(minHeight: 50),
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
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
              child: Gap(20),
            ),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(horizontal: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: _toggleListening,
                    child: Container(
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      height: 50,
                      width: 350,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            _isListening == false ? Icons.mic : Icons.stop,
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
                                fontSize: 20,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(30),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Max file size 50 MB',
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 14),
            ),
            const Gap(50),
            Text(
              'Add previous health records (if any)',
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 14),
            ),
            Gap(5),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(horizontal: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: color,
                        border: Border.all(width: 1)),
                    child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        iconColor: Colors.white,
                        backgroundColor: color,
                        key: UniqueKey(),
                        title: Row(
                          children: [
                            Text(
                              'Upload health record',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text(
                              'ECG',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            title: Text(
                              'Blood report',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            title: Text(
                              'MRI',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text(
                              'CT SCAN',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ]),
                  ),
                  Gap(30),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Gap(5),
            Text(
              'Max file size 50 MB',
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 14),
            ),
            Gap(50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 600),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.add),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    Gap(5),
                    Text('Add more records (if any)')
                  ],
                ),
              ),
            ),
            Gap(30),
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 550),
              child: TextButton(
                onPressed: () {
                  // Add your button functionality here
                },
                child: Text('Go NEXT >',
                    style: TextStyle(
                        fontFamily: 'Inter-VariableFont_slnt,wght',
                        fontSize: 33,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  String _detectLanguage(String text) {
    // Basic detection based on presence of Hindi characters
    bool containsHindi = RegExp(r'[अ-ह]').hasMatch(text);
    return containsHindi ? 'hi' : 'en';
  }
}
