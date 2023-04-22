import 'package:intl/intl.dart';

class UtilService {
  String doubleToString(double value) {
    return value.toString();
  }

  String convertToBRL(double value) {
    NumberFormat numberFormat = NumberFormat("R\$ #,##0.00", "pt_BR");
    return numberFormat.format(value);
  }
}
