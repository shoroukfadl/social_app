abstract class LoginEvents {}
class Loginevent extends LoginEvents {

  String email;
  String password;

  Loginevent({
   required this.email,required this.password
});
}
class ChangeIconevent extends LoginEvents{

}

