import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
          SettingsState(
            appNotifications: false,
            emailNotifications: false,
          ),
        );


  void toggleAppNotifications(bool newValue) {
    ///You should never mutate Existing states
    ///state.appNoification = newvalue;
    ///emit(state);

    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
