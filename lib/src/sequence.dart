part of behavior_trees;

class Sequence<Blackboard> extends Behavior<Blackboard> {
  List<Behavior> children;
  int currentChildIndex = 0;
  
  Sequence(Blackboard blackboard, List<Behavior> this.children) : super(blackboard);
  
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
