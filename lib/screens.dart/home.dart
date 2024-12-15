import 'package:flutter/material.dart';
import 'package:notebook2/main.dart';
import 'package:notebook2/provider/note_provider.dart';
import 'package:notebook2/widgets/note_tile.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: data.notes.isEmpty
          ? const Center(child: Text("No notes available"))
          : ListView.builder(
              itemCount: data.notes.length,
              itemBuilder: (context, index) {
                return NoteTile(
                  note: data.notes[index],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Note"),
                content: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                    TextField(
                      controller: subtitleController,
                      decoration: const InputDecoration(labelText: "Subtitle"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Note note = Note(
                          title: titleController.text,
                          subtitle: subtitleController.text,
                        );
                        data.addNote(note); // Add the note via provider
                        Navigator.pop(context);
                        titleController.clear();
                        subtitleController.clear();
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
