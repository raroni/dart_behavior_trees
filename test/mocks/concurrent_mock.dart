part of mocks;

class ConcurrentMock extends Concurrent {
  ConcurrentMock(num childrenCount, Status childrenStatus) : super(new SubjectMock()) {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  BehaviorMock operator[](int index) {
    return children[index];    
  }
}
