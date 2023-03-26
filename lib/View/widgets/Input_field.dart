import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qstl_test/constants.dart';

class Input_field extends StatefulWidget {
  Input_field(
      {Key? key,
      required this.text,
      this.obscure = false,
      this.isIcon = false,
      required this.validator,
      this.border = false})
      : super(key: key);

  final String text;
  final bool obscure;
  final bool isIcon;

  final bool border;

  final String? Function(String?)? validator;

  @override
  State<Input_field> createState() => _Input_fieldState();
}

class _Input_fieldState extends State<Input_field> {
  TextEditingController myController = TextEditingController();

  bool havingError = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        padding: widget.isIcon
            ? null
            : const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        // height: height / 12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: havingError ? Border.all(color: AppColor.primary) : null,
          boxShadow: widget.border
              ? null
              : [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3))
                ],
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            if (widget.validator!(value) == null) {
              if (havingError) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    setState(() {
                      havingError = false;
                    });
                  },
                );
              }
              return null;
            } else {
              if (!havingError) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    setState(() {
                      havingError = true;
                    });
                  },
                );
              }
            }
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          controller: myController,
          obscureText: widget.obscure,
          obscuringCharacter: '*',
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            errorText: "",
            errorMaxLines: 1,
            errorStyle: TextStyle(fontSize: 0),
            contentPadding:
                EdgeInsets.only(top: width * 0.01, bottom: width * 0.01),
            isDense: true,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            border: InputBorder.none,
            labelText: widget.text,
          ),
        ),
      ),
    );
  }
}
