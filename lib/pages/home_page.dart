import 'package:flutter/material.dart';
import 'package:note/models/note.dart';
import 'package:note/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleEC = TextEditingController();
  TextEditingController descriptionEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, state, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          Dialog(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: titleEC,
                                    decoration: InputDecoration(
                                        hintText: 'Write your title'),
                                  ),
                                  TextField(
                                    controller: descriptionEC,
                                    decoration: InputDecoration(
                                        hintText: 'Write your description'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        state.addNote(Note(
                                            title: titleEC.text,
                                            description: descriptionEC.text));
                                        setState(() {
                                          titleEC.clear();
                                          descriptionEC.clear();
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Text('Create'))
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });

                //
              }),
          appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            title: Text('Note app'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          body: SafeArea(
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: state.noteList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          titleEC.text = state.noteList[index].title;
                          descriptionEC.text =
                              state.noteList[index].description;
                        });

                        showDialog(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  Dialog(
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: titleEC,
                                            decoration: InputDecoration(
                                                hintText: 'Write your title'),
                                          ),
                                          TextField(
                                            controller: descriptionEC,
                                            decoration: InputDecoration(
                                                hintText:
                                                    'Write your description'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                state.editNote(
                                                    index,
                                                    Note(
                                                        title: titleEC.text,
                                                        description:
                                                            descriptionEC
                                                                .text));

                                                setState(() {
                                                  titleEC.clear();
                                                  descriptionEC.clear();
                                                });

                                                Navigator.pop(context);
                                              },
                                              child: Text('Edit'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(state.noteList[index].title),
                          subtitle: Text(state.noteList[index].description),
                          trailing: IconButton(
                              onPressed: () {
                                state.deleteNote(index);
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  })),
        ),
      );
    });
  }
}
