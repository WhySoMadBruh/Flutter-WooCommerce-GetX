import 'dart:convert';

Cart cartFromJson(String val) => Cart.fromJson(jsonDecode(val));

class Cart {
  dynamic userId;
  List<CartProducts>? products;

  Cart({required this.userId, this.products});

  factory Cart.fromJson(Map<String, dynamic> data) {
    return Cart(
      userId: data['user_id'],
      products: List<CartProducts>.from(
        data['products'].map(
          (data) => CartProducts.fromJson(data),
        ),
      ),
    );
  }
}

class CartProducts {
  dynamic cartItemKey;
  dynamic productId;
  dynamic productName;
  dynamic quantity;
  dynamic productRegularPrice;
  dynamic productSalePrice;
  dynamic thumbnail;
  dynamic lineSubtotal;
  dynamic lineTotal;

  CartProducts({
    this.cartItemKey,
    this.productId,
    this.productName,
    this.quantity,
    this.productRegularPrice,
    this.productSalePrice,
    this.thumbnail,
    this.lineSubtotal,
    this.lineTotal,
  });

  factory CartProducts.fromJson(Map<String, dynamic> data) => CartProducts(
        cartItemKey: data['cart_item_key'],
        productId: data['product_id'],
        productName: data['product_name'],
        quantity: data['qty'],
        productRegularPrice: data['product_regular_price'],
        productSalePrice: data['product_sale_price'],
        thumbnail: data['thumbnail'],
        lineSubtotal: data['line_subtotal'],
        lineTotal: data['line_total'],
      );
}
