part of behavior_trees;

class FallbackSelector<Subject, Update> extends Branch<Subject, Update> {
  int currentChildIndex;
  
  FallbackSelector(Subject subject) : super(subject);
  
  void onInitialization() {
    currentChildIndex = 0;
  }
  
  Status getStatus(Update update) {
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update(update);
      if(childStatus != Status.FAILURE) return childStatus;
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        return Status.FAILURE;
      }
    }
  }
}
