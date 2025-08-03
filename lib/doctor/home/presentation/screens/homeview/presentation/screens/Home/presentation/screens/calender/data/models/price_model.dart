class PriceModel {
  final double price;

  PriceModel({required this.price});

  factory PriceModel.fromJson(dynamic json) {
   
    return PriceModel(price: (json as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
    };
  }
}
