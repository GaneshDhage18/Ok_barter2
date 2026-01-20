import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomNavigationBar_event.dart';
part 'bottomNavigationBar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<BottomNavigationBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}