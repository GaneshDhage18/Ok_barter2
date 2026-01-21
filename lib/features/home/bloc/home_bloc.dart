import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SelectedCategoryEvent>(_onSelecteCategoryEvent);
  }

  _onSelecteCategoryEvent(SelectedCategoryEvent event, emit) {
    emit(SelectedCategoryEventState(selectedCategory: event.category));
  }
}
