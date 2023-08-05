import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Icons.dart';
import 'constant.dart';


Widget defultTextFromField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validator,
  required String labeltext,
  required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      style: GoogleFonts.acme(color: purpleColor),
      keyboardType: type,
      validator: (s) {
        return validator(s);
      },
      decoration: InputDecoration(
          focusedErrorBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: BlueColor, width: 1)),
          enabledBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: purpleColor, width: 1)),
          errorBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: BlueColor, width: 1)),
          focusedBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: purpleColor, width: 1)),
          contentPadding: const EdgeInsets.only(left: 20),
          labelText: labeltext,
          prefixIcon: Icon(prefix,color: purpleColor,),
          errorStyle: GoogleFonts.acme(color: BlueColor),
          labelStyle: GoogleFonts.acme(
              textStyle:
                  TextStyle(color: purpleColor.withOpacity(0.8), fontSize: 13)),
          border: InputBorder.none),
      cursorColor: purpleColor,
    );

Widget defultpassTextFromField({
  required TextEditingController controller,
  required Function ontap,
  required String labeltext,
  required bool passtoggle,
  required IconData prefix
}) =>
    TextFormField(
      controller: controller,
      style: GoogleFonts.acme(color: purpleColor),
      keyboardType: TextInputType.visiblePassword,
      obscuringCharacter: ".",
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter password';
        else if (controller.text.length < 6) {
          return 'password length should not be less than 6 characters';
        }
      },
      obscureText: passtoggle,
      cursorColor: purpleColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        focusedErrorBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: BlueColor,
              width: 1,
            )),
        enabledBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: purpleColor,
              width: 1,
            )),
        errorBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: BlueColor,
              width: 1,
            )),
        focusedBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: purpleColor,
              width: 1,
            )),
        prefixIcon: Icon(prefix,color: purpleColor,),
        suffixIcon: InkWell(
          onTap: () {
            return ontap();
          },
          child: Icon(
            passtoggle
                ? IconBroken.Hide
                : IconBroken.Show,
            color: purpleColor,
            size: 20,
          ),
        ),
        labelText: labeltext,
        labelStyle: GoogleFonts.acme(
            textStyle:
                TextStyle(color: purpleColor.withOpacity(0.8), fontSize: 13)),
        focusColor: purpleColor,
        errorStyle: GoogleFonts.acme(color: BlueColor),
        border: InputBorder.none,
      ),
    );


Widget defultbackbutton(context) => IconButton(
  icon: const Icon(
    Icons.arrow_back,
    color: purpleColor,
    size: 20,
  ),
  onPressed: () {
    Navigator.pop(context);
  },
);

 Widget BuildPostScreen(context) =>  Padding(
   padding:  const EdgeInsets.all(10.0),
   child:  Card(
     child: Column (
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Row(
               children: [
                 const CircleAvatar(
                   radius: 25,
                   backgroundImage:
                     NetworkImage("https://alphanews.org/wp-content/uploads/2020/03/Woman.png",
                       )
                   ),
                 const SizedBox(width: 10,),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("UserName".toUpperCase(),style : GoogleFonts.acme(
                         textStyle:
                         const TextStyle(color: purpleColor, fontSize: 13)),),
                     Row(children: [
                     Text("date",style: GoogleFonts.acme(
                         textStyle:
                         TextStyle(color: purpleColor.withOpacity(0.8), fontSize: 13)),),
                       Text(",time",style: GoogleFonts.acme(
                           textStyle:
                           TextStyle(color: purpleColor.withOpacity(0.8), fontSize: 13)),),
                  ],)
                   ],
                 ),
               ],
             ),
             const Icon(Icons.more_horiz_rounded,color: purpleColor,),
           ],),
         ),
         Container(color: purpleColor.withOpacity(0.4),
           width: double.infinity,
           height: 1,
         ),
         Padding(
           padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 10,top: 10),
           child: Text("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",style: GoogleFonts.acme(color: tealColor),),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 10),
           child: Text("#flutter ",style: GoogleFonts.acme(color: BlueColor),),
         ),
         const Card(
           clipBehavior: Clip.antiAliasWithSaveLayer,
           elevation: 20,
           margin: EdgeInsets.symmetric(horizontal: 15),
           child: Image(
             width: double.infinity,
             height: 200,
             fit: BoxFit.cover,
             image:
             NetworkImage("https://alphanews.org/wp-content/uploads/2020/03/Woman.png",),
           ),
         ),
          Padding(
           padding:const EdgeInsets.all(10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(children: [
                 const Icon(IconBroken.Heart, color: purpleColor,size: 20,),
                 SizedBox(width: 5,),
                 Text("14",style: GoogleFonts.acme(color: tealColor,fontSize: 13),)
               ],),
               Row(children: [
                 Icon(IconBroken.Chat , color: BlueColor,size: 20,),
                 SizedBox(width: 5,),
                 Text("14 Comment",style: GoogleFonts.acme(color: tealColor,fontSize: 13),),
               ],),
             ],
           ),
         ),
         Container(color: purpleColor.withOpacity(0.4),
           width: double.infinity,
           height: 1,
         ),
         Padding(
           padding:const EdgeInsets.all(10.0),
           child: Row(
             children: [
               const CircleAvatar(
                   radius: 15,
                   backgroundImage:
                   NetworkImage("https://alphanews.org/wp-content/uploads/2020/03/Woman.png",
                   )
               ),
                SizedBox(width: 10,),
               Text("Write A Comment ...",style: GoogleFonts.acme(color: tealColor,fontSize: 13),),
             ],
           ),
         ),
         SizedBox(height: 10,),

       ]
),
   ),
 );