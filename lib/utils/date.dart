import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:simple_moment/simple_moment.dart';
String getDate(String date){
  if(date == null && date == ""){
    return "";
  }
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('yyyy-MM-dd');

  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(dateTime);
}
String yearFirst(String date){
  if(date == null && date == ""){
    return "";
  }
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  var formatter = new DateFormat('yyyy');

  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(dateTime)+"-01-01";
}
String getDateString(DateTime dateTime){

  var formatter = new DateFormat('yyyy-MM-dd');



  return formatter.format(dateTime);
}
DateTime gDate(String date){

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
 // var formatter = new DateFormat('yy.MM.dd');

  DateTime dateTime  = dateFormat.parse(date);

  return dateTime;
}
String getTime(String date){
  if(date == null && date == ""){
    return "";
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('HH:mm');

  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(dateTime);
}
String dateKorea(String date){
  if(date == null && date == ""){
    return "";
  }
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('yy년 MM월 dd일');

  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(dateTime);
}
String monthKorea(String date){
  if(date == null && date == ""){
    return "";
  }
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('yy년 MM월');

  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(dateTime);
}

String date(DateTime date){

  var formatter = new DateFormat('yyyy-MM-dd');



  return formatter.format(date);
}
String dateTime(DateTime date){
  if(date == null && date == ""){
    return "";
  }
//  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('yyyy-MM-dd HH:mm');

  // DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(date);
}
String time(DateTime date){
  if(date == null && date == ""){
    return "";
  }
  // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  var formatter = new DateFormat('HH:mm');

//  DateTime dateTime  = dateFormat.parse(date);

  return formatter.format(date);
}

String today(){

  var date = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

String prevMonthDate(){
  var date = new DateTime.now();
  var prevMonth = Jiffy(date)..subtract(months: 3);

  return prevMonth.format('yyyy-MM-dd');
}

String prevDayDate(int day){
  var date = new DateTime.now();
  var prevMonth = Jiffy(date)..subtract(days: day);
  return prevMonth.format('yyyy-MM-dd HH:mm:ss');
}