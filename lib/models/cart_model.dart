class CartModel {
  int userId;
  int productId;
  int variationId;
  String? quantity;

  CartModel({
    required this.userId,
    required this.productId,
    required this.variationId,
    this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> data) => CartModel(
        userId: data['user_id'],
        productId: data['product_id'],
        variationId: data['varition_id'],
        quantity: data['quantity'].toString(),
      );
}
