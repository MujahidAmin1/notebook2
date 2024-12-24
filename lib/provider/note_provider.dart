import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  late Box<Note> _noteBox;
  List<Note> _notes = [];
  List<dynamic> _keys = [];
  List<Note> get notes => _notes;


  Future<void> initialize() async {
    _noteBox = await Hive.openBox<Note>('noteBox');
    _notes = _noteBox.values.toList();
    _keys = _noteBox.keys.toList();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _noteBox.add(note);
    _notes.add(note);         // Add it to the local list for immediate UI update
    notifyListeners();
  }
  Future<void> editNote(int index, Note note) async {
    await _noteBox.putAt(index, note);
    _notes[index] = note;
    notifyListeners();

  }
  Future<void> deleteNote(int index) async {
   await _noteBox.deleteAt(index);
   _notes.removeAt(index);
   notifyListeners(); 
  }
}
