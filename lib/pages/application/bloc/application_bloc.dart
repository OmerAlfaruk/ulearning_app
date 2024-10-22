
import 'package:bloc/bloc.dart';
import 'application_event.dart';
import 'application_state.dart';
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(ApplicationState(index:event.index ));
    });
  }
}
