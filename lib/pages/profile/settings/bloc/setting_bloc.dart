

import 'package:bloc/bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_event.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(SettingEvent event,Emitter<SettingState>emit){
    emit(SettingState());


  }
}
