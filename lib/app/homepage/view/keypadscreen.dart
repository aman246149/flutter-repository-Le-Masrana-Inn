import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practo/app/homepage/view/blocs/otp/otp_bloc.dart';
import 'package:practo/app/homepage/view/otpscreen.dart';

class KeyPad extends StatefulWidget {
  KeyPad({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  List<String> languageslist = ["+91", "+34", "+12", "+43", "+56"];
  String selectedLanguage = "";
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter your mobile number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Container(
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
                                    child: Text(language),
                                    value: language,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 10),
                          child: Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          decoration: InputDecoration(
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
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("By Continuing, you agree to our",
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          Text("Terms and Conditions",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                        ],
                      )),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Color(0xffB4B4BD),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ));
                        BlocProvider.of<OtpBloc>(context).add(
                            SendOtpTrigger(phoneNumber: widget.phoneNumber));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
