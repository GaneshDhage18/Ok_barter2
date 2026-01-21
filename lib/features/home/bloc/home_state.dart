part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final String selectedCategory;

  const HomeState({required this.selectedCategory});

  @override
  List<Object> get props => [selectedCategory];
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(selectedCategory: "All");
}

final class SelectedCategoryEventState extends HomeState {
  const SelectedCategoryEventState({required super.selectedCategory});
}
