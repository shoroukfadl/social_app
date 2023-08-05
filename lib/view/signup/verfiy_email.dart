import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/controller/home_bloc/bloc.dart';
import 'package:social_app/controller/home_bloc/states.dart';
import 'package:social_app/services/widgets/constant.dart';

class EmailVerfication extends StatelessWidget {
  const EmailVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=> HomeBloc(),
        child: BlocConsumer<HomeBloc,HomeStates>(
          builder: (context,state){
            return Scaffold(
                appBar: AppBar(elevation: 0,backgroundColor: WhiteColor,),
                body: ConditionalBuilder(
                  condition: true,
                  builder: (BuildContext context) {
                    //print("from home : ${model!.email.toString()}");
                    return Column(
                      children: [
                        FirebaseAuth.instance.currentUser!.emailVerified == false ?
                        Container(
                          color: purpleColor.withOpacity(0.5),
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.warning_amber_rounded, color: purpleColor),
                              Text("Verify Your Email",style: GoogleFonts.adamina(
                                color: WhiteColor,
                              ),),
                              TextButton(onPressed: () async {
                                await FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value)async{
                                  await FirebaseAuth.instance.currentUser!.reload();
                                });
                              }, child: Text('Send'))
                            ],
                          ),
                        ) :
                        Container(color: tealColor,width: 200,height: 400,)

                      ],
                    );
                  },
                  fallback: (BuildContext context) {
                    return Center(child: CircularProgressIndicator());
                  },

                )
            );
          },
          listener: (context,state){

          },
        )
    );
  }
}
