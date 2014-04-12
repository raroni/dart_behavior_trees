part of behavior_trees;

class FallbackSelector<Subject> extends Branch<Subject> {
  int currentChildIndex;
  
  FallbackSelector(Subject subject) : super(subject);
  
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
