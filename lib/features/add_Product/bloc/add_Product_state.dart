part of 'add_Product_bloc.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}

//--------------------------------------------------------------------------------------------
/// add product select images
//--------------------------------------------------------------------------------------------

class AddProductImageButonStates extends AddProductState {}

class AddproductImageLodingState extends AddProductImageButonStates {}

class AddproductImageSuccessState extends AddProductImageButonStates {
  final List<String> images;

  AddproductImageSuccessState({required this.images});
  @override
  // TODO: implement props
  List<Object> get props => [images];
}

class AddproductImageErrorState extends AddProductImageButonStates {
  final String error;

  AddproductImageErrorState({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

//--------------------------------------------------------------------------------------------
/// add category
//--------------------------------------------------------------------------------------------

class AddProductCategoryinitialState extends AddProductState {}

class AddProductCategoryState extends AddProductCategoryinitialState {
  final String category;

  AddProductCategoryState(this.category);

  @override
  List<Object> get props => [category];
}

/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
/// ✨ add condiiton
/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class AddProductCondninitialState extends AddProductState {}

class AddProductCondnState extends AddProductCondninitialState {
  final String condition;

  AddProductCondnState({required this.condition});
  @override
  // TODO: implement props
  List<Object> get props => [condition];
}

/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
/// ✨ add date
/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// class AddProductPurchaseDateState extends AddProductState {
//   final DateTime date;

//   const AddProductPurchaseDateState(this.date);

//   @override
//   List<Object> get props => [date];
// }
