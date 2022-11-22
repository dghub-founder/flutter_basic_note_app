import 'package:note/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> get() => [
        ChangeNotifierProvider(create: (_) => NoteProvider()),
      ];
}
