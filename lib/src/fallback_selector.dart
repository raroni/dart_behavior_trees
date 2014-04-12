part of behavior_trees;

class FallbackSelector<Blackboard> extends Behavior<Blackboard> {
  List<Behavior> children;
  int currentChildIndex;
  
  FallbackSelector(Blackboard blackboard, [List<Behavior> initialChildren]) : super(blackboard) {
    if(initialChildren == null) {
      children = new List<Behavior>();
    } else {
      children = initialChildren;
    }
  }
  
  void onInitialization() {
    rewind();
  }
  
  void rewind() {
    currentChildIndex = 0;
  }
  
  Status getStatus() {
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update();
      if(childStatus != Status.FAILURE) {
        if(childStatus == Status.SUCCESS) rewind();
        return childStatus;
      }
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        rewind();
        return Status.FAILURE;
      }
    }
  }
}
