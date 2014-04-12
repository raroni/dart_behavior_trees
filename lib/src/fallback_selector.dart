part of behavior_trees;

class FallbackSelector<Subject> extends Behavior<Subject> {
  List<Behavior> children;
  int currentChildIndex;
  
  FallbackSelector(Subject subject, [List<Behavior> initialChildren]) : super(subject) {
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
      if(childStatus != Status.FAILURE) return childStatus;
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        return Status.FAILURE;
      }
    }
  }
}
