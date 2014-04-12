part of mocks;

class SequenceMock extends Sequence {
  SequenceMock(int childrenCount, Status childrenStatus) : super(new SubjectMock()) {
    for(var i=0; childrenCount>i; i++) {
      children.add(new BehaviorMock(childrenStatus));
    }
  }
  
  Behavior operator[](int index) {
    return children[index];    
  }
}
