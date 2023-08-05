import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{

 @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("Bloc From Transition : ${bloc.toString()} \n Transition: ${transition.toString()}  ");
  }

}