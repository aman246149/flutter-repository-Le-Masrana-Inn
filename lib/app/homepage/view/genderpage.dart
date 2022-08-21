import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:practo/app/homepage/view/blocs/register/register_bloc.dart';
import 'package:practo/app/homepage/view/emailpage.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);
  
  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
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
            padding:
                const EdgeInsets.only(top: 20.0, left: 0, right: 0, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Center(
                  child: Text(
                    "STEP 1/3",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Which gender do you \nidentify with?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(
                    child: GroupButton(
                      buttonBuilder: (bool selected, String value, context) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: selected ? Colors.white : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: selected ? Color(0XFF2A3286) : null,
                              border: Border.all(width: 1, color: Colors.grey)),
                        );
                      },
                      isRadio: false,
                      onSelected: (String data, int index, bool isSelected) {
                        print('$index button is selected');
                         BlocProvider.of<RegisterBloc>(context, listen: false)
                          .gender = data;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailScreen()));
                      },
                      buttons: [
                        "Male",
                        "Female",
                        "Other",
                      ],
                      options: GroupButtonOptions(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
