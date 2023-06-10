import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UtilService {
  String doubleToString(double value) {
    return value.toString();
  }

  String convertToBRL(double value) {
    NumberFormat numberFormat = NumberFormat("R\$ #,##0.00", "pt_BR");
    return numberFormat.format(value);
  }

  String formatterDate(String date) {
    DateFormat formatter = DateFormat("dd/MM/yy HH:mm");
    return formatter.format(DateTime.parse(date));
  }

  double screenDeviceWidth(
      double widthMobile, double widthFull, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).size.width < 800) {
      return width / widthMobile;
    } else {
      return width / widthFull;
    }
  }

  double screenDeviceHeight(
      double heightMobile, double heightFull, BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).size.width < 800) {
      return width / heightMobile;
    } else {
      return width / heightFull;
    }
  }

  TextInputFormatter maskText(String value) {
    return MaskTextInputFormatter(
      mask: "##.##",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }
}
