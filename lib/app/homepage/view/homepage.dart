import 'package:flutter/material.dart';
import 'package:practo/app/homepage/view/keypadscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> languageslist = ["+91", "+34", "+12", "+43", "+56"];
  String selectedLanguage = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:
                    Image.asset(fit: BoxFit.cover, "assets/images/practo.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lets get started! Enter your mobile number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: SizedBox(
                                width: 60,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: const Text('+91'),
                                    value: selectedLanguage.isEmpty
                                        ? null
                                        : selectedLanguage,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedLanguage = newValue!;
                                      });
                                    },
                                    items: languageslist.map((language) {
                                      return DropdownMenuItem(
                                        value: language,
                                        child: Text(language),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, right: 10),
                              child: Container(
                                height: 25,
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                                child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (String text) {
                                if (text.length >= 10) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            KeyPad(phoneNumber: text),
                                      ));
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14)),
                            ))
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Trouble Signining in?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline)))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
