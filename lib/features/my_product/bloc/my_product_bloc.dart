import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_product_event.dart';
part 'my_product_state.dart';

class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {
  MyProductBloc() : super(MyProductInitial()) {
    on<MyProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}