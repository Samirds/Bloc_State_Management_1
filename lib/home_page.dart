import 'dart:math';

import 'package:bloc_state_tutorial/bloc/signin_bloc.dart';
import 'package:bloc_state_tutorial/bloc/signin_event.dart';
import 'package:bloc_state_tutorial/bloc/signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              onChanged: (val){
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailValue: emailController.text, passwordValue: passwordController.text));
              },
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailValue: emailController.text, passwordValue: passwordController.text));
                },
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
              if(state is SignInILoadingState){
                return Center(child: CircularProgressIndicator());
              }
              return GestureDetector(
                onTap: (){
                  if(state is SignInValidState){
                    BlocProvider.of<SignInBloc>(context).add(SignInBTNEvent(email: emailController.text, password: passwordController.text));
                    print("hello world");
                  }

                },
                child: Container(
                  color: (state is SignInValidState) ?Colors.grey: Colors.green,
                  width: 250,
                  height: 60,
                  child: Center(
                    child: Text("Click me"),
                  ),
                ),
              );
            }),
            SizedBox(
              height: 130,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
              if(state is SignInErrorState){
                return Text("Error Message", style: TextStyle(color: Colors.red),);
              }else{
                return Container();
              }

            })

          ],
        )
      ),
    );
  }
}
