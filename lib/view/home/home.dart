import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/controller/home_bloc/bloc.dart';
import 'package:social_app/controller/home_bloc/states.dart';
import 'package:social_app/services/Icons.dart';
import 'package:social_app/services/widgets/constant.dart';

import '../../services/widgets/component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=> HomeBloc(),
      child: BlocConsumer<HomeBloc,HomeStates>(
        builder: (context,state){
          return ConditionalBuilder(
              condition: usermodel != null ,
              builder: (BuildContext context) {
                print("from home : ${usermodel!.email.toString()}");
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:  Column(
                  children: [
                    const Card(
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 20,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Image(
                        width: 500,
                        height: 200,
                        fit: BoxFit.cover,
                        image:
                        NetworkImage("https://alphanews.org/wp-content/uploads/2020/03/Woman.png",),

                      ),
                    ),
                    SizedBox(height: 10,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, count)=> BuildPostScreen(context),
                      itemCount: 10,

                    )
                  ],
              ),
                );
                },
              fallback: (BuildContext context) {
                return const Center(child: CircularProgressIndicator());
              },

            );
        },
        listener: (context,state){

        },
      )
    );
  }
}
