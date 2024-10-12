abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFaliure extends LoginState {
  String errMessage;
  LoginFaliure({required this.errMessage});
}
