import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../delegate/application_mixin.dart';
import '../../delegate/networking_mixin.dart';

abstract class AppCubit<State extends Equatable> extends Cubit<State>
    with ApplicationMixin, NetworkingMixin {
  AppCubit(super.initialState);

  void init({
    Object? arguments,
  });

  void clear();
}
