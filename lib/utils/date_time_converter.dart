import 'package:intl/intl.dart';

class DateTimeConverter{

  String dateTimeConvert(int? unixTIme){
    print(unixTIme);
    var date = DateTime.fromMillisecondsSinceEpoch(unixTIme! * 1000);
    var d12 = DateFormat('EEE, yyyy').format(date);
    return d12;
  }

  String convertTime(int? unixTIme){
    print(unixTIme);
    var date = DateTime.fromMillisecondsSinceEpoch(unixTIme! * 1000);
    var d12 = DateFormat('d').format(date);
    return d12;
  }

}