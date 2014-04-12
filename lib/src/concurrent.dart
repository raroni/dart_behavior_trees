part of behavior_trees;

class Concurrent<Subject> extends Behavior<Subject> {
  List<Behavior> children;
  int currentChildIndex;
  
  Concurrent(Subject subject, [List<Behavior> initialChildren]) : super(subject) {
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
