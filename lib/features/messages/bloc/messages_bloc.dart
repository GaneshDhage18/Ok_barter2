import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {

  MessagesBloc() : super(MessagesInitial()) {
    on<SelectedCategoryEvent>(_onSelectedcategoryEvent);
  }

  _onSelectedcategoryEvent(SelectedCategoryEvent event, emit) {

    emit(SelectedCategorySuccessState(selctedIndex: event.index));
  }
}
