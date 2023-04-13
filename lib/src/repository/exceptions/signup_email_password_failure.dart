class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      {this.message = "An Unknwon error occured."});
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            message: "Email is not valid or badly formatted");
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            message: "An account already exist for this email");
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
            message: "Operation is not allowed. please contact support");
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            message:
                "The user has been disabled. Please contact support for help");
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
