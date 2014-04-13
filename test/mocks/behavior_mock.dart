part of mocks;

class BehaviorMock extends Behavior<SubjectMock, UpdateMock> {
  int initializeCalls = 0;
  int terminationCalls = 0;
  int statusCalls = 0;
  Status nextStatus;
  
  BehaviorMock([Status this.nextStatus = Status.FAILURE]) : super(new SubjectMock());
  
  void onInitialization() {
    initializeCalls++;
  }
  
  Status getStatus(UpdateMock update) {
    statusCalls++;
    return nextStatus;
  }
  
  void onTermination() {
    terminationCalls++;
  }
}
