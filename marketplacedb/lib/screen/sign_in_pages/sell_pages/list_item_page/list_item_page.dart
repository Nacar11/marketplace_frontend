import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplacedb/common/widgets/common_widgets/app_bars.dart';
import 'package:marketplacedb/common/widgets/common_widgets/buttons.dart';
import 'package:marketplacedb/common/widgets/common_widgets/text_fields.dart';
import 'package:marketplacedb/common/widgets/texts/peso_sign.dart';
import 'package:marketplacedb/screen/sign_in_pages/sell_pages/list_item_page/list_item_page_controller.dart';
import 'package:marketplacedb/screen/sign_in_pages/sell_pages/list_item_page/list_item_page_widgets.dart';
import 'package:marketplacedb/util/constants/app_sizes.dart';

class ListItemPage extends StatelessWidget {
  const ListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    ListItemPageController controller = Get.put(ListItemPageController());
    return Scaffold(
      appBar: PrimarySearchAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Listing",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductListingImagesDisplay(),
            Padding(
                padding: const EdgeInsets.all(MPSizes.defaultSpace),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Category',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: MPSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // CountryPickerDialog.openDialog(context, controller);
                              },
                              child: Obx(() => ProductDialogContainer(
                                    text: controller.selectedProductCategory1
                                            .value.categoryName ??
                                        "Select Category 1",
                                  )),
                            ),
                          ),
                          const SizedBox(width: MPSizes.spaceBtwInputFields),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // RegionPickerDialog.openDialog(context, controller);
                              },
                              child: Obx(() => ProductDialogContainer(
                                    text: controller.selectedProductCategory2
                                            .value.categoryName ??
                                        "Select Category 2",
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: MPSizes.spaceBtwItems),
                      Text('Product Type',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: MPSizes.spaceBtwItems),
                      GestureDetector(
                        onTap: () {
                          // RegionPickerDialog.openDialog(context, controller);
                        },
                        child: Obx(() => ProductDialogContainer(
                              text: controller.selectedProductCategory2.value
                                      .categoryName ??
                                  "Select Product Type",
                            )),
                      ),
                      const SizedBox(height: MPSizes.spaceBtwItems),
                      Text('Your Item Description',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: MPSizes.spaceBtwItems),
                      ValidatorField(
                          maxLines: 3,
                          controller: controller.itemDescription.value),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      Text('Specify Variation',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      const Divider(),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      Padding(
                          padding: const EdgeInsets.all(MPSizes.defaultSpace),
                          child: controller.specifiedVariationList.isEmpty
                              ? Center(
                                  child: Text('No Product Category Variation',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                )
                              : const VariationPicker()),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      const Divider(),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      Row(
                        children: [
                          Text('Price',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(width: MPSizes.spaceBtwItems),
                          const PesoSign(),
                          const SizedBox(width: MPSizes.spaceBtwItems),
                          Expanded(
                              child: ValidatorField(
                                  controller: controller.itemPrice.value,
                                  isKeyboardInputNumber: true))
                        ],
                      ),
                      const SizedBox(height: MPSizes.spaceBtwSections),
                      MPPrimaryButton(onPressed: () {}, text: 'List Item')
                    ]))
          ],
        ),
      ),
    );
  }
}



 // MPPrimaryButton(
          //     onPressed: () {
          //       for (int i = 0; i < controller.selectedImages.length; i++) {
          //         print('Image at index $i: ${controller.selectedImages[i]}');
          //       }
          //     },
          //     text: 'text')