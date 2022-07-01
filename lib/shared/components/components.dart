import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFormFiled({
  required String labelText,
  IconData? suffix,
  Function? showPassword,
  required TextEditingController controller,
  required TextInputType textInputType,
  FormFieldValidator<String>? validate,
  bool isPassword = false,
}) =>
    TextFormField(
      enabled: true,
      controller: controller,
      onTap: () {},
      keyboardType: textInputType,
      onFieldSubmitted: (value) {},
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFECECEC),
          labelText: '$labelText',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
              onPressed: () {
                showPassword!();
              },
              icon: Icon(suffix))),
    );

void showToast({required String message, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(states),
        textColor: Colors.white,
        fontSize: 12.0);

enum ToastStates { SUCCESS, ERROR, WARING }

Color choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARING:
      color = Colors.amber;
      break;
  }

  return color;
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });
