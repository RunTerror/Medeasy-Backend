import 'package:flutter/material.dart';
import 'package:medicare_web/constants/style/style_constants.dart';
import 'package:medicare_web/providers/appwriteProvider.dart';
import 'package:provider/provider.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => PersonalDetailsState();
}

class PersonalDetailsState extends State<PersonalDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String dob = '';
  String mobile = '';
  String gender = '';
  String bodyTemperature = '';
  String bloodPressure = '';
  Widget formField(
      {String? fieldText, String? regex, Function(String)? onChanged}) {
    final String _fieldText = fieldText!;
    final String _regex = regex!;

    return Column(children: [
      //SizedBox(height: _height * 0.05),
      TextFormField(
        decoration: InputDecoration(
          labelText: _fieldText,
        ),
        validator: (value) {
          if (value!.isEmpty || !RegExp(_regex).hasMatch(value)) {
            return "Invalid $_fieldText";
          }
          return null;
        },
        onChanged: onChanged,
      ),
    ]);
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
                key: _scaffoldKey,
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
                            text: 'PATIENT',
                          ),
                          TextSpan(
                            text: ' PERSONAL DETAILS',
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
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              formField(
                                fieldText: "Name",
                                regex: r'^[a-zA-Z]+$',
                                onChanged: (value) => name = value,
                              ),
                              formField(
                                fieldText: "DOB",
                                regex: '',
                                onChanged: (value) => dob = value,
                              ),
                              formField(
                                fieldText: "Mobile (10 digits only)",
                                regex: r'^[0-9]{10}$',
                                onChanged: (value) => mobile = value,
                              ),
                              formField(
                                fieldText: "Gender",
                                // regex: r'^[\w]+@([\w-]+\.)+[\w-]{2,5}$',
                                regex: '',
                                onChanged: (value) => gender = value,
                              ),
                              formField(
                                fieldText: "Blood Pressure",
                                regex: '',
                                onChanged: (value) => bloodPressure = value,
                              ),
                              formField(
                                fieldText: "Body Temperature",
                                regex: '',
                                onChanged: (value) => bodyTemperature = value,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call your API here with the stored values
                    // You can access stored values here like: name, age, mobile, emailAddress
                    print('Name: $name');
                    print('Age: $dob');
                    print('Mobile: $mobile');
                    print('Email Address: $gender');
                    // Call your API here with the stored values
                    provider.createDocument(name, dob, gender, mobile,
                        bloodPressure, bodyTemperature, context);
                  }
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
    });
  }
}
