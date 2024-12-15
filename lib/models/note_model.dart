import 'package:hive/hive.dart';
part 'note_model.g.dart';


@HiveType(typeId: 0)
class Note extends HiveObject{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? subtitle; 

  @HiveField(2)
  String? note;
  
  @HiveField(3)
  DateTime? date;
  
  Note({required this.title, required this.subtitle, this.note, this.date});
}