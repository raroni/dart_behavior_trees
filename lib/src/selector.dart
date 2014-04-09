part of behavior_trees;

class Selector<Blackboard> extends Behavior<Blackboard> {
  List<Behavior> children;
  int currentChildIndex = 0;
  
  Selector(Blackboard blackboard, [List<Behavior> initialChildren]) : super(blackboard) {
    if(initialChildren == null) {
      children = new List<Behavior>();
    } else {
      children = initialChildren;
    }
  }
  
  void onInitialization() {
    reset();
  }
  
  void reset() {
    currentChildIndex = 0;
  }
  
  Status getStatus() {
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update();
      if(childStatus != Status.FAILURE) {
        if(childStatus == Status.SUCCESS) reset();
        return childStatus;
      }
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        reset();
        return Status.FAILURE;
      }
    }
  }
}
