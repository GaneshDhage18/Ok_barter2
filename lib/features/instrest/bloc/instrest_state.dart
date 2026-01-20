import 'package:equatable/equatable.dart';

sealed class InstrestState extends Equatable {
  const InstrestState();

  @override
  List<Object> get props => [];
}

final class InstrestInitial extends InstrestState {}

class InstrestSelectionUpdated extends InstrestState {
  final List<String> selectedCategories;

  const InstrestSelectionUpdated({required this.selectedCategories});

  @override
  List<Object> get props => [selectedCategories];
}

class SaveInstrestEventStates extends InstrestState {}

class SaveInstrestEventLoadingState extends SaveInstrestEventStates {}

class SaveInstrestEventSuccessState extends SaveInstrestEventStates {}

class SaveInstrestEventErrorState extends SaveInstrestEventStates {
  final String error;
  final DateTime _dateTime = DateTime.now();
  SaveInstrestEventErrorState({required this.error});
  @override
  List<Object> get props => [error, _dateTime];
}
