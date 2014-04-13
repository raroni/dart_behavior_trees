part of behavior_trees;

abstract class Behavior<Subject, Update> {
  Status status = Status.UNINITIALIZED;
  Subject subject;
  
  Behavior(Subject this.subject);
  
  Status update(Update update) {
    if(status != Status.RUNNING) onInitialization();
    status = getStatus(update);
    if(status != Status.RUNNING) onTermination();
    return status;
  }
  
  void reset() {
    if(status == Status.RUNNING) onTermination();
    status = Status.UNINITIALIZED;
  }
  
  Status getStatus(Update update);
  void onInitialization() { }
  void onTermination() { }
}
