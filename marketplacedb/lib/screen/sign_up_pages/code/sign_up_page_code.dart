// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:marketplacedb/common/styles/spacing_styles.dart';
import 'package:marketplacedb/common/widgets/common_widgets/containers.dart';
import 'package:marketplacedb/common/widgets/common_widgets/app_bars.dart';
import 'package:marketplacedb/common/widgets/common_widgets/snackbars.dart';
import 'package:marketplacedb/util/constants/app_sizes.dart';
import 'package:marketplacedb/util/constants/app_strings.dart';

import 'code_widgets.dart';
import '../../../controllers/authenticationController.dart';

class SignUpPageCode extends StatefulWidget {
  const SignUpPageCode({Key? key}) : super(key: key);

  @override
  State<SignUpPageCode> createState() => SignUpPageCodeState();
}

class SignUpPageCodeState extends State<SignUpPageCode> {
  String otpCode = '';
  AuthenticationController authController = AuthenticationController.instance;
  bool isCodeValid = true;

  void onTapFunction() async {
    final code = await authController.getSMSVerificationCode(contactNumber);
    if (code['success'] != null) {
      String successValue = code['success'].toString();
      localStorage.saveData('SMSVerificationCode', successValue);
      successSnackBar(context, MPTexts.otpResentSuccessful, MPTexts.success);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SignUpAppBar(),
      body: Padding(
        padding: MPSpacingStyle.signUpProcessPadding,
        child: Column(children: [
          ContainerGuide(
            headerText: MPTexts.codeHeaderText,
            richText: codeSubRichText(context),
          ),
          const SizedBox(height: MPSizes.spaceBtwSections),
          CustomPinInput(
            onOtpCompleted: (otp) {
              setState(() {
                otpCode = otp;
              });
            },
          ),
          const SizedBox(height: MPSizes.spaceBtwSections),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomResendCodeRichText(
                authController: authController,
                onTapFunction: onTapFunction,
              ),
              const SizedBox(height: MPSizes.spaceBtwItems),
              const CustomDifferentNumberRichText(),
            ],
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomSignUpContinue(
          otpCode: otpCode, authController: authController),
    );
  }
}
