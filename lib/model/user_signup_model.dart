class UserSignUpModel{
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerifed;

  UserSignUpModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    this.isEmailVerifed,
    this.image,
    this.cover,
    this.bio
  });

  UserSignUpModel.fromjson(Map<String,dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId =json['uId'];
    image =json['image'];
    cover =json['cover'];
    bio =json['bio'];
    isEmailVerifed =json['isEmailVerifed'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name ,
      'phone': phone,
      'email' : email ,
      'uId': uId,
      'image':image,
      'isEmailVerifed':isEmailVerifed
    };
  }
}