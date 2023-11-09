import 'package:app11_nots/constants.dart';
import 'package:app11_nots/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) async {
    emit(AddNoteCubitLoading());
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      await notesbox.add(note);
      emit(AddNoteCubitSuccess());
      print('Note added');
    }  catch (e) {
      print('Error ${e.toString()}');
      emit(AddNoteCubitFailer(e.toString()));
    }
    }
  }

