part of mocks;

class BehaviorMock extends Behavior<SubjectMock> {
  int initializeCalls = 0;
  int terminationCalls = 0;
  int statusCalls = 0;
  Status nextStatus;
  
  BehaviorMock(Status this.nextStatus) : super(new SubjectMock());
  
  void onInitialization() {
    initializeCalls++;
  }
  
  Status getStatus() {
    statusCalls++;
    return nextStatus;
  }
  
  void onTermination() {
    terminationCalls++;
  }
}
