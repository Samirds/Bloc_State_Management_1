import 'package:bloc_state_tutorial/bloc/signin_event.dart';
import 'package:bloc_state_tutorial/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc(): super(SignInInitialState()){      // super is used to initialize the parent class here Bloc , and bloc needs a state to initialize like required

    on<SignInTextChangedEvent>((event, emit) {
      if(event.emailValue ==""){
        emit(SignInErrorState(errorMessage: "Please Enter",)
        );
      }
      else if(event.passwordValue.length< 7){
        emit(SignInErrorState(errorMessage: "Please ",));
      }
      else{
        emit(
          SignInValidState()
        );
      }
    });


    on<SignInBTNEvent>((event, emit) {
      emit(SignInILoadingState());
    });
    
  }
}