import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> RigesterUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'week password') {
        emit(RegisterFaliure(errMessage: 'this is the Week password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFaliure(errMessage: 'this email is use k'));
      }
    } catch (e) {
      emit(RegisterFaliure(errMessage: 'there was an error ,please try again'));
    }
  }
}
