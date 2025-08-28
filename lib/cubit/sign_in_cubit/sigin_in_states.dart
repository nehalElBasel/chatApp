class SignInStates {}

class NoSignInState extends SignInStates {}

// class SuccessSignIn extends SignInStates {}

class LoadingSignInState extends SignInStates {}

class FailureSignInState extends SignInStates {
  FailureSignInState(this.message);
  final String message;
}
