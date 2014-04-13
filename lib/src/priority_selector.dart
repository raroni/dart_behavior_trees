part of behavior_trees;

class PrioritySelector<Subject, Update> extends Branch<Subject, Update> {
  int currentChildIndex = 0;
  int lastChildIndex = 0;
  
  PrioritySelector(Subject subject) : super(subject);
  
  Status getStatus(Update update) {
    currentChildIndex = 0;
    while(true) {
      var child = children[currentChildIndex];
      var childStatus = child.update(update);
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
