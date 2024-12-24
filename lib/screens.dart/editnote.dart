import 'package:flutter/material.dart';
import 'package:notebook2/provider/note_provider.dart';
import 'package:notebook2/screens.dart/addnote.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';

class EditNote extends StatefulWidget {
  final Note note;
  int? index;
  EditNote({super.key, required this.note, this.index});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
   @override
    void initState(){
      titleController = TextEditingController(text: widget.note.title);
      subtitleController = TextEditingController(text: widget.note.subtitle);
      super.initState();
    }
  @override
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<NoteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Note note = Note(
                      title: titleController.text, 
                      subtitle: subtitleController.text,
                      );
                  data.editNote(widget.index!, note);
                  },
                  child: const Icon(Icons.check)),
            ),
          ],
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
