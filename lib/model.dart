class ProductModal {
  int? id, quantity,  discount;
  double? price;
  String? name, category, img;

  ProductModal(
      {required this.id,
        required this.name,
        required this.img,
        required this.price,
        required this.category,
        required this.quantity,
        required this.discount});
}