import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/home_bloc/states.dart';
import 'package:social_app/controller/login_bloc/bloc.dart';
import 'package:social_app/controller/login_bloc/events.dart';
import 'package:social_app/controller/login_bloc/states.dart';
import 'package:social_app/services/remote/chache_helper.dart';
import 'package:social_app/view/home/home.dart';
import '../../controller/home_bloc/bloc.dart';
import '../../controller/home_bloc/events.dart';
import '../../services/Icons.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';
import '../app/app.dart';
import '../signup/signup.dart';


class LogIn extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: BlocConsumer<LoginBloc,LoginStates>(
        builder: (context,state){
          return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
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
                              const SizedBox(height: 60,),
                              Center(
                                child: Image.asset("assets/images/y.jpg",
                                  width: 370,height: 420,),

                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),                                child: Container(
                                  width: 150,
                                  height:270 ,
                                  decoration: const BoxDecoration(
                                      color: purpleColor,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(20)
                                      )
                                  ),
                                  child:  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "L",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color:WhiteColor,
                                          fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3,
                                        ),

                                      ),
                                      Text(
                                        "O",
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
                                        "I",
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

                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:  tealColor,
                                          fixedSize: const Size(120,80),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:  Radius.circular(30),
                                                  bottomLeft:  Radius.circular(50),
                                                  bottomRight:  Radius.circular(20),
                                                  topRight:  Radius.circular(50)
                                              ))
                                      ),
                                      child: const Center(
                                        child: Icon( IconBroken.Password,color: WhiteColor,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    ConditionalBuilder(
                                      condition: state is! LoginLoadingState ,
                                      builder: (BuildContext context) {
                                        return  ElevatedButton(
                                          onPressed: () {
                                            context.read<LoginBloc>().add(Loginevent(
                                              password: passcontroller.text,
                                              email: emailcontroller.text,

                                            ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  BlueColor,
                                              fixedSize: const Size(120,80),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft:  Radius.circular(50),
                                                    bottomLeft:  Radius.circular(20),
                                                      bottomRight:  Radius.circular(50),
                                                  topRight:  Radius.circular(30)
                                                     ))
                                          ),
                                          child: const Center(
                                            child: Icon( IconBroken.Login,color: WhiteColor,
                                              size: 50,
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
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                                child:  defultpassTextFromField(
                                  controller: passcontroller,
                                  ontap: (){
                                    context.read<LoginBloc>().add(ChangeIconevent());
                                  },
                                  labeltext: "Password",
                                  passtoggle: LoginBloc.get(context).Icon, prefix: IconBroken.Lock,
                                ),
                              ),
                              const SizedBox(width: 20,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child:  Text("Create Account?" ,
                            style: TextStyle(
                                color: BlueColor,
                                fontSize: 15),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>  SignUp(),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              "SIGN UP",
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
            ),
          );
        },
        listener: (context,state){
          if(state is LoginSuccessState){
            CacheHelper.saveData(key: "uId", value: state.uid).then((value) {
              uID = CacheHelper.getData(key: "uId");
              context.read<HomeBloc>().add(GetUserDataEvent());
            }).then((value) => Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context)=> AppLayOut()),
                    (route) => false));
          }
        },
      ),
    );
  }
}
