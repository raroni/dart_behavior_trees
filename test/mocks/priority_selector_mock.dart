part of mocks;

class PrioritySelectorMock extends PrioritySelector {
  PrioritySelectorMock(num childrenCount, Status childrenStatus) : super() {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
