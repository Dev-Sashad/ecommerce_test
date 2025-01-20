import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/base_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends BaseModel {
  
  final List<String> _images = [];
  List<String> get images => _images;
  addImage(String val) {
    _images.add(val);
    notifyListeners();
  }

  List<int> sizes = [30, 32, 34, 36, 40];
  List<Color> colors = [AppColors.white, AppColors.red, AppColors.blue, AppColors.yellow];

  Color _selectedColor  = AppColors.white;
  Color get selectedColor  => _selectedColor ;
  set selectedColor (Color val) {
    _selectedColor  = val;
    notifyListeners();
  }

  int _selectedSize = 32;
  int get selectedSize => _selectedSize;
  set selectedSize(int val) {
    _selectedSize = val;
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  bool _like = false;
  bool get like => _like;
  set like (bool val){
    _like = val;
    notifyListeners();
  }
}
