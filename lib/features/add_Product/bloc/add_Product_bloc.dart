import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';


part 'add_Product_event.dart';
part 'add_Product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ImagePicker imagePicker = ImagePicker();

  String? selectedCategory;
  String? selectedCondition;
  DateTime? purchaseDate; // ✅ FIXED typo
  final List<String> _images = [];

  AddProductBloc() : super(AddProductInitial()) {
    on<PickProductImageEvent>(_addProductImage);
    on<SelectCategoryEvent>(_selectProductCategory);
    on<RemoveProductImageEvent>(_removeProductImage);
    on<SelectConditionEvent>(_addProductCondition);
    // on<SelectPurchaseDateEvent>(_selectPurchaseDateEvent);
  }

  _addProductImage(PickProductImageEvent event, emit) async {
    try {
      emit(AddproductImageLodingState());

      final List<XFile> pickedImages = await imagePicker.pickMultiImage();

      if (pickedImages.isEmpty) {
        emit(AddproductImageSuccessState(images: _images));
        return;
      }

      for (final image in pickedImages) {
        if (!_images.contains(image.path)) {
          _images.add(image.path);
        }
      }

      emit(AddproductImageSuccessState(images: List.from(_images)));
    } catch (e) {
      emit(AddproductImageErrorState(error: e.toString()));
    }
  }

  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  /// ✨ remove product image
  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  _removeProductImage(RemoveProductImageEvent event, emit) {
    if (event.index < 0 || event.index >= _images.length) return;
    _images.removeAt(event.index);
    emit(AddproductImageSuccessState(images: List.from(_images)));
  }

  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  /// ✨ add category
  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  _selectProductCategory(SelectCategoryEvent event, emit) {
    selectedCategory = event.category;
    emit(AddProductCategoryState(event.category));
  }

  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  /// ✨ add condition
  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  _addProductCondition(SelectConditionEvent event, emit) {
    selectedCondition = event.condition;
    emit(AddProductCondnState(condition: event.condition));
  }

  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  /// ✨ select purchase date
  /// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // _selectPurchaseDateEvent(SelectPurchaseDateEvent event, emit) {
  //   purchaseDate = event.date;
  //   emit(AddProductPurchaseDateState(event.date));
  // }
}
