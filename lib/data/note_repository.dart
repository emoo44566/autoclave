import 'package:autoclave/calendar/utils/calendar_utils.dart';
import 'package:autoclave/data/note_data_provider.dart';
import 'package:autoclave/note/utils/note_model.dart';

class NoteRepository {
  final NoteDataProvider noteDataProvider;

  NoteRepository(this.noteDataProvider);

  Future<List<NoteModel>> getAllNotes() async {
    // final List<NoteModel> noteList = await noteDataProvider.getAllNotes();

    //final Data filteredData = _filterData(dataSetA, dataSetB);
    return noteDataProvider.getAllNotes();
  }

  addNote(NoteModel noteModel) {
    noteDataProvider.addNote(noteModel);
  }

  Future<List<int>> getNotCountList(int year, int month) async {
    final List<NoteModel> noteList = await noteDataProvider.getAllNotes();

    //final Data filteredData = _filterData(dataSetA, dataSetB);
    var list = List<int>.filled(CalendarUtils.getDaysInMonth(year, month), 0);
    var noteCountList =
        List<int>.filled(CalendarUtils.getDaysInMonth(year, month), 0);
    noteList
        .where((element) =>
            element.date.year == year && element.date.month == month)
        .forEach((element) {
      noteCountList[element.date.day - 1]++;
    });
    return noteCountList;
  }
}

// class TodoRepository {
//   final WebClient client;
//   final BehaviorSubject<List<Task>> _subject;
//   bool _loaded = false;

//   TodoRepository(this.client, {List<Task> seed})
//       : _subject = BehaviorSubject<List<Task>>.seeded(seed ?? []);

//   Stream<List<Task>> get todos {
//     if (!_loaded) _loadTodos();

//     return _subject.stream;
//   }

//   List<Task> get snapshot => _subject.value ?? [];

//   void _loadTodos() {
//     _loaded = true;

//     client.fetchTodos().then((todos) {
//       _subject.add([..._subject?.value, ...todos]);
//     });
//   }

//   Future<void> addNewTodo(Task todo) async {
//     final newTodos = [..._subject.value, todo];
//     _subject.add([..._subject.value, todo]);
//     await client.postTodos(newTodos);
//   }

//   Future<void> deleteTodo(Task todo) async {
//     final newTodos = _subject.value.where((t) => t.description != todo.description);
//     _subject.add(newTodos);
//     await client.postTodos(newTodos);
//   }

//   Future<void> updateTodo(Task todo) async {
//     final todos = _subject.value;
//     final todoToUpdate = todos.firstWhere((t) => t.description == todo.description);
//     final index = todos.indexOf(todoToUpdate);
//     todos.replaceRange(index, index + 1, [todo]);
//     _subject.add(todos);
//     await client.postTodos(todos);
//   }
// }
