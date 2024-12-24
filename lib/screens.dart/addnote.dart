import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notebook2/provider/note_provider.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';

late TextEditingController titleController;
late TextEditingController subtitleController;
class AddNote extends StatefulWidget {
  final Note? note;
  const AddNote({super.key, this.note});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
    @override
    void initState(){
      titleController = TextEditingController();
      subtitleController = TextEditingController();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
  
    var data = Provider.of<NoteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          title:  Row(
            children: [
            const Text("Add Notes"),
             const SizedBox(width: 220),
            GestureDetector(
              onTap: (){
                 Note note = Note(
                  title: titleController.text, 
                  subtitle: subtitleController.text,
                  );
                  data.addNote(note);
                  Navigator.pop(context);
              },
              child: const Icon(Icons.check),
              ),
          ]),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextField(
                cursorColor: Colors.grey,
                maxLines: 1,
                decoration: const InputDecoration(
                  focusColor: Colors.grey,
                  hintText: 'Title',
                  contentPadding: EdgeInsets.only(left: 17),
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 23),
                controller: titleController,
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.multiline,
                controller: subtitleController,
                maxLines: null,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 17),
                  hintText: 'notes',
                  hintStyle: TextStyle(fontSize: 20),
                  focusColor: Colors.grey,
                  border: InputBorder.none,
                  
                ),
              ),
            ],
          ),
        ));
  }
}
