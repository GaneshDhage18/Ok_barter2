import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'Account_event.dart';
part 'Account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}