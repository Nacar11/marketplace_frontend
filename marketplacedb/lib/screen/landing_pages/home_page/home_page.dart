import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplacedb/common/widgets/layouts/grid_layout.dart';
import 'package:marketplacedb/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:marketplacedb/common/widgets/shimmer/shimmer_progress.dart';
import 'package:marketplacedb/controllers/products/ProductItemController.dart';
import 'package:marketplacedb/data/models/ProductItemModel.dart';

import 'package:marketplacedb/screen/landing_pages/home_page/home_page_widgets.dart';
import 'package:marketplacedb/util/constants/app_images.dart';
import 'package:marketplacedb/util/constants/app_sizes.dart';

ProductItemController productItemController = ProductItemController.instance;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      MPPrimaryHeaderContainer(
          child: Column(children: [
        const MPHomeAppBar(),
        const SizedBox(height: MPSizes.spaceBtwSections),
        const MPSearchContainer(text: "Search Here"),
        const SizedBox(height: MPSizes.spaceBtwSections),
        const Padding(
          padding: EdgeInsets.only(left: MPSizes.defaultSpace),
          child:
              Column(children: [MPSectionHeading(title: 'Product Categories')]),
        ),
        const SizedBox(height: MPSizes.spaceBtwItems),
        SizedBox(
          height: MPSizes.imageThumbSize,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return const MPVerticalImageText();
              }),
        ),
      ])),
      HomePageBannerSlider(banners: const [
        MPImages.promotion1,
        MPImages.promotion2,
        MPImages.promotion3,
        MPImages.promotion4,
        MPImages.promotion5
      ]),
      const SizedBox(height: MPSizes.spaceBtwSections),
      Obx(
        () => SizedBox(
          height: 200,
          child: Center(
            child: productItemController.isLoading.value
                ? const ShimmerProgressForCarouselSlider() // Loading indicator
                : MPGridLayout(
                    itemCount: productItemController.productItemList.length,
                    itemBuilder: (context, index) {
                      ProductItemModel productItem =
                          productItemController.productItemList[index];
                      return MPProductCardVertical(
                          productItemData: productItem);
                    },
                  ),
          ),
        ),
      )
    ])));
  }
}




// (_, index) => const MPProductCardVertical()









