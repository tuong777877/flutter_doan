class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? phoneNumber;
  String? address;
  String? images;
  UserModel(
      {this.uid,
      this.email,
      this.userName,
      this.phoneNumber,
      this.address,
      this.images});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        userName: map['userName'],
        phoneNumber: map['phoneNumber'],
        address: map['address'],
        images: map['images']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'address': address,
      'images': images
    };
  }
}
