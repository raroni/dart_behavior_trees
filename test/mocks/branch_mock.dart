part of mocks;

class BranchMock extends Branch<SubjectMock> {
  BranchMock() : super(new SubjectMock());
  
  Status getStatus() {
    return Status.FAILURE;
  }
}
