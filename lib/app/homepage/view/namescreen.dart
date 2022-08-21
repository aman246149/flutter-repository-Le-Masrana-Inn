import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practo/app/homepage/view/blocs/register/register_bloc.dart';
import 'package:practo/app/homepage/view/genderpage.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF2A3286),
                  const Color(0xFF2A3286),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 18, right: 18, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  "Hi",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "What's your name?",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Spacer(),
                TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Enter Full Name",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.4), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.4), width: 2)),
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                        "Receive relevant offers and promotional \ncommunication from practo",
                        style: TextStyle(color: Colors.white, fontSize: 16))
                  ],
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Color(0xff6A70AA),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenderPage(),
                          ));
                      BlocProvider.of<RegisterBloc>(context, listen: false)
                          .name = controller.text;
                    } else {
                      controller.text = "please enter your name";
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
