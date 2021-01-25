import 'app_state.dart';
import 'auth/auth_reducer.dart';

AppState reducer(AppState state, dynamic action) => new AppState(
      authState: authReducer(state.authState, action),
    );
