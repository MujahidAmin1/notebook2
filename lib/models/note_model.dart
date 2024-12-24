import 'package:hive/hive.dart';
part 'note_model.g.dart';


@HiveType(typeId: 0)
class Note extends HiveObject{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? subtitle; 
  
  @HiveField(2)
  DateTime? date;
  
  Note({required this.title, required this.subtitle, this.date});
  Note copyWith({String? title, String? subtitle, DateTime? date}){
    return Note(
      title: title ?? this.subtitle, 
      subtitle: subtitle ?? this.subtitle,
      date: date
      );
  }
  
}