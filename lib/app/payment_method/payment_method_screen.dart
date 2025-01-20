import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/payment_method/widget/payment_method_card.dart';
import 'package:ecommerce_test/app/widgets/base_scaffold.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/payment_method_model.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  final PaymentMethodModel? selected;
  const PaymentMethodScreen({super.key, this.selected});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late PaymentMethodModel _selectedMethod;

  List<PaymentMethodModel> cardPayment = [
    PaymentMethodModel(
        icon: AppImages.masterCardImg,
        title: "Mastercard",
        subText: "**** **** 7896 4576"),
    PaymentMethodModel(
        icon: AppImages.paypalImg,
        title: "Paypal",
        subText: "**** **** 2345 9203")
  ];

  List<PaymentMethodModel> otherMethod = [
    PaymentMethodModel(
        icon: AppIcons.creditCardIcon,
        title: "Credit/Debit Card",
        subText: "Pay with you Visa or Master Card"),
    PaymentMethodModel(
      icon: AppImages.paypalImg,
      title: "Paypal",
    ),
    PaymentMethodModel(
      icon: AppImages.applePayImg,
      title: "Apple",
    )
  ];

  List<PaymentMethodModel> payLater = [
    PaymentMethodModel(
      icon: AppImages.kredivoImg,
      title: "Kredivo",
    ),
  ];

  initializePayment(){
    setState(() {
          _selectedMethod = widget.selected ?? cardPayment[0];
    });
  }

  @override
  void initState() {
   initializePayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appPrint(_selectedMethod.title);
    return BaseScaffold(
        title: "Payment Method",
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          children: [
            ...cardPayment.map((e) => PaymentMethodCard(
                  data: e,
                  showRightArrow: false,
                  isSelected: e.title == _selectedMethod.title,
                  onTap: () => Navigator.pop(context, e),
                )),
            Gap(30.h),
            const CustomText(
              "Add Another Method",
              textType: TextType.mediumText,
              fontWeight: FontWeight.bold,
            ),
            Gap(10.h),
            ...otherMethod.map((e) => PaymentMethodCard(
                  data: e,
                  onTap: () {
                    dialogService.showSnackBar("Coming Soon",
                        appToastType: AppToastType.random);
                  },
                )),
            Gap(30.h),
            const CustomText(
              "Pay Later",
              textType: TextType.mediumText,
              fontWeight: FontWeight.bold,
            ),
            Gap(10.h),
            ...payLater.map((e) => PaymentMethodCard(
                  data: e,
                  onTap: () {
                    dialogService.showSnackBar("Coming Soon",
                        appToastType: AppToastType.random);
                  },
                )),
          ],
        ));
  }
}
