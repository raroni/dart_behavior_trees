part of behavior_trees;

class Concurrent<Blackboard> extends Behavior<Blackboard> {
  List<Behavior> children;
  int currentChildIndex;
  
  Concurrent(Blackboard blackboard, [List<Behavior> initialChildren]) : super(blackboard) {
    if(initialChildren == null) {
      children = new List<Behavior>();
    } else {
      children = initialChildren;
    }
  }
  
  void onInitialization() {
    currentChildIndex = 0;
  }
  
  Status getStatus() {
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update();
      if(childStatus == Status.FAILURE) return Status.FAILURE;
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        currentChildIndex = 0;
        return childStatus;
      }
    }
  }
}
