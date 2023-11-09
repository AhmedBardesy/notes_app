
import 'package:bloc/bloc.dart';
import 'package:app11_nots/constants.dart';
import 'package:app11_nots/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'note_cubit_state.dart';
class NoteCubit extends Cubit<NoteCubitState> {
  NoteCubit() : super(NoteCubitInitial());
List<NoteModel>? notes;
 fetchAllNotes()  {
  
      var notesbox = Hive.box<NoteModel>(kNotesBox);
    notes=notesbox.values.toList();
      
      print('Notes displayed');
 
   
    }
    }
  