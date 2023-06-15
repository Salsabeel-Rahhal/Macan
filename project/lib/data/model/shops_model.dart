class Shop {
  int? id;
  String? shopName;
  String? shopLocation;
  String? rating;
  String? workTime;
  String? priceRange;
  String? contactNumber;
  String? foodType;
  String? serviceType;
  String image;

  Shop(
      {this.id,
      this.shopName,
      this.shopLocation,
      this.rating,
      this.workTime,
      this.priceRange,
      this.contactNumber,
      this.foodType,
      this.serviceType,
      required this.image});

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      shopName: json['shop_name'],
      shopLocation: json['shop_location'],
      rating: json['rating'],
      workTime: json['work_time'],
      priceRange: json['price_range'],
      contactNumber: json['contact_number'],
      foodType: json['food_type'],
      serviceType: json['service_type'],
      image: json['image'],
    );
  }
  // factory Shop.formJson1(Map<String, dynamic> json) {
  //   return Shop(
  //     shopName: json['shop_name'],
  //     shopLocation: json['shop_location'],
  //     workTime: json['work_time'],
  //     priceRange: json['price_range'],
  //     contactNumber: json['contact_number'],
  //     foodType: json['food_type'],
  //     serviceType: json['service_type'],
  //     rating: json['rating'],
  //     image: json['image'],
  //   );
  // }
}
