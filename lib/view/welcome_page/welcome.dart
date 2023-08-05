import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/view/signin/login.dart';
import 'package:social_app/view/signup/signup.dart';
import '../../services/widgets/constant.dart';



class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      color: BlueColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: BlueColor,
            alignment: Alignment.center,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only( top:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("assets/images/x.jpg",
                      width: 400,height: 400,),

                  ),
                  const  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children:  [
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LogIn()),
                                );
                              },
                              child: Stack(
                                alignment:Alignment.center,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      color:  purpleColor,
                                    ),
                                  ),
                                  Text(
                                      "LOGIN",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 20,
                                            color:WhiteColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },

                              child: Stack(
                                alignment:Alignment.center,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        color:  tealColor,
                                    ),
                                  ),
                                  Text(
                                      " SIGN UP",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 20,
                                            color: WhiteColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
