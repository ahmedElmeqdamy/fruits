class ShippingAddressEntity {
  ShippingAddressEntity({
     this.name,
     this.address,
     this.phoneNumber,
     this.addressDetails,
     this.city,
     this.email,
  });

   String? name;
   String? address;
   String? phoneNumber;
   String? addressDetails;
   String? city;
   String? email;


   @override
  String toString() {
     return '$address $addressDetails $city ';
  }
}
