part of 'instrest_bloc.dart';

sealed class InstrestEvent extends Equatable {
  const InstrestEvent();

  @override
  List<Object> get props => [];
}

class ChooseInstrestEvent extends InstrestEvent {
  final String category;

  const ChooseInstrestEvent({required this.category});
  @override
  List<Object> get props => [category];
}

class SaveInstrestEvent extends InstrestEvent {
  final List saveInstrestList;

  const SaveInstrestEvent({required this.saveInstrestList});

  @override
  List<Object> get props => [saveInstrestList];
}
