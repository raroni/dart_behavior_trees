part of behavior_trees;

class Sequence extends Behavior {
  List<Behavior> children;
  int currentChildIndex = 0;
  
  Sequence(List<Behavior> this.children);
  
  void onInitialization() {
    currentChildIndex = 0;
  }
  
  Status onUpdate() {
    while(true) {
      var child = children[currentChildIndex];
      var result = child.update();
      if(result != Status.SUCCESS) return result;
      currentChildIndex++;
      if(currentChildIndex == children.length) return Status.SUCCESS;
    }
  }
}
