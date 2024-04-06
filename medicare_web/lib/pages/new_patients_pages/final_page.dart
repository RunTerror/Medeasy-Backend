import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({
    super.key,
  });

  @override
  State<FinalPage> createState() => FinalPageState();
}

class FinalPageState extends State<FinalPage> {
  Widget widgt = Container();
  final String name = 'name';
  final String age = 'age';
  final String id = 'id';
  final String bp = '25';
  final String temperature = '99C';
  List<String> symptoms = [
    'Fever',
    'headache',
    'ulcer',
    'loose motion',
    'malaria',
    'Dengue'
  ];
  final String gender = 'Gender';
  final String blood = 'blood';
  final String height = 'height';
  final String weight = 'weight';
  final String lastupdate = 'last update';
  final String contact = 'contact';
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 235, 237),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'PATIENT',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: color)),
                TextSpan(
                    text: ' REPORT',
                    style: TextStyle(
                        fontSize: 30,
                        color: color,
                        fontWeight: FontWeight.w100)),
              ])),
              Gap(height / 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 160,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(fontSize: 30),
                            ),
                            const Gap(5),
                            Text('Patient ID: $id'),
                            Text(
                              'Age: $age',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 135, 134, 134)),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Container(
                        height: 210,
                        width: 400,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: color,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Gap(5),
                            Text('GENDER:  $gender'),
                            Text('BLOOD:  $blood'),
                            Text('HEIGHT:  $height'),
                            Text('WEIGHT:  $weight'),
                            Text('CONTACT:  $contact'),
                            Text('LAST UPDATE:  $lastupdate')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: width - 800,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    height: 350,
                    constraints: const BoxConstraints(minHeight: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Symptoms',
                          style: TextStyle(
                              fontSize: 25,
                              color: color,
                              fontWeight: FontWeight.w600),
                        ),
                        const Gap(10),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            itemBuilder: (context, index) {
                              return Text('${index + 1}. ${symptoms[index]}');
                            },
                            itemCount: symptoms.length,
                          ),
                        ),
                        const Text(
                          'Vital Signs',
                          style: TextStyle(
                              fontSize: 25,
                              color: color,
                              fontWeight: FontWeight.w600),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/heart.png',
                                  height: 50,
                                ),
                                const Text('Blood pressure'),
                                Text(
                                  bp,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/bt2.png',
                                  height: 50,
                                ),
                                const Text('Body Temperature'),
                                Text(
                                  temperature,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: width - 390,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'OLD Reports',
                      style: TextStyle(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/report.png',
                          height: 60,
                        ),
                        Image.asset(
                          'assets/images/report.png',
                          height: 60,
                        ),
                        Image.asset(
                          'assets/images/report.png',
                          height: 60,
                        ),
                      ],
                    ),
                    const Gap(30),
                    const Text(
                      'Suggested Test Reports',
                      style: TextStyle(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/report.png',
                          height: 60,
                        ),
                        const Text(
                          'CT SCAN',
                          style: TextStyle(
                              color: color,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                        const Gap(10),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/report.png',
                          height: 60,
                        ),
                        const Text(
                          'Blood Test',
                          style: TextStyle(
                              color: color,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                        const Gap(10),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: width - 390,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Diagnosis',
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    const Gap(10),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        width: width - 500,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 231, 235, 237),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            const Text(
                              'Phase 1',
                              style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widgt = Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 30),
                                    width: width - 600,
                                    decoration: const BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: WordByWordAnimation(
                                        text:
                                            'athiasdf alkdaslfkda afdjlasdf  alfdalkdf l alfkdasdlf lafdlkadsf  alfdkladsf afld aldskflads falfdladfladsf asdlf laksdf adlf '),
                                  );
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                    color: color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Text(
                                  'Generate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const Gap(10),
                            widgt
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const color = Color(0XFF1C2932);

class WordByWordAnimation extends StatefulWidget {
  final String text;
  final Duration wordDuration;

  const WordByWordAnimation({
    Key? key,
    required this.text,
    this.wordDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordByWordAnimationState createState() => _WordByWordAnimationState();
}

class _WordByWordAnimationState extends State<WordByWordAnimation> {
  late List<String> words;
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    words = widget.text.split(' ');
    startAnimation();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startAnimation() {
    timer = Timer.periodic(widget.wordDuration, (Timer timer) {
      if (currentIndex < words.length) {
        setState(() {
          currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      words.take(currentIndex).join(' '),
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
