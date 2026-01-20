import 'dart:io';

import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/add_Product/bloc/add_Product_bloc.dart';
import 'package:okbarter2/features/add_Product/components/lists.dart';

import 'package:okbarter2/features/add_Product/components/textformfeild.dart';



class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController desccontroller = TextEditingController();
  final TextEditingController copmanycontrollr = TextEditingController();
  final TextEditingController estimatedcontrollr = TextEditingController();
  final TextEditingController purchaseDateController = TextEditingController();

  final bool _submitted = false;

  bool isavailbe = false;
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    desccontroller.dispose();
    copmanycontrollr.dispose();
    estimatedcontrollr.dispose();
    purchaseDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddProductBloc>();

    return Scaffold(
      backgroundColor: Colours.primary,
      body: Form(
        autovalidateMode: _submitted
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        key: _formkey,
        child: Column(
          children: [
            20.heightBox,

            /// Header
            Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white, size: 28.w),
                  30.widthBox,
                  Text(
                    "Add product for Barter",
                    style: TextStyle(
                      fontFamily: Fonts.sSemiBold,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.heightBox,

                      /// Upload Images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upload Images",
                            style: TextStyle(
                              fontFamily: Fonts.sSemiBold,
                              fontSize: 16.sp,
                              color: Colours.blackfont,
                            ),
                          ),

                          /// Image Validation (listens to bloc)
                          BlocBuilder<AddProductBloc, AddProductState>(
                            buildWhen: (p, c) =>
                                c is AddProductImageButonStates,
                            builder: (context, state) {
                              return FormField(
                                validator: (_) {
                                  final images =
                                      (state is AddproductImageSuccessState)
                                      ? state.images
                                      : [];
                                  return images.isEmpty ? 'required' : null;
                                },
                                builder: (formState) {
                                  return formState.errorText != null
                                      ? Text(
                                          'required',
                                          style: TextStyle(
                                            fontFamily: Fonts.sRegular,
                                            fontSize: 12,
                                            color: Colors.red,
                                          ),
                                        )
                                      : const SizedBox.shrink();
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      12.heightBox,

                      BlocBuilder<AddProductBloc, AddProductState>(
                        buildWhen: (p, c) => c is AddProductImageButonStates,
                        builder: (context, state) {
                          return SizedBox(
                            height: 130,
                            child: () {
                              if (state is AddproductImageLodingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is AddproductImageSuccessState) {
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.images.length + 1,
                                  separatorBuilder: (_, __) => 10.widthBox,
                                  itemBuilder: (context, index) {
                                    if (index == state.images.length) {
                                      return _addImageBox(context);
                                    }

                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          child: Image.file(
                                            File(state.images[index]),
                                            width: 100.w,
                                            height: 110.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: -8,
                                          right: -8,
                                          child: IconButton(
                                            icon: const Icon(Icons.close),
                                            color: Colors.white,
                                            onPressed: () {
                                              context
                                                  .read<AddProductBloc>()
                                                  .add(
                                                    RemoveProductImageEvent(
                                                      index,
                                                    ),
                                                  );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              return _addImageBox(context);
                            }(),
                          );
                        },
                      ),

                      25.heightBox,

                      /// Category
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontFamily: Fonts.sSemiBold,
                              fontSize: 16.sp,
                              color: Colours.blackfont,
                            ),
                          ),
                          FormField(
                            validator: (_) {
                              final category = context
                                  .read<AddProductBloc>()
                                  .selectedCategory;
                              return category == null || category.isEmpty
                                  ? 'required'
                                  : null;
                            },
                            builder: (formState) {
                              return formState.errorText != null
                                  ? Text(
                                      'required',
                                      style: TextStyle(
                                        fontFamily: Fonts.sRegular,
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                      12.heightBox,

                      BlocBuilder<AddProductBloc, AddProductState>(
                        buildWhen: (p, c) => c is AddProductCategoryState,
                        builder: (context, state) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: DropdownButton<String>(
                              value: bloc.selectedCategory,
                              hint: const Text('Category'),
                              underline: const SizedBox(),
                              isExpanded: true,
                              items: categoriesList
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<AddProductBloc>().add(
                                    SelectCategoryEvent(category: value),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),

                      20.heightBox,

                      /// Description
                      Text(
                        "Description",
                        style: TextStyle(
                          fontFamily: Fonts.sSemiBold,
                          fontSize: 16.sp,
                          color: Colours.blackfont,
                        ),
                      ),
                      12.heightBox,

                       CustomTextFormField(
                        isrequired: true,
                        controller: desccontroller,
                        hintText: 'Processor: AMD Ryzen 3 5300U...',
                        maxLines: null,
                      ),

                      20.heightBox,

                      /// Company & Condition
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Company',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Condition',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              isrequired: true,
                              controller: copmanycontrollr,
                              hintText: 'Apple',
                            ),
                          ),
                          12.widthBox,
                          Expanded(
                            child: BlocBuilder<AddProductBloc, AddProductState>(
                              builder: (context, state) {
                                return Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: bloc.selectedCondition,
                                      hint: const Text('Condition'),
                                      isExpanded: true,
                                      items: conditionList
                                          .map(
                                            (item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(item),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          context.read<AddProductBloc>().add(
                                            SelectConditionEvent(
                                              condition: value,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      20.heightBox,

                      /// Purchase Date
                      Text(
                        "Purchase Date",
                        style: TextStyle(
                          fontFamily: Fonts.sSemiBold,
                          fontSize: 16.sp,
                          color: Colours.blackfont,
                        ),
                      ),
                      12.heightBox,

                      CustomTextFormField(
                        controller: purchaseDateController,
                        hintText: 'MM/DD/YYYY',
                        keyboardType: TextInputType.datetime,
                      ),

                      20.heightBox,

                      /// Estimated Cost
                      Text(
                        "Estimated Cost",
                        style: TextStyle(
                          fontFamily: Fonts.sSemiBold,
                          fontSize: 16.sp,
                          color: Colours.blackfont,
                        ),
                      ),
                      12.heightBox,

                      CustomTextFormField(
                        isrequired: true,
                        controller: estimatedcontrollr,
                        hintText: '12000',
                        keyboardType: TextInputType.number,
                      ),

                      20.heightBox,

                      /// Bill available
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bill available',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Switch(
                            activeTrackColor: Colours.primary,
                            value: isavailbe,
                            onChanged: (value) {
                              setState(() {
                                isavailbe = value;
                              });
                            },
                          ),
                        ],
                      ),

                      20.heightBox,

                      /// Submit
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colours.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (!_formkey.currentState!.validate()) {
                              return; // stop if any field is invalid
                            }

                            goRouter.go("/productaddedsuccess");
                          },
                          child: Text(
                            "Add Product",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.sSemiBold,
                            ),
                          ),
                        ),
                      ),

                      100.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _addImageBox(BuildContext context) {
  return InkWell(
    onTap: () {
      context.read<AddProductBloc>().add(PickProductImageEvent());
    },
    child: Container(
      width: 100.w,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colours.primary,
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    ),
  );
}
