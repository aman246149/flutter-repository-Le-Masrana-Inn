import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:practo/app/homepage/view/blocs/login/login_bloc.dart';
import 'package:practo/app/homepage/view/blocs/otp/otp_bloc.dart';
import 'package:practo/app/homepage/view/namescreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> languageslist = ["+91", "+34", "+12", "+43", "+56"];
  String selectedLanguage = "";
  TextEditingController firstcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccessState) {
              print(state.otp);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 500),
                content: Text(state.otp),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 2,
                    right: 20,
                    left: 20),
              ));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Enter the 6-digit OTP sent to",
                          style: TextStyle(fontSize: 18)),
                      Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        borderColor: Colors.black,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        autoFocus: true,
                        focusedBorderColor: Colors.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          print(verificationCode);
                        }, // end onSubmit
                        handleControllers:
                            (List<TextEditingController?> contoller) {
                          if (state is OtpSuccessState) {
                            contoller[0]!.text = 1.toString();
                            contoller[1]!.text = 2.toString();
                            contoller[2]!.text = 3.toString();
                            contoller[3]!.text = 4.toString();
                            contoller[4]!.text = 5.toString();
                            contoller[5]!.text = 6.toString();
                            BlocProvider.of<LoginBloc>(context, listen: false)
                                .add(LoginOTPevent(
                                    phoneNumber: widget.phoneNumber,
                                    otp: "123456"));
                          }
                        },
                      ),
                      const SizedBox(
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
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: const Color(0xffB4B4BD),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NameScreen(),
                                ));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
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
            );
          },
        ),
      ),
    );
  }
}
