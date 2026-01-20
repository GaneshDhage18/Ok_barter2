import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:okbarter2/features/instrest/bloc/instrest_state.dart';
part 'instrest_event.dart';

class InstrestBloc extends Bloc<InstrestEvent, InstrestState> {
  List<String> updatedList = [];

  InstrestBloc()
    : super(const InstrestSelectionUpdated(selectedCategories: [])) {
    on<ChooseInstrestEvent>(_onChooseInstrest);
  }

  void _onChooseInstrest(
    ChooseInstrestEvent event,
    Emitter<InstrestState> emit,
  ) {
    if (updatedList.contains(event.category)) {
      updatedList.remove(event.category);
    } else {
      updatedList.add(event.category);
    }

    emit(
      InstrestSelectionUpdated(
        selectedCategories: List<String>.from(updatedList),
      ),
    );
  }
}
