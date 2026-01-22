import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/messages/components/custom_app_bar.dart';
import 'package:okbarter2/features/my_product/components/my_product_card.dart';

class MyProductScreen extends StatelessWidget {
  const MyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary,
      body: CustomAppBar(
        title: 'My Products',
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              42.heightBox,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  separatorBuilder: (_, __) => 12.heightBox,
                  itemBuilder: (context, index) {
                    return const MyProductsCard();
                  },
                ),
              ),
              108.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
