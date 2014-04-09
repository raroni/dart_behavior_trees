part of behavior_trees;

abstract class Behavior {
  Status status = Status.UNINITIALIZED;
  
  Status update() {
    if(status == Status.UNINITIALIZED) onInitialization();
    status = onUpdate();
    if(status != Status.RUNNING) onTermination();
    return status;
  }
  
  Status onUpdate();
  void onInitialization();
  void onTermination() { }
}
