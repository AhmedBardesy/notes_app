

part of 'note_cubit.dart';

abstract class NoteCubitState {}

class NoteCubitInitial extends NoteCubitState {}

class NoteCubitLoading extends NoteCubitState {}




class NoteCubitFailer extends NoteCubitState {
  final String errorMessage;
  NoteCubitFailer(this.errorMessage);
}
