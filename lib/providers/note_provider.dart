import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note/components/config/var.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {
  NoteProvider() {
    getList();
  }

  List<Note> noteList = [];

  getList() {
    var listMap = jsonDecode(storage.read('notes')) as List;
    List<Note> noteListFromListMap =
        listMap.map((map) => Note.fromMap(map)).toList();
    noteList.addAll(noteListFromListMap);
  }

  addNote(Note note) {
    noteList.add(note);
    save(noteList);
    notifyListeners();
  }

  deleteNote(int index) {
    noteList.removeAt(index);
    save(noteList);
    notifyListeners();
  }

  editNote(int index, Note data) {
    noteList[index] = data;
    save(noteList);
    notifyListeners();
  }

  save(List<Note> nl) {
    var listMap = noteList.map((note) => note.toMap()).toList();
    var json = jsonEncode(listMap);
    storage.write('notes', json);
  }
}
