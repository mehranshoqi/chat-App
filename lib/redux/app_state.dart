import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import './auth/auth_state.dart';

@immutable
class AppState {
  final AuthState authState;
  AppState({
    @required this.authState,
  });

  AppState copyWith({
    AuthState authState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
    );
  }
}
