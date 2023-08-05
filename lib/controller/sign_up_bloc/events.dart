abstract class SignupEvents {}
class Signupevent extends SignupEvents {
  String username;
  String email;
  String password;
  String phone;
  Signupevent({
   required this.username,required this.phone,required this.email,required this.password
});
}

class Createuserevent extends SignupEvents {
  String username;
  String email;
  String phone; String uId;
  Createuserevent({
   required this.username,required this.phone,required this.email,required this.uId});
}