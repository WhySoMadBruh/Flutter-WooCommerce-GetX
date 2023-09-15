import 'dart:convert';
import 'package:hive/hive.dart';

part 'customer.g.dart';

Customer customerFromJson(String val) => Customer.fromJson(json.decode(val));

@HiveType(typeId: 5)
class Customer extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? phoneNumber;
  @HiveField(5)
  Address? address;

  Customer({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> data) => Customer(
        id: data['user']['id'] as int,
        email: data['user']['email'],
        phoneNumber: data['user']['phone_number'],
        firstName: data['user']['first_name'],
        lastName: data['user']['last_name'],
        address: Address.fromJson(data['user']['billing']),
      );

  bool checkIfAnyIsNull() {
    return [id, email, firstName, lastName].contains(null);
  }
}

@HiveType(typeId: 6)
class Address extends HiveObject {
  @HiveField(0)
  String? firstName;
  @HiveField(1)
  String? lastName;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? company;
  @HiveField(5)
  String? addressline_1;
  @HiveField(6)
  String? addressline_2;
  @HiveField(7)
  String? city;
  @HiveField(8)
  String? state;
  @HiveField(9)
  String? pincode;
  @HiveField(10)
  String? country;

  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.company,
    this.addressline_1,
    this.addressline_2,
    this.city,
    this.state,
    this.pincode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> data) => Address(
        firstName: data['first_name'],
        lastName: data['last_name'],
        email: data['email'],
        phoneNumber: data['phone'],
        company: data['company'],
        addressline_1: data['address_1'],
        addressline_2: data['address_2'],
        city: data['city'],
        state: data['state'],
        pincode: data['postcode'],
        country: data['country'],
      );
}
