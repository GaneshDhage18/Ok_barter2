part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

final class MessagesInitial extends MessagesState {}

class SelectedCategoryStates extends MessagesState {}

class SelectedCategoryLoadingState extends SelectedCategoryStates {}

class SelectedCategorySuccessState extends SelectedCategoryStates {
  final int selctedIndex;

  SelectedCategorySuccessState({required this.selctedIndex});

  @override
  List<Object> get props => [selctedIndex];
}

class SelectedCategoryErrorState extends SelectedCategoryStates {
  final String error;
  final DateTime _dateTime = DateTime.now();
  SelectedCategoryErrorState({required this.error});
  @override
  List<Object> get props => [error, _dateTime];
}
