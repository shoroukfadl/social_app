
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/services/Icons.dart';

import '../../services/widgets/constant.dart';
import '../edit_profile/editprofile.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 250,
          child: Stack(
            alignment: Alignment.bottomCenter,
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
                CircleAvatar(
                 radius: 65,
                 backgroundColor: WhiteColor,
                 child:  CircleAvatar(
                     radius: 60,
                     backgroundImage:
                     NetworkImage("${usermodel!.image}",
                     )
                 ),
               ),

            ],
          ),
        ),
        SizedBox(height: 8,),
        Text("${usermodel!.name}", style : GoogleFonts.acme(
            textStyle:
            const TextStyle(color: purpleColor, fontSize: 20)),),
        SizedBox(height: 5,),
        Text("${usermodel!.bio}",style : GoogleFonts.acme(
            textStyle:
            const TextStyle(color: tealColor, fontSize: 15)),),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Posts",style : GoogleFonts.acme(
                  textStyle:
                  const TextStyle(color: tealColor, fontSize: 20)),),
              Text("100", style : GoogleFonts.acme(
                textStyle:
                 TextStyle(color: BlueColor, fontSize: 15)),),
          ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Photos",style : GoogleFonts.acme(
                  textStyle:
                  const TextStyle(color: tealColor, fontSize: 20)),),
              Text("114", style : GoogleFonts.acme(
                textStyle:
                const TextStyle(color: BlueColor, fontSize: 15)),),
          ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Followers",style : GoogleFonts.acme(
                  textStyle:
                  const TextStyle(color: tealColor, fontSize: 20)),),
            Text("100k", style : GoogleFonts.acme(
                textStyle:
                const TextStyle(color: BlueColor, fontSize: 15)),),

          ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Following",style : GoogleFonts.acme(
                  textStyle:
                  const TextStyle(color: tealColor, fontSize: 20)),),
              Text("100k", style : GoogleFonts.acme(
                textStyle:
                const TextStyle(color: BlueColor, fontSize: 15)),),
          ],),
        ],),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: (){

            },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color:
                  purpleColor, width: 1.0),
                fixedSize: Size(300, 30)
              ),

              child: Text("Add Photo", style : GoogleFonts.acme(
                textStyle:
                const TextStyle(color: purpleColor, fontSize: 15)),),),
            OutlinedButton(
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Editprofile()));
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color:
                  BlueColor, width: 1.0),
                  fixedSize: Size(50, 30)
              ),

              child: Icon(IconBroken.Edit,color:
          BlueColor)),

          ],
        )
      ],
    );
  }
}
