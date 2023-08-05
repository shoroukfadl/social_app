abstract class SignupStates {}
class SignupInitState extends SignupStates {}
class SignupLoadingState extends SignupStates {}
class SignupSuccessState extends SignupStates {}
class SignupErrorState extends SignupStates {
  String? error;
  SignupErrorState(this.error);
}
class CreateUserLoadingState extends SignupStates {}
class CreateUserSuccessState extends SignupStates {}
class CreateUserErrorState extends SignupStates {
  String? error;
  CreateUserErrorState(this.error);
}