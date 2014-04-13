part of behavior_trees;

class Concurrent<Subject, Update> extends Branch<Subject, Update> {
  int currentChildIndex;
  
  Concurrent(Subject subject) : super(subject);
  
  void onInitialization() {
    currentChildIndex = 0;
  }
  
  Status getStatus(Update update) {
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update(update);
      if(childStatus == Status.FAILURE) return Status.FAILURE;
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        currentChildIndex = 0;
        return childStatus;
      }
    }
  }
}
