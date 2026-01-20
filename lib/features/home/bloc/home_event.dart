part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectedCategoryEvent extends HomeEvent {
  final String category;

  const SelectedCategoryEvent({required this.category});
  @override
  List<Object> get props => [category];
}
