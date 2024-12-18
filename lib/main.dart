import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notebook2/models/note_model.dart';
import 'package:notebook2/provider/note_provider.dart';
import 'package:notebook2/screens.dart/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('noteBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NoteProvider()..initialize(), // Only initialize here
        ),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    ),
  );
}


