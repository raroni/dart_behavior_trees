part of mocks;

class FallbackSelectorMock extends FallbackSelector {
  FallbackSelectorMock(num childrenCount, Status childrenStatus) : super(new BlackboardMock()) {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
