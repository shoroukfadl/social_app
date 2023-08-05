import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/controller/home_bloc/events.dart';
import 'package:social_app/controller/home_bloc/states.dart';
import 'package:social_app/model/user_signup_model.dart';
import 'package:social_app/services/Icons.dart';
import 'package:social_app/view/chat/chat.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import '../../services/widgets/constant.dart';
import '../../view/home/home.dart';
import '../../view/posts/post.dart';
import '../../view/settings/settings.dart';
import '../../view/users/users.dart';


class HomeBloc extends Bloc<HomeEvents,HomeStates>{

   HomeBloc() : super(HomeInitState()){
    on<HomeEvents>((event , state) async{
      if(event is GetUserDataEvent ){
        await GetUserData(event, state);
      }
      if(event is ChangeScreenEvent ){
        await ChangeSceen(event, state);
      }
      if(event is PickProfileImageEvent ){
        await PickProfileImage(event, state);
      }
      if(event is UploadProfileImageEvent ){
        await UploadProfileImage(event, state);
      }
      if(event is PickCoverImageEvent ){
        await PickCoverImage(event, state);
      }

      if(event is UploadCoverImageEvent ){
        await UploadCoverImage(event, state);
      }

      if(event is UpdateInfoImagesEvent ){
        await UpdateUserInfowithImages(event, state);
      }

    });

  }

   static HomeBloc get(context) =>BlocProvider.of(context);

   Future<void> GetUserData(GetUserDataEvent event , Emitter<HomeStates> call)async {
     call(GetUserLoadingState());
     await FirebaseFirestore.instance.collection('users').doc(uID).get().then((value)async {
       print(value.data());
       usermodel = UserSignUpModel.fromjson(value.data()!);
       print("${usermodel!.phone}");
       call(GetUserSuccessState());
     }).catchError((onError)async{
       print(onError.toString());
       call(GetUserErrorState(onError.toString()));
     });
   }

   List<Widget> screens =[
     Home(),
     Chat(),
     Post(),
     Users(),
     settings(),
   ];
   List<IconData> Icons =[
     IconBroken.Home,
     IconBroken.Chat,
     IconBroken.Upload,
     IconBroken.User1,
     IconBroken.Setting,
   ];
   int index =0;

   Future<void> ChangeSceen(ChangeScreenEvent event , Emitter<HomeStates> call )async {
    index = event.currindex ;
     call(ChangeScreenState());
   }

   File? ProfileImage ;
   Future<void> PickProfileImage(PickProfileImageEvent event , Emitter<HomeStates> call )async {
     final result = await ImagePicker().pickImage(source: ImageSource.gallery);
     if(result != null){
       ProfileImage = File(result.path) ;
       call(PickProfileImageState());
     }

   }

   String? imageProfileUrl;
   Future<void> UploadProfileImage(UploadProfileImageEvent event , Emitter<HomeStates> call )async {
     call(UploadProfileImageLoadingState());
     await firebase_storage.
     FirebaseStorage.
     instance.ref().
     child("users/${Uri.file(ProfileImage!.path).pathSegments.last}").
     putFile(ProfileImage!).then((value) {
       value.ref.getDownloadURL().then((value)  {
         print(value);
         imageProfileName = value;
       }).catchError((onError){
         print("error in download : ${onError.toString()}");
       });
       call(UploadProfileImageSuccessState());
     }).catchError((onError){
       print(onError.toString());
       call(UploadProfileImageErrorState(onError.toString()));

     });
   }


   File? CoverImage ;
   Future<void> PickCoverImage(PickCoverImageEvent event , Emitter<HomeStates> call )async {
     final result = await ImagePicker().pickImage(source: ImageSource.gallery);
     if(result != null){
       CoverImage = File(result.path) ;
       call(PickProfileImageState());
     }

   }

   String? coverImageUrl;
   Future<void> UploadCoverImage(UploadCoverImageEvent event  , Emitter<HomeStates> call )async {
     call(UploadCoverImageLoadingState());
     await firebase_storage.
     FirebaseStorage.
     instance.ref().
     child("users/${Uri.file(CoverImage!.path).pathSegments.last}").
     putFile(CoverImage!).then((value) {
       value.ref.getDownloadURL().then((value) {
         print(value);
         coverImageName =value;
       }).catchError((onError){
         print("error in download : ${onError.toString()}");
       });
       call(UploadCoverImageSuccessState());
     }).catchError((onError){
       print(onError.toString());
       call(UploadCoverImageErrorState(onError.toString()));

     });
   }


   Future<void> UpdateUserInfowithImages(UpdateInfoImagesEvent event  , Emitter<HomeStates> call )
   async {
     call(UpdateInfoImagesLoadingState());
     if(CoverImage != null)
       {
         UploadCoverImage(UploadCoverImageEvent event,call );
       }
   }


   Future<void> UpdateUserInfo(UpdateInfoImagesEvent event  , Emitter<HomeStates> call )async {
     call(UpdateInfoLoadingState());
     UserSignUpModel model = UserSignUpModel(
       name: event.name,
       bio: event.bio,
       phone:event.phone ,
       email: usermodel!.email,
       uId: usermodel!.uId,
     );
     await FirebaseFirestore.instance.collection('users').doc(uID).update(
     model.toMap()
     ).then((value)async {

       call(UpdateInfoSuccessState());
     }).catchError((onError)async{
       print(onError.toString());
       call(UpdateInfoErrorState(onError.toString()));
     });
   }


}
