part of behavior_trees;

class Selector extends Behavior {
  List<Behavior> children;
  int currentChildIndex = 0;
  
  Selector([List<Behavior> initialChildren]) {
    if(initialChildren == null) {
      children = new List<Behavior>();
    } else {
      children = initialChildren;
    }
  }
  
  void onInitialization() {
    reset();
  }
  
  void reset() {
    currentChildIndex = 0;
  }
  
  Status onUpdate() {
    while(true) {
      var child = children[currentChildIndex];
      var result = child.update();
      if(result != Status.FAILURE) {
        reset();
        return result;
      }
      currentChildIndex++;
      if(currentChildIndex == children.length) {
        reset();
        return Status.FAILURE;
      }
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
