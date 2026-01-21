import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/home/bloc/home_bloc.dart';
import 'package:okbarter2/features/home/components/components.dart';
import 'package:okbarter2/features/home/components/product_card.dart';
import 'package:okbarter2/features/home/list/list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colours.primary,
                      size: 30.sp,
                    ),
                    8.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chetana Nagar",
                          style: TextStyle(
                            color: Colours.black222222,
                            fontFamily: Fonts.sSemiBold,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "Nashik",
                          style: TextStyle(
                            color: Colours.grey9B9B9B,
                            fontFamily: Fonts.sRegular,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              17.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final categoryName = index == 0
                          ? "All"
                          : categories[index];

                      return BlocSelector<HomeBloc, HomeState, bool>(
                        selector: (state) =>
                            state.selectedCategory == categoryName,
                        builder: (context, isSelected) {
                          return GestureDetector(
                            onTap: () {
                              context.read<HomeBloc>().add(
                                SelectedCategoryEvent(category: categoryName),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 12.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colours.primary
                                    : Colors.transparent,

                                border: Border.all(
                                  color: isSelected
                                      ? Colours.primary.withOpacity(0.9)
                                      : Colours.primary.withOpacity(0.30),
                                ),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Text(
                                categoryName,
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colours.primary,
                                  fontFamily: Fonts.sRegular,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
              ),
              23.heightBox,
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        customTextFormField(
                          hintText: "Search",
                          readOnly: true,

                          onTap: () {
                            goRouter.pushNamed(Routes.searchScreen.name);
                          },
                        ),
                        23.heightBox,
                        Image.asset(
                          "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
                        ),
                        20.heightBox,
                      ],
                    ),
                  ),
                  sectionHeader(
                    title: "Recommended Products",
                    subtitle: "View all",
                    ontap: () {},
                  ),
                  25.heightBox,
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(width: 24.w);
                        }
                        return productCard(
                          ontap: () {
                            goRouter.pushNamed(
                              Routes.productDetailsScreen.name,
                            );
                          },
                          img:
                              "https://images.unsplash.com/photo-1583394838336-acd977736f90?q=80&w=684&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          price: "1200",
                          productName: "Rockerz 460",
                          location: "Nashik",
                          date: "5 Jan",
                        );
                      },
                    ),
                  ),

                  20.heightBox,

                  sectionHeader(
                    title: "Near you",
                    subtitle: "View all",
                    ontap: () {},
                  ),

                  25.heightBox,
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(width: 24.w);
                        }
                        return productCard(
                          img: "assets/images/iphoneImg.png",
                          price: "1200",
                          productName: "Rockerz 460",
                          location: "Nashik",
                          date: "5 Jan",
                        );
                      },
                    ),
                  ),
                  23.heightBox,
                  Image.asset("assets/images/banner1.png"),
                  20.heightBox,

                  sectionHeader(
                    title: "Near you",
                    subtitle: "View all",
                    ontap: () {},
                  ),
                  25.heightBox,
                  25.heightBox,
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(width: 24.w);
                        }
                        return productCard(
                          img: "assets/images/iphoneImg.png",
                          price: "1200",
                          productName: "Rockerz 460",
                          location: "Nashik",
                          date: "5 Jan",
                        );
                      },
                    ),
                  ),
                  23.heightBox,

                  sectionHeader(
                    title: "Near you",
                    subtitle: "View all",
                    ontap: () {},
                  ),
                  25.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
