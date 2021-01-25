import '../../model/loading.dart';

class LoadingStatusAction {
  final LoadingStatus status;
  LoadingStatusAction({this.status});
}

class AnymousSigninAction {
  dynamic userId;
  AnymousSigninAction(this.userId);
}
