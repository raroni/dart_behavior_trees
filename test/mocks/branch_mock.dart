part of mocks;

class BranchMock extends Branch<SubjectMock, UpdateMock> {
  BranchMock() : super(new SubjectMock());
  
  Status getStatus(UpdateMock update) {
    return Status.FAILURE;
  }
}
