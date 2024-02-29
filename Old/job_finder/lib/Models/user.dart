class User {
  int? id;
  String? name;
  String? email;
  String? bio;
  String? password;
  String? image;
  String? address;

  toJson(){
    return {
      'id' : id.toString(),
      'name' : name.toString(),
      'email' : email,
      'password' : password,
      'bio':bio.toString(),
      'img': image.toString(),
      'address': address.toString(),
    };
  }
}