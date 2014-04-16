library cache_decorator_test;

import 'package:unittest/unittest.dart';
import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("caches result", () {
    var update = new UpdateMock(20.0);
    var behavior = new BehaviorMock(Status.RUNNING);
    var subject = new SubjectMock();
    var decorator = new CacheDecorator(subject, 60, behavior);
    
    var result = decorator.update(update);
    expect(result, Status.RUNNING);
    
    behavior.nextStatus = Status.FAILURE;
    
    result = decorator.update(update);
    expect(result, Status.RUNNING);
    
    update.nextFrameDuration = 200;
    
    result = decorator.update(update);
    expect(result, Status.FAILURE);    
  });
  
  test("calls child sparringly", () {
    var update = new UpdateMock(20.0);
    var behavior = new BehaviorMock(Status.RUNNING);
    var subject = new SubjectMock();
    var decorator = new CacheDecorator(subject, 60, behavior);
    
    for(var i=0; 6>i; i++) {
      decorator.update(update);
    }
    
    expect(behavior.statusCalls, 3);
  });
}
