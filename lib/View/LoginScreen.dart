import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets/Button.dart';
import 'widgets/Input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
        ),
        Input_field(
          text: "Email",
          validator: (p0) {
            if (RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(p0!)) {
              return null;
            }

            return "Invalid Email Address";
          },
        ),
        SizedBox(
          height: width * 0.05,
        ),
        Input_field(
            validator: (p0) {
              if (p0!.length >= 6) {
                return null;
              }

              return "Invalid Password";
            },
            obscure: true,
            text: "Password"),
        const Spacer(),
        Button(text: "Login", press: () {}, color: AppColor.primary),
        SizedBox(
          height: width * 0.1,
        ),
      ],
    );
  }
}
