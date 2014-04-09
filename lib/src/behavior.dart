part of behavior_trees;

abstract class Behavior<Blackboard> {
  Status status = Status.UNINITIALIZED;
  Blackboard blackboard;
  
  Behavior(Blackboard this.blackboard);
  
  Status update() {
    if(status == Status.UNINITIALIZED) onInitialization();
    status = getStatus();
    if(status != Status.RUNNING) onTermination();
    return status;
  }
  
  Status getStatus();
  void onInitialization();
  void onTermination() { }
}
