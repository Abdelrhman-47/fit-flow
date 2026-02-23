import 'package:bloc/bloc.dart';
import 'package:fit_flow/featuers/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthRepo _authRepo;
  AuthCubitCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(AuthCubitInitial());
  Future<void> signIn({required String email, required String password}) async {
    emit(AuthCubitLoading());
    final result = await _authRepo.signIn(email, password);
    result.fold(
      (l) => emit(AuthCubitError(error: l.message)),
      (r) => emit(AuthCubitSuccess()),
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthCubitLoading());
    final result = await _authRepo.signUp(email, password);
    result.fold(
      (l) => emit(AuthCubitError(error: l.message)),
      (r) => emit(AuthCubitSuccess()),
    );
  }

  Future<void> signOut() async {
    emit(AuthCubitLoading());
    final result = await _authRepo.signOut();
    result.fold(
      (l) => emit(AuthCubitError(error: l.message)),
      (r) => emit(AuthCubitSuccess()),
    );
  }
}
