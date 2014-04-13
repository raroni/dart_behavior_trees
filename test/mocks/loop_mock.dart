part of mocks;

class LoopMock extends Loop<SubjectMock, UpdateMock> {
  LoopMock(num childrenCount, Status childrenStatus) : super(new SubjectMock()) {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
