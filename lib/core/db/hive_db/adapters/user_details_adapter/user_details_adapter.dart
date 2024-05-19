import 'package:hive_flutter/hive_flutter.dart';
part 'user_details_adapter.g.dart';

@HiveType(typeId: 3)
class UserDetailsDB {
  @HiveField(0)
  dynamic customer_id;
  @HiveField(1)
  String name;
  @HiveField(2)
  dynamic email;
  @HiveField(3)
  dynamic image;
  @HiveField(4)
  dynamic phone;

  UserDetailsDB({
     this.customer_id,
     this.name = '',
     this.email,
     this.image,
     this.phone,
  });

  factory UserDetailsDB.fromJson(Map<String, dynamic> json) {
    return UserDetailsDB(
      customer_id: json['customer_id'],
      email: json['email'],
      image: json['image'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customer_id;
    data['email'] = email;
    data['image'] = image;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
