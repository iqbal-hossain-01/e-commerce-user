class CartModel {
  String cartItemId;
  String productId;
  String productName;
  String image;
  double price;
  int quantity;
  double? totalPrice;
  bool isSelected;

  CartModel({
    required this.cartItemId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.totalPrice,
    this.isSelected = false,
  }) {
    totalPrice = price * quantity;
  }

  Map<String, dynamic> toMap() {
    return {
      'cartItemId': cartItemId,
      'productId': productId,
      'productName': productName,
      'image': image,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'isSelected': isSelected,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cartItemId: map['cartItemId'],
      productId: map['productId'],
      productName: map['productName'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      totalPrice: map['totalPrice'],
      isSelected: map['isSelected'],
    );
  }
}