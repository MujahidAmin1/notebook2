import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteTile extends StatelessWidget {
   Note? note;
   int index;
   final VoidCallback onRemove;
   NoteTile({super.key, this.note, required this.index, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 1,
        color: const Color.fromARGB(255, 226, 225, 225),
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    note!.title!,
                    style: const TextStyle(fontSize: 20),
                    ),
                  Text(
                    note!.subtitle!.length >= 40 ? note!.subtitle!.substring(1, 40) : note!.subtitle!,
                    style: const TextStyle(fontSize: 16,),
                    
                    ),
                    
                ],
              ),
              TextButton.icon(

                onPressed: onRemove,
                icon: const Icon(Icons.delete, color: Colors.grey), 
                label: const Text(""),
                )
                
            ],
          ),
        ),
      ),
    );
  }
}