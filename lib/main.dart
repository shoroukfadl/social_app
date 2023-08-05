import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/login_bloc/bloc.dart';
import 'package:social_app/controller/sign_up_bloc/bloc.dart';
import 'package:social_app/services/remote/bloc_observer.dart';
import 'package:social_app/services/remote/chache_helper.dart';
import 'package:social_app/services/widgets/constant.dart';
import 'package:social_app/view/app/app.dart';
import 'package:social_app/view/home/home.dart';
import 'package:social_app/view/signin/login.dart';
import 'package:social_app/view/signup/signup.dart';
import 'package:social_app/view/welcome_page/welcome.dart';

import 'controller/home_bloc/bloc.dart';
import 'controller/home_bloc/events.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget widget ;
  uID = CacheHelper.getData(key: "uId");
  print("ID from main : $uID ");
  if(uID != null){
    widget = AppLayOut();
  }
  else{
    widget = Welcome();
  }
  runApp( MyApp(startwidget: widget,));
}

class MyApp extends StatelessWidget {
  Widget startwidget;
   MyApp({required this.startwidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context)=>SignupBloc(),) ,
      BlocProvider(
        create: (BuildContext context)=>LoginBloc(),) ,
      BlocProvider(
        create: (BuildContext context)=>HomeBloc()..add(GetUserDataEvent()
        ))
    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  startwidget,
    ),);
  }
}


