import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marketplacedb/common/styles/shadows.dart';
import 'package:marketplacedb/common/widgets/common_widgets/containers.dart';
import 'package:marketplacedb/common/widgets/texts/product_title_text.dart';
import 'package:marketplacedb/data/models/ProductItemModel.dart';
import 'package:marketplacedb/screen/landing_pages/home_page/home_page_widgets.dart';
import 'package:marketplacedb/util/constants/app_colors.dart';
import 'package:marketplacedb/util/constants/app_images.dart';
import 'package:marketplacedb/util/constants/app_sizes.dart';
import 'package:marketplacedb/util/helpers/helper_functions.dart';

class MPProductCardVertical extends StatelessWidget {
  const MPProductCardVertical({
    super.key,
    required this.productItemData,
  });
  final ProductItemModel productItemData;

  @override
  Widget build(BuildContext context) {
    final dark = MPHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 180,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              boxShadow: [MPShadowStyle.verticalProductShadow],
              borderRadius: BorderRadius.circular(MPSizes.productImageRadius),
              color: dark ? MPColors.darkerGrey : MPColors.white),
          child: Column(children: [
            MPCircularContainer(
                height: 180,
                padding: const EdgeInsets.all(MPSizes.sm),
                backgroundColor: dark ? MPColors.dark : MPColors.light,
                child: Stack(children: [
                  const MPRoundedImage(
                      padding: EdgeInsets.only(top: MPSizes.md),
                      applyImageRadius: true,
                      borderRadius: MPSizes.productImageRadius,
                      imageUrl: MPImages.shirtMale),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: MPCircularContainer(
                        height: 25,
                        width: 40,
                        radius: MPSizes.sm,
                        backgroundColor: MPColors.sale.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: MPSizes.sm, vertical: MPSizes.xs),
                        child: Text('25%',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: MPColors.black))),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: dark
                              ? MPColors.black.withOpacity(0.9)
                              : MPColors.white.withOpacity(0.9),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.heart5,
                                size: MPSizes.iconXs))),
                  )
                ])),
            const SizedBox(height: MPSizes.spaceBtwItems / 2),
            Padding(
                padding: const EdgeInsets.only(left: MPSizes.sm),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MPProductTitleText(
                          title: productItemData.product!.name!,
                          smallSize: false),
                      const SizedBox(height: MPSizes.spaceBtwItems / 2),
                      Row(children: [
                        Text(
                            productItemData
                                .product!.product_category!.category_name!
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelMedium),
                        const Icon(Iconsax.verify5,
                            color: MPColors.secondary, size: MPSizes.iconXs),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Php 100.00',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Container(
                              decoration: const BoxDecoration(
                                  color: MPColors.dark,
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(MPSizes.cardRadiusMd),
                                      bottomRight: Radius.circular(
                                          MPSizes.productImageRadius))),
                              child: const SizedBox(
                                width: MPSizes.iconLg * 1.1,
                                height: MPSizes.iconLg * 1.1,
                                child: Center(
                                  child: Icon(Icons.add_shopping_cart,
                                      color: MPColors.white,
                                      size: MPSizes.iconMd),
                                ),
                              ))
                        ],
                      )
                    ]))
          ])),
    );
  }
}
