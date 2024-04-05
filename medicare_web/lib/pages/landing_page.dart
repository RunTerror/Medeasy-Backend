import 'package:flutter/material.dart';
import 'package:medicare_web/constants/style/style_constants.dart';
import 'package:medicare_web/routes/routes_constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: navItems,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/medical-stethoscope-white.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 58, top: 98),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "USE AI FOR",
                  style: TextStyle(
                    fontSize: 32,
                    color: StyleConstants.colorTitle,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "MORE DEATILED",
                    style: TextStyle(
                      fontSize: 44,
                      color: StyleConstants.colorTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "AND",
                    style: TextStyle(
                      fontSize: 32,
                      color: StyleConstants.colorTitle,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
                const Text(
                  "ACCURATE",
                  style: TextStyle(
                    fontSize: 44,
                    color: StyleConstants.colorTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "MEDICAL ASSISTANCE",
                  style: TextStyle(
                    fontSize: 32,
                    color: StyleConstants.colorTitle,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 30),
                  child: SizedBox(
                      width: 300.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popAndPushNamed(RoutesConstants.personalDetails);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: StyleConstants.colorTitle,
                            foregroundColor:
                                StyleConstants.scaffoldBackgroundColor),
                        child: const Text(
                          "New Patient",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 100),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Existing Patient?",
                        style: TextStyle(
                          fontSize: 18,
                          color: StyleConstants.colorTitle,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 52,
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 30.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: StyleConstants.colorTitle,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                foregroundColor:
                                    StyleConstants.scaffoldBackgroundColor),
                            child: const Text(
                              "How to use?  ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 30.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: StyleConstants.colorTitle,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                foregroundColor:
                                    StyleConstants.scaffoldBackgroundColor),
                            child: const Text(
                              "Learn more  ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "MEDEASY",
                          style: TextStyle(
                            fontSize: 70,
                            color: StyleConstants.colorTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "AI HEALTH ASSISTANAT",
                          style: TextStyle(
                            fontSize: 20,
                            color: StyleConstants.colorTitle,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
