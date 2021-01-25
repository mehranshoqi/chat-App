import 'package:redux/redux.dart';
import 'app_state.dart';
import 'app_reducer.dart';

createStore() => Store(
      reducer,
      initialState: new AppState.initial(),
    );
