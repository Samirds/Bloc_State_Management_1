abstract class SignInEvent{}

class SignInTextChangedEvent extends SignInEvent{
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent({
    required this.emailValue,
    required this.passwordValue
  });
}

class SignInBTNEvent extends SignInEvent{

  final String email;
  final String password;

  SignInBTNEvent({
    required this.email,
    required this.password
  });
}