import 'package:intl/intl.dart';

class Note {
  int id;
  String title;
  String content;
  String imagePath;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.imagePath});
  int get _id => id;
  String get _title => title;
  String get _content => content;
  String get _imagePath => imagePath;
  String get date {
    final date = DateTime.fromMicrosecondsSinceEpoch(id);
    return DateFormat('EEE h:mm a, dd/MM/yyyy').format(date);
  }
}
