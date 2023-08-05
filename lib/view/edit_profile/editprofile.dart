
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/controller/home_bloc/bloc.dart';
import 'package:social_app/controller/home_bloc/states.dart';
import 'package:social_app/services/Icons.dart';

import '../../controller/home_bloc/events.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';

class Editprofile extends StatelessWidget {
   Editprofile({super.key});

  final usernamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final biocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>HomeBloc(),
      child: BlocConsumer<HomeBloc,HomeStates>(
        builder: (BuildContext context, state) {
          usernamecontroller.text = usermodel!.name!;
          phonecontroller.text = usermodel!.phone!;
          biocontroller.text = usermodel!.bio!;

          return Scaffold(
            appBar: AppBar(
              leading: defultbackbutton(context),
              backgroundColor: WhiteColor,
              centerTitle: true,
              title: Text("Update Profile",style: GoogleFonts.acme(color: purpleColor ,),),
              actions: [
                TextButton(
                    onPressed: (){context.read<HomeBloc>().add(UploadProfileImageEvent());
                    },
                    child:Text("Update",style: GoogleFonts.acme(color: purpleColor),)),
                SizedBox(width: 10,),

              ],
            ),
            body: Column(
              children: [
                Container(
                  height: 250,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        topLeft: Radius.circular(4)
                                    ),
                                    image: DecorationImage(
                                      image:
                                      NetworkImage("${usermodel!.cover}",),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20, right: 20),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: purpleColor,
                                child:  IconButton(icon: Icon(IconBroken.Camera),onPressed: (){},)
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          HomeBloc.get(context).ProfileImage != null ?
                          CircleAvatar(
                            radius: 65,
                            backgroundColor: WhiteColor,
                            child:  CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                FileImage(HomeBloc.get(context).ProfileImage!,)
                            ),
                          ):  CircleAvatar(
                            radius: 65,
                            backgroundColor: WhiteColor,
                            child:  CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                NetworkImage("${usermodel!.image}",
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20, right: 20),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: purpleColor,
                                child:  IconButton(icon: Icon(IconBroken.Camera),onPressed: (){
                                  context.read<HomeBloc>().add(PickProfileImageEvent());
                                },)
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defultTextFromField(
                    controller: usernamecontroller,
                    type:  TextInputType.text,
                    validator:  (value) {
                      if (value.isEmpty)
                        return 'Enter username';
                    },
                    labeltext:  "Username", prefix: IconBroken.Profile,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defultTextFromField(
                    controller: phonecontroller,
                    type:  TextInputType.number,
                    validator:  (value) {
                      if (value.isEmpty)
                        return 'Enter Number';
                    },
                    labeltext:  "Phone Number", prefix: IconBroken.Call,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defultTextFromField(
                    controller: biocontroller,
                    type:  TextInputType.text,
                    validator:  (value) {
                      if (value.isEmpty)
                        return 'Enter Bio';
                    },
                    labeltext:  "Bio", prefix: IconBroken.Document,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
}
