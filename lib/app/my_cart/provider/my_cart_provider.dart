import 'package:ecommerce_test/app/my_cart/widget/my_cart_card.dart';
import 'package:ecommerce_test/models/payment_method_model.dart';
import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/base_model.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:flutter/material.dart';

class MyCartProvider extends BaseModel {
  MyCartProvider() {
    init();
  }

  init() {
    getTotalPrice();
    selectedCheckoutMethod = PaymentMethodModel(
        icon: AppImages.masterCardImg,
        title: "Mastercard",
        subText: "**** **** 7896 4576");
  }

  final listKey = GlobalKey<AnimatedListState>();

  late PaymentMethodModel _selectedCheckoutMethod;
  PaymentMethodModel get selectedCheckoutMethod => _selectedCheckoutMethod;
  set selectedCheckoutMethod(PaymentMethodModel val) {
    _selectedCheckoutMethod = val;
    notifyListeners();
  }

  bool get allIsChecked =>
      cartList.where((e) => e.checkOut != true).toList().isEmpty;

  double totalPrice = 0.0;

  // to calculate total price
  getTotalPrice() {
    totalPrice = 0.0;
    final y = cartList.where(((e) => e.checkOut)).toList();
    for (int i = 0; i < y.length; i++) {
      final p = y[i];
      totalPrice += (p.price * p.selectedQuantity);
    }
    notifyListeners();
  }

// to unmark all item as check out
  checkAll() {
    for (int i = 0; i < cartList.length; i++) {
      cartList[i] = cartList[i].copyWith(checkOut: true);
    }
    notifyListeners();
    getTotalPrice();
  }

  // to mark all item as check out
  uncheckAll() {
    for (int i = 0; i < cartList.length; i++) {
      cartList[i] = cartList[i].copyWith(checkOut: false);
    }
    notifyListeners();
    getTotalPrice();
  }

  List<ProductModel> cartList = [
    ProductModel(
        image: AppImages.sneakersImg,
        price: 140.00,
        title: "Adidas Sneaker “Psychic Energy”",
        id: 0),
    ProductModel(
        image: AppImages.watchImg,
        price: 250.00,
        title: "Smith & Caughey’s Wristwatch",
        id: 1),
    ProductModel(
        image: AppImages.earBudImg,
        price: 250.00,
        title: "Apple Airpod",
        id: 2),
  ];

  int _maxId = 2;

  // to add an item to the cart list
  addNewProcduct(ProductModel data) {
    try {
      var index = cartList.length;
      cartList.insert(
          index,
          data.copyWith(
            id: ++_maxId,
          ));
      if (listKey.currentState != null) {
        listKey.currentState!
            .insertItem(index, duration: const Duration(milliseconds: 300));
      }
      getTotalPrice();
      notifyListeners();
    } catch (e) {
      appPrint(e);
    }
  }

  // to update an item quantity in the cart list
  updateQuantity({required ProductModel data, required int qty}) {
    var index = cartList.indexWhere((e) => e.id == data.id);
    if (index > -1) {
      cartList[index] = cartList[index].copyWith(selectedQuantity: qty);
      notifyListeners();
      getTotalPrice();
    }
  }

  // to update an item checkout status in the cart list
  updateCheckOut({required ProductModel data, required bool isChecked}) {
    var index = cartList.indexWhere((e) => e.id == data.id);
    if (index > -1) {
      cartList[index] = cartList[index].copyWith(checkOut: isChecked);
      notifyListeners();
    }
    getTotalPrice();
  }


  // to remove an Item from the cart list
  removeProductList(ProductModel data) {
    var index = cartList.indexWhere((e) => e.id == data.id);
    cartList.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
              parent: animation, curve: const Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor: CurvedAnimation(
                parent: animation, curve: const Interval(0.0, 1.0)),
            axisAlignment: 0.0,
            child: MyCartCard(
              data: data,
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 600),
    );
    notifyListeners();
    getTotalPrice();
  }
}
