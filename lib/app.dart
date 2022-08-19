import 'package:autoclave/control/utils/control_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:autoclave/data/note_data_provider.dart';
import 'package:autoclave/data/note_repository.dart';
import 'package:autoclave/main/bloc/main_bloc.dart';
import 'package:autoclave/addnote/add_note.dart';
import 'control/bloc/control_bloc.dart';
import 'control/bloc/control_bloc.dart';
import 'main/main_screen.dart';
import 'note/bloc/note_bloc.dart';
import 'calendar/bloc/calendar_bloc.dart';

class AutoclaveApp extends StatelessWidget {
  const AutoclaveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteRepository = NoteRepository(NoteDataProvider());
    return MaterialApp(
      theme: ThemeData(
        // rgb(32,37,70) rgb(19,24,48)   rgb(227,58,84)  rgb(241,241,241)
        primaryColor: const Color.fromRGBO(200, 100, 100, 1),
        // brightness: Brightness.dark,
        // backgroundColor: Color.fromRGBO(244, 244, 244, 1)
        fontFamily: 'poppins',
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
              fontSize: 36.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          headline2: GoogleFonts.poppins(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          headline3: GoogleFonts.poppins(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          headline4: GoogleFonts.poppins(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          headline5: GoogleFonts.poppins(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          headline6: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(10, 10, 10, 1)),
          bodyText2: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(10, 10, 10, 1)),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromRGBO(72, 74, 126, 1)),
      ),
      title: 'Flutter Calendar',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CalendarBloc(noteRepository),
          ),
          BlocProvider(
            create: (_) => MainBloc(const MainState(selectedT: 0)),
          ),
          BlocProvider(
            create: (_) => NoteBloc(noteRepository),
          ),
          BlocProvider(
            create: (_) => AddNoteBloc(),
          ),
          BlocProvider(
            create: (_) =>
                ControlBloc(const ControlInitial(ControlModel(22, 0))),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
