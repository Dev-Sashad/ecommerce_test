import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/base_model.dart';

class HomeScreenProvider extends BaseModel {

  List<String> categories = ["Shoes", "Clothes", "Fashion", "Beauty"];


  List<ProductModel> flashSales = [
    ProductModel(image: AppImages.sneakersImg, price: 140.00, title: "Adidas Sneaker “Psychic Energy”"),
    ProductModel(image: AppImages.watchImg, price: 250.00, title: "Smith & Caughey’s Wristwatch"),
    ProductModel(image: AppImages.earBudImg, price: 250.00, title: "Apple Airpod"),
  ];


    List<ProductModel> popularSales = [
    ProductModel(image: AppImages.tshirtBlackImg, price: 140.00, title: "Black Tshirt"),
    ProductModel(image: AppImages.tshirtWhiteImg, price: 250.00, title: "White Tshirt"),
    ProductModel(image: AppImages.tshirtWhiteImg, price: 250.00, title: "White Tshirt"),
    ProductModel(image: AppImages.tshirtBlackImg, price: 140.00, title: "Black Tshirt"),
    ProductModel(image: AppImages.tshirtBlackImg, price: 140.00, title: "Black Tshirt"),
    ProductModel(image: AppImages.tshirtWhiteImg, price: 250.00, title: "White Tshirt"),
  ];
}