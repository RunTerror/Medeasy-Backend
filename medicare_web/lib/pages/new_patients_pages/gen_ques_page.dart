import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_web/constants/style/style_constants.dart';
import 'package:medicare_web/constants/utils.dart';
import 'package:medicare_web/providers/appwriteProvider.dart';
import 'package:medicare_web/routes/routes_constants.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class GenQuesPage extends StatefulWidget {
  const GenQuesPage({
    super.key,
  });

  @override
  State<GenQuesPage> createState() => _GenQuesPageState();
}

class _GenQuesPageState extends State<GenQuesPage> {
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
  List<String> ques = [];
  List<Message> questionAnswer = [];
  int i = 0;
  final ScrollController _controller = ScrollController();
  testadd() {
    i++;
    if (i <= ques.length - 1) {
      questionAnswer.add(Message(message: ques[i], by: 'medeasy'));
    } else {
      questionAnswer
          .add(Message(message: "No more questions left!", by: 'medeasy'));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ap = Provider.of<AppwriteProvider>(context, listen: false);
      ques = ap.questions;
      questionAnswer.add(Message(message: ques[0], by: 'medeasy'));
      setState(() {});
    });
  }

  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _inputText = '';
  var value = false;
  String words = '';

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
          if (_isListening == true) {
            setState(() {
              _inputText = result.recognizedWords;
              words = _inputText;
            });
            log(words);
            value = true;
          }
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
            height: size.height / 1.4,
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
                          text: 'ASK',
                        ),
                        TextSpan(
                          text: ' BELOW QUESTIONS',
                          style: TextStyle(
                              fontSize: 40,
                              color: StyleConstants.colorTitle,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: StyleConstants.colorTitle),
                              width: 1000,
                              height: 350,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 0,
                                        left: 10,
                                        right: 10),
                                    height: 250,
                                    child: ScrollbarTheme(
                                      data: ScrollbarThemeData(
                                        thumbColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        trackColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white.withOpacity(0.5)),
                                      ),
                                      child: Scrollbar(
                                        controller: _controller,
                                        thumbVisibility: true,
                                        child: ListView.builder(
                                          controller: _controller,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  questionAnswer[index].by ==
                                                          'medeasy'
                                                      ? MainAxisAlignment.start
                                                      : MainAxisAlignment.end,
                                              children: [
                                                questionAnswer[index].by ==
                                                        'medeasy'
                                                    ? Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  50), // This sets the radius to 50
                                                        ),
                                                        child: Text(
                                                          questionAnswer[index]
                                                              .by[0]
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                StyleConstants
                                                                    .colorTitle,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                                const Gap(10),
                                                Flexible(
                                                  child: Text(
                                                    questionAnswer[index]
                                                        .message,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(10),
                                                questionAnswer[index].by ==
                                                        'patient'
                                                    ? Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  50), // This sets the radius to 50
                                                        ),
                                                        child: Text(
                                                          questionAnswer[index]
                                                              .by[0]
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                StyleConstants
                                                                    .colorTitle,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                                const Gap(20),
                                              ],
                                            );
                                          },
                                          itemCount: questionAnswer.length,
                                        ),
                                      ),
                                    ),

                                    // child: ListView.builder(
                                    //   itemBuilder: (context, index) {
                                    //     return Text(
                                    //       ques.toString(),
                                    //       style:
                                    //           TextStyle(color: Colors.white),
                                    //     );
                                    //   },
                                    //   itemCount: ques.length,
                                    // )
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: _toggleListening,
                                    child: Icon(
                                      size: 35,
                                      _isListening == false
                                          ? Icons.mic
                                          : Icons.stop,
                                      color: _isListening == false
                                          ? Colors.white
                                          : Colors.red,
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              )),
                          const Gap(20),
                          Visibility(
                            visible: words == '' ? false : true,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 200,
                              ),
                              constraints: const BoxConstraints(minHeight: 50),
                              width: 1000,
                              decoration: const BoxDecoration(
                                  color: StyleConstants.colorTitle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(words,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () async {
                                        if (_isListening == true) {
                                          Utils().showSnackBar(context,
                                              'Please turn off the recording first');
                                          return;
                                        }
                                        questionAnswer.add(Message(
                                            message: words, by: 'patient'));
                                        setState(() {});
                                        final ap =
                                            Provider.of<AppwriteProvider>(
                                                context,
                                                listen: false);
                                        ap.upDateHistory(
                                            ap.questions.last, words);
                                        final string = words;
                                        words = '';
                                        if (ques.length == 4) {
                                          questionAnswer.add(Message(
                                              message:
                                                  'Processing the diagnosis',
                                              by: 'medeasy'));
                                          Utils().showSnackBar(context,
                                              'Processing the diagnosis');
                                          setState(() {});
                                          Navigator.pushNamed(context,
                                              RoutesConstants.finalpageRoute);
                                          return;
                                        }
                                        await ap.sendAudio(
                                            string, ap.chatHistory);
                                        ques = ap.questions;
                                        questionAnswer.add(Message(
                                            message: ques.last, by: 'medeasy'));
                                        log('api question ${ap.questions.toString()}');
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesConstants.finalpageRoute);
              },
              child: const Text(
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
  }
}

class Message {
  final String message;
  final String by;

  Message({required this.message, required this.by});
}
