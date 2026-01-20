part of 'add_Product_bloc.dart';

sealed class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}
//--------------------------------------------------------------------------------------------
/// add image
//--------------------------------------------------------------------------------------------

class PickProductImageEvent extends AddProductEvent {}

/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
/// ✨ remove image
/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class RemoveProductImageEvent extends AddProductEvent {
  final int index;

  const RemoveProductImageEvent(this.index);

  @override
  List<Object> get props => [index];
}

//--------------------------------------------------------------------------------------------
/// add category
//--------------------------------------------------------------------------------------------

class SelectCategoryEvent extends AddProductEvent {
  final String category;

  const SelectCategoryEvent({required this.category});
  @override
  // TODO: implement props
  List<Object> get props => [category];
}

/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
/// ✨ add condition
/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class SelectConditionEvent extends AddProductEvent {
  final String condition;

  const SelectConditionEvent({required this.condition});
  @override
  // TODO: implement props
  List<Object> get props => [condition];
}

/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
/// ✨ add purchase date
/// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// class SelectPurchaseDateEvent extends AddProductEvent {
//   final DateTime date;

//   const SelectPurchaseDateEvent({required this.date});

//   @override
//   List<Object> get props => [date];
// }
