import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplacedb/common/widgets/common_widgets/app_bars.dart';
import 'package:marketplacedb/common/widgets/common_widgets/containers.dart';
import 'package:marketplacedb/common/widgets/layouts/list_view_layout.dart';
import 'package:marketplacedb/data/models/shopping_cart_item_model.dart';
import 'package:marketplacedb/screen/sign_in_pages/checkout_page/checkout_page_controller.dart';
import 'package:marketplacedb/screen/sign_in_pages/checkout_page/checkout_page_widgets.dart';
import 'package:marketplacedb/screen/sign_in_pages/shopping_cart_page/shopping_cart_page_controller.dart';
import 'package:marketplacedb/screen/sign_in_pages/shopping_cart_page/shopping_cart_page_widgets.dart';
import 'package:marketplacedb/util/constants/app_colors.dart';
import 'package:marketplacedb/util/constants/app_sizes.dart';
import 'package:marketplacedb/util/helpers/helper_functions.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutPageController());
    final dark = MPHelperFunctions.isDarkMode(context);
    ShoppingCartPageController controller = ShoppingCartPageController.instance;
    return Scaffold(
        appBar: PrimarySearchAppBar(
          title: Text("Checkout",
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(MPSizes.defaultSpace),
                child: Column(
                  children: [
                    MPListViewLayout(
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: MPSizes.spaceBtwSections),
                        itemBuilder: (_, index) {
                          ShoppingCartItemModel shoppingCartItem = controller
                              .shoppingCartItemListSelectedToCheckout[index];
                          return MPCartItem(cartItem: shoppingCartItem);
                        },
                        itemCount: controller
                            .shoppingCartItemListSelectedToCheckout.length),
                    const SizedBox(height: MPSizes.spaceBtwSections),
                    const MPCouponCode(),
                    const SizedBox(height: MPSizes.spaceBtwSections),
                    MPCircularContainer(
                        padding: const EdgeInsets.all(MPSizes.md),
                        showBorder: true,
                        backgroundColor: dark ? MPColors.dark : MPColors.white,
                        child: const Column(children: [
                          MPBillingAmountSection(),
                          SizedBox(height: MPSizes.spaceBtwItems),
                          Divider(),
                          SizedBox(height: MPSizes.spaceBtwItems),
                          MPBillingPaymentTypeSection()
                        ]))
                  ],
                ))));
  }
}
