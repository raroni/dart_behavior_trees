part of mocks;

class SelectorMock extends Selector {
  SelectorMock(num childrenCount, Status childrenStatus) : super(new BlackboardMock()) {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
