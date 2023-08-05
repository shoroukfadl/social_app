import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/home_bloc/bloc.dart';
import '../../controller/home_bloc/events.dart';
import '../../controller/home_bloc/states.dart';
import '../../services/Icons.dart';
import '../../services/widgets/constant.dart';

class AppLayOut extends StatelessWidget {
  const AppLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=> HomeBloc(),
        child: BlocConsumer<HomeBloc,HomeStates>(
          builder: (context,state){
            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: WhiteColor,
                  toolbarHeight: 80,
                  title: Text("Home",
                    style: GoogleFonts.acme(color: purpleColor,fontSize: 25),),
                  actions: [
                    IconButton(onPressed: (){

                    }, icon: Icon(IconBroken.Notification,color: purpleColor,))
                    ,  IconButton(onPressed: (){

                    }, icon: Icon(IconBroken.Search,color: purpleColor,)),
                  ],
                ),
                body:HomeBloc.get(context).screens[HomeBloc.get(context).index],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: HomeBloc.get(context).index,
                selectedItemColor: tealColor,
                unselectedItemColor: purpleColor,
                iconSize: 30,
                items: const [
                  BottomNavigationBarItem(
                     icon: Icon( IconBroken.Home),
                    label: "Home",
                 ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.Chat,),
                    label: "Chats",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon( IconBroken.Paper_Upload),
                    label: "Posts",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.User1),
                    label: "Users",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.Setting),
                    label: "Setting",
                  ),
                ],
                onTap: (index){
                  context.read<HomeBloc>().add(ChangeScreenEvent(currindex: index));
                },
              ),
            );
          },
          listener: (context,state){

          },
        )
    );
  }
}
