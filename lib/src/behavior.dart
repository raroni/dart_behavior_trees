part of behavior_trees;

abstract class Behavior<Blackboard> {
  Status status = Status.UNINITIALIZED;
  Blackboard blackboard;
  
  Behavior(Blackboard this.blackboard);
  
  Status update() {
    if(status != Status.RUNNING) onInitialization();
    status = getStatus();
    if(status != Status.RUNNING) onTermination();
    return status;
  }
  
  void reset() {
    if(status == Status.RUNNING) onTermination();
    status = Status.UNINITIALIZED;
  }
  
  Status getStatus();
  void onInitialization() { }
  void onTermination() { }
}
