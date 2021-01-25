import 'package:redux/redux.dart';
import 'auth_action.dart';
import 'auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, LoadingStatusAction>(_setLoadingStatus),
  TypedReducer<AuthState, AnymousSigninAction>(_anymousSignInReducer),
]);

AuthState _setLoadingStatus(
  AuthState state,
  LoadingStatusAction action,
) {
  return state.copyWith(
    loadingStatus: action.status,
  );
}

AuthState _anymousSignInReducer(
  AuthState state,
  AnymousSigninAction action,
) {
  return state.copyWith(
    uid: action.userId,
  );
}
