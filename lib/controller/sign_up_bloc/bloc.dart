import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/sign_up_bloc/events.dart';
import 'package:social_app/controller/sign_up_bloc/states.dart';
import 'package:social_app/model/user_signup_model.dart';

class SignupBloc extends Bloc<SignupEvents,SignupStates>{
  SignupBloc() : super(SignupInitState()){
    on<SignupEvents>((event , state) {
      if(event is Signupevent ){
        signup(event, state);
      }
      else if (event is Createuserevent){
        CreateUser(event, state);
      }
    });

  }

  Future<void> signup(Signupevent event , Emitter<SignupStates> call)async {
    call(SignupLoadingState());
    try{
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email, password: event.password,
      );
      print(FirebaseAuth.instance.currentUser!.email);
      print(FirebaseAuth.instance.currentUser!.uid);
      UserSignUpModel model = UserSignUpModel(
          name: event.username, email: event.email,
          uId: FirebaseAuth.instance.currentUser!.uid,
          phone: event.phone,
          isEmailVerifed: false
      );
      FirebaseFirestore.instance.collection("users").
      doc(FirebaseAuth.instance.currentUser!.uid).set(model.toMap());
      print(model.email);
      call(SignupSuccessState());
    }catch(error){
      print(error.toString());
      call(SignupErrorState(error.toString()));
    }


  }

  Future<void> CreateUser(Createuserevent event , Emitter<SignupStates> call)async {
    UserSignUpModel model = UserSignUpModel(
        name: event.username, email: event.email, uId: event.uId, phone: event.phone);
    call(CreateUserLoadingState());
    try{
      FirebaseFirestore.instance.collection("users").doc(event.uId).set(model.toMap());
      print(FirebaseAuth.instance.currentUser!.email);
      print(FirebaseAuth.instance.currentUser!.uid);
      call(CreateUserSuccessState());
    }catch(error){
      print(onError.toString());
      call(CreateUserErrorState(onError.toString()));
    }


  }

}