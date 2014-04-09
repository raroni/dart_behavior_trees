part of behavior_trees;

abstract class Behavior {
  Status status = Status.UNINITIALIZED;
  
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
