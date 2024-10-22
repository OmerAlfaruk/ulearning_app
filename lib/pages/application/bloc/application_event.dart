

abstract class ApplicationEvent {
  const ApplicationEvent();

}
class TriggerAppEvent extends ApplicationEvent{
  final int index;

  TriggerAppEvent(this.index):super();
}
