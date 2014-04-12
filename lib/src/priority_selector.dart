part of behavior_trees;

class PrioritySelector<Subject> extends Behavior<Subject> {
  List<Behavior> children;
  int currentChildIndex = 0;
  int lastChildIndex = 0;
  
  PrioritySelector(Subject subject, [List<Behavior> initialChildren]) : super(subject) {
    if(initialChildren == null) {
      children = new List<Behavior>();
    } else {
      children = initialChildren;
    }
  }
  
  Status getStatus() {
    currentChildIndex = 0;
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update();
      if(childStatus != Status.FAILURE) {
        for(var i=currentChildIndex+1; lastChildIndex>=i; i++) {
          children[i].reset();
        }
        lastChildIndex = currentChildIndex;
        return childStatus;
      }
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        return Status.FAILURE;
      }
    }
  }
}
