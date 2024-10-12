import 'package:bloc/bloc.dart';
import 'package:caht_appreview/views/cubits/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFaliure(errMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFaliure(errMessage: 'wrong password'));
      }
    } on Exception catch (e) {
      emit(LoginFaliure(errMessage: 'there was an error'));
    }
  }
}
