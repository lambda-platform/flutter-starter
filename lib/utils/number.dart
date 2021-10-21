import 'package:intl/intl.dart';

final formatter = new NumberFormat("#,###");
final Formatter = new NumberFormat("#.#");
final FormatterInt = new NumberFormat("#.#");
final formatterFloat = new NumberFormat("#,###.#");

String number(dynamic value){
  if(value != null){
    if(value.runtimeType == String){
      return formatter.format(int.parse(value));
    }
    return formatter.format(value);
  } else {
    return "0";
  }

}
String numberInt(dynamic value){
  if(value != null){
    if(value.runtimeType == String){
      return FormatterInt.format(int.parse(value));
    }
    return FormatterInt.format(value);
  } else {
    return "0";
  }

}
String huvi(dynamic value){
  if(value != null){
    if(value.runtimeType == String){

      return Formatter.format(int.parse(value));
    }
    return Formatter.format(value);
  } else {
    return "0";
  }

}

String float(dynamic value){
  if(value != null) {
    if (value.runtimeType == String) {
      return formatterFloat.format(double.parse(value));
    }
    return formatterFloat.format(value);
  } else {
    return "0";
  }
}
double getDouble(value){
  if(value != null) {
    if (value.runtimeType == String) {
      return double.parse(value);
      return 0.0;
    }
    if (value.runtimeType == double) {
      return value;
    } if (value.runtimeType == int) {
      return double.parse(value.toString());
      return 0.0;

    }
    return 0.0;

  } else {
    return 0.0;
  }
}