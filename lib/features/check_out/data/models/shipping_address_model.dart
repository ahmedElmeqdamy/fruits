import 'package:fruits/features/check_out/domain/entites/shipping_address_entity.dart';

class ShippingAddressModels {

  ShippingAddressModels({
    this.name,
    this.address,
    this.phoneNumber,
    this.addressDetails,
    this.city,
    this.email,
  });
  // clean architecture
  // I use this factory method cause this model use with any thing that use shipping address entity
  factory ShippingAddressModels.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModels(
      name: entity.name ,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      addressDetails: entity.addressDetails,
      city: entity.city,
      email: entity.email,
    );
  }
// I use this method to convert the shipping address entity to map to add it to the database specific firestore
toJson(){
    return {
      'name' : name ,
      'address' : address,
      'phoneNumber' : phoneNumber,
      'addressDetails' : addressDetails,
      'city' : city,
      'email' : email,
    };
  }

  String? name;
  String? address;
  String? phoneNumber;
  String? addressDetails;
  String? city;
  String? email;
}
