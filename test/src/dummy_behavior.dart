import 'package:behavior_trees/behavior_trees.dart';

class DummyBehavior extends Behavior {
  int initializeCalls = 0;
  int terminationCalls = 0;
  int updateCalls = 0;
  Status nextStatus;
  
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
