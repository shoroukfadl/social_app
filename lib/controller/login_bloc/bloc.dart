

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/login_bloc/events.dart';
import 'package:social_app/controller/login_bloc/states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc() : super(LoginInitState()){
    on<LoginEvents>((event , state)async {
      if(event is Loginevent ){
        await Login(event, state);
      }
      else if(event is ChangeIconevent ){
        await changeIcon(event, state);
      }
    });

  }

  Future<void> Login(Loginevent event , Emitter<LoginStates> emit)async {
    emit(LoginLoadingState());
     await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email, password: event.password,
      ).then((value) async {
           print(value.user!.email);
           print(value.user!.uid);
           emit(LoginSuccessState(value.user!.uid));
      }) .catchError((error)async{
        print(error.toString());
        emit(LoginErrorState(error.toString()));
      });


  }

  bool Icon =false;
  static LoginBloc get(context) => BlocProvider.of(context);
  Future<void> changeIcon(ChangeIconevent event , Emitter<LoginStates> emit)async {
    Icon = !Icon;
    emit(ChangeIconState());
  }


}