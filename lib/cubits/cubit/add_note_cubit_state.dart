part of 'add_note_cubit_cubit.dart';

abstract class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteCubitLoading extends AddNoteCubitState {}

class AddNoteCubitSuccess extends AddNoteCubitState {}

class AddNoteCubitFailer extends AddNoteCubitState {
  final String errorMessage;
  AddNoteCubitFailer(this.errorMessage);
}
