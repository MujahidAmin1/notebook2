import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteTile extends StatefulWidget {
   Note? note;
   NoteTile({super.key, this.note});

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.note!.title!),
          Text(widget.note!.subtitle!),
        ],
      ),
    );
  }
}