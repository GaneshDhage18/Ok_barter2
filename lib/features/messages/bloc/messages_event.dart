part of 'messages_bloc.dart';

sealed class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class SelectedCategoryEvent extends MessagesEvent {
  final int index;

  const SelectedCategoryEvent({required this.index});

  @override
  List<Object> get props => [index];
}
