import 'package:flutter/material.dart';
import 'package:notebook2/provider/note_provider.dart';
import 'package:notebook2/screens.dart/addnote.dart';
import 'package:notebook2/widgets/note_tile.dart';
import 'package:provider/provider.dart';
import 'addnote.dart';
import '../models/note_model.dart';
import 'editnote.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: data.notes.isEmpty
          ? const Center(child: Text("No note available"))
          : ListView.builder(
              itemCount: data.notes.length,
              itemBuilder: (context, index) {
                return NoteTile(
                  index: index,
                  note: data.notes[index],
                  onRemove: () => data.deleteNote(index),
                );
              },
            ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.grey,
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context){
              return AddNote();
            },
            ),);
      },
      child: const Icon(Icons.add, color: Colors.black,),
      ),        
    );
  }
}
