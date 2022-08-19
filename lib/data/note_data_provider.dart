import 'package:autoclave/note/utils/note_model.dart';

class NoteDataProvider {
  List<NoteModel> _noteList = [];

  Future<List<NoteModel>> getAllNotes() async {
    // Read from DB or make network request etc...
    return Future.delayed(
      Duration(milliseconds: 1000),
      () => _noteList,
    );
  }

  Future<bool> addNote(NoteModel noteModel) async {
    _noteList.add(noteModel);
    return Future.value(true);
  }
}

  //   final Duration delay;

  // WebClient({this.delay = const Duration(milliseconds: 1000)});

  // Future<List<Task>> fetchTodos() async {
  //   return Future.delayed(
  //     delay,
  //     () => _allTodos,
  //   );
  // }

  // Future<bool> postTodos(List<Task> todos) async {
  //   _allTodos = todos;
  //   return Future.value(true);
  // }
// }

