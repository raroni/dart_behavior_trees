part of behavior_trees;

class Sequence<Subject> extends Behavior<Subject> {
  List<Behavior> children;
  int currentChildIndex = 0;
  
  Sequence(Subject subject, [List<Behavior> initialChildren]) : super(subject) {
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
      var result = child.update();
      if(result != Status.SUCCESS) return result;
      currentChildIndex++;
      if(currentChildIndex == children.length) return Status.SUCCESS;
    }
  }
}
