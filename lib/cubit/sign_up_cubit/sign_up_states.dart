class SignUpStates {}

class NoSignUpState extends SignUpStates {}

// class SuccessSignUp extends SignUpStates {}

class LoadingSignUpState extends SignUpStates {}

class FailureSignUpState extends SignUpStates {
  FailureSignUpState(this.message);
  final String message;
}
