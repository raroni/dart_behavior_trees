part of mocks;

class BehaviorMock extends Behavior<BlackboardMock> {
  int initializeCalls = 0;
  int terminationCalls = 0;
  int statusCalls = 0;
  Status nextStatus;
  
  BehaviorMock(Status this.nextStatus) : super(new BlackboardMock());
  
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
