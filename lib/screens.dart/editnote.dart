import 'package:flutter/material.dart';
import 'package:notebook2/screens.dart/addnote.dart';
import '../models/note_model.dart';

class EditNote extends StatelessWidget {
  Note note;
  EditNote({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    Note _note;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextField(
        controller: titleController,
      ),
        TextField(
          controller: subtitleController,
          
        ),
        ],
      )
    );
  }
}