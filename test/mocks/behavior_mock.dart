part of mocks;

class BehaviorMock extends Behavior {
  int initializeCalls = 0;
  int terminationCalls = 0;
  int updateCalls = 0;
  Status nextStatus;
  
  BehaviorMock(Status this.nextStatus);
  
  void onInitialization() {
    initializeCalls++;
  }
  
  Status onUpdate() {
    updateCalls++;
    return nextStatus;
  }
  
  void onTermination() {
    terminationCalls++;
  }
}
