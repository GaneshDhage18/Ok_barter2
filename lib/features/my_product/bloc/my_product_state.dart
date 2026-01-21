part of 'my_product_bloc.dart';

sealed class MyProductState extends Equatable {
  const MyProductState();
  
  @override
  List<Object> get props => [];
}

final class MyProductInitial extends MyProductState {}