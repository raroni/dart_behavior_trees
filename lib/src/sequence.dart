part of behavior_trees;

class Sequence<Subject> extends Branch<Subject> {
  int currentChildIndex = 0;
  
  Sequence(Subject subject) : super(subject);
  
  void onInitialization() {
    currentChildIndex = 0;
  }
  
  Status getStatus() {
    while(true) {
      var child = children[currentChildIndex];
      var result = child.update();
      if(result != Status.SUCCESS) return result;
      currentChildIndex++;
      if(currentChildIndex == children.length) return Status.SUCCESS;
    }
  }
}
