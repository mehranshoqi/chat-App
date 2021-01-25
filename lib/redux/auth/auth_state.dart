import 'package:meta/meta.dart';
import '../../model/loading.dart';
import '../../model/auth/auth_status.dart';

@immutable
class AuthState {
  final String uid;
  final String email;
  final String password;
  final AuthStatus authStatus;
  final LoadingStatus loadingStatus;
  AuthState({
    this.uid,
    this.email,
    this.password,
    this.loadingStatus,
    this.authStatus,
  });

  AuthState copyWith({
    String uid,
    String email,
    String password,
    LoadingStatus loadingStatus,
    AuthStatus authStatus,
  }) {
    return new AuthState(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  factory AuthState.initial() {
    return new AuthState(
      uid: null,
      email: '',
      password: '',
      loadingStatus: LoadingStatus.freeze,
      authStatus: AuthStatus.userSignOut,
    );
  }
}
