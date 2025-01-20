class ProductModel {
  final int id;
  final String image;
  final String title;
  final double price;
  final int selectedQuantity;
  final bool checkOut;

  ProductModel(
      {required this.image,
      required this.price,
      this.selectedQuantity = 1,
      required this.title,
      this.id = 0,
      this.checkOut = false});

  copyWith(
      {String? image,
      double? price,
      int? selectedQuantity,
      String? title,
      int? id,
      bool? checkOut}) {
    return ProductModel(
        image: image ?? this.image,
        price: price ?? this.price,
        title: title ?? this.title,
        selectedQuantity: selectedQuantity ?? this.selectedQuantity,
        id: id ?? this.id,
        checkOut: checkOut ?? this.checkOut);
  }
}
