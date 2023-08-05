import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/sign_up_bloc/bloc.dart';
import 'package:social_app/controller/sign_up_bloc/events.dart';
import '../../controller/sign_up_bloc/states.dart';
import '../../services/Icons.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';
import '../signin/login.dart';


class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=> SignupBloc(),
      child: BlocConsumer<SignupBloc,SignupStates>(
        builder: (context,state){
          return Card(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40,),
                            Center(
                              child: Image.asset("assets/images/z.jpg",
                                width: 370,height: 420,),

                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height:270 ,
                              decoration: const BoxDecoration(
                                  color: BlueColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(60),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child:   const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "S",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),
                                  Text(
                                    "I",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),
                                  Text(
                                    "G",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),
                                  Text(
                                    "N",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),
                                  Text(
                                    "U",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),
                                  Text(
                                    "P",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color:WhiteColor,
                                      fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                    ),

                                  ),


                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            ConditionalBuilder(
                              condition: state is! SignupLoadingState,
                              builder: (BuildContext context) {
                                return  Padding(
                                  padding: const EdgeInsets.only(right: 15),                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<SignupBloc>().add(
                                          Signupevent(
                                            username: usernamecontroller.text,
                                            phone: phonecontroller.text,
                                            password: passcontroller.text,
                                            email: emailcontroller.text,

                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:  purpleColor,
                                        fixedSize: const Size(120,80),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft:  Radius.circular(30),
                                                bottomLeft:  Radius.circular(50),
                                                bottomRight:  Radius.circular(20),
                                                topRight:  Radius.circular(50)
                                            ))
                                    ),
                                    child: const Icon( IconBroken.Add_User,color: WhiteColor,
                                    size: 40,

                                  ),
                                  ),
                                );
                              },
                              fallback: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Expanded(
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
                            const SizedBox(width: 20,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Expanded(
                              child: defultTextFromField(
                                controller: emailcontroller,
                                type:  TextInputType.emailAddress,
                                validator:  (value) {
                                  bool emailvalid=
                                  RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
                                  if (value.isEmpty)
                                    return 'Enter Email';
                                  if(!emailvalid)
                                  {
                                    return 'Enter valid Email';
                                  }
                                },
                                labeltext:  "Email Address", prefix: IconBroken.Message,
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Expanded(
                              child: defultTextFromField(
                                controller: phonecontroller,
                                type:  TextInputType.number,
                                validator:  (value) {
                                  if (value.isEmpty)
                                    return 'Enter phone number';

                                },
                                labeltext:  "Phone", prefix: IconBroken.Call,
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Expanded(
                              child:  defultpassTextFromField(
                                controller: passcontroller,
                                ontap: (){
                                },
                                labeltext: "Password",
                                passtoggle: true, prefix: IconBroken.Lock,
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child:  Text("Have An Account?" ,
                          style: TextStyle(
                              color: BlueColor,
                              fontSize: 15),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>  LogIn(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }, listener: (context,state){
              if(state is SignupSuccessState){
                    // showToast(
                    //   '$state',
                    //   context: context,
                    //   animation: StyledToastAnimation.scale,
                    //   reverseAnimation: StyledToastAnimation.fade,
                    //   position: StyledToastPosition.center,
                    //   animDuration: Duration(seconds: 1),
                    //   duration: Duration(seconds: 4),
                    //   curve: Curves.elasticOut,
                    //   reverseCurve: Curves.linear,
                    // );
              }
        },
    )
    );

  }
}
