library selector_test;

import 'package:unittest/unittest.dart';
import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("uses first running", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    selector[1].nextStatus = Status.RUNNING;
    
    var status = selector.update();
    
    expect(status, equals(Status.RUNNING));
    expect(selector[0].statusCalls, equals(1));
    expect(selector[1].statusCalls, equals(1));
    expect(selector[2].statusCalls, equals(0));
  });
  
  test("uses first success", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    selector[1].nextStatus = Status.SUCCESS;
    
    var status = selector.update();
    
    expect(status, equals(Status.SUCCESS));
    expect(selector[0].statusCalls, equals(1));
    expect(selector[1].statusCalls, equals(1));
    expect(selector[2].statusCalls, equals(0));
  });
  
  test("fails if all children fail", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    var status = selector.update();
    
    expect(status, equals(Status.FAILURE));
    expect(selector[0].statusCalls, equals(1));
    expect(selector[1].statusCalls, equals(1));
    expect(selector[2].statusCalls, equals(1));
  });
  
  test("starts over when all children fail", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    selector.update();
    selector[0].nextStatus = Status.RUNNING;
    var status = selector.update();
    expect(status, equals(Status.RUNNING));
    expect(selector[0].statusCalls, equals(2));
    expect(selector[1].statusCalls, equals(1));
    expect(selector[2].statusCalls, equals(1));
  });
  
  test("it starts over when a child succeeds", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    selector[1].nextStatus = Status.SUCCESS;
    selector.update();
    var status = selector.update();
    expect(selector[0].statusCalls, equals(2));
    expect(selector[1].statusCalls, equals(2));
    expect(selector[2].statusCalls, equals(0));
  });
  
  test("it resumes a running child", () {
    var selector = new FallbackSelectorMock(3, Status.FAILURE);
    selector[1].nextStatus = Status.RUNNING;
    selector.update();
    var status = selector.update();
    expect(selector[0].statusCalls, equals(1));
    expect(selector[1].statusCalls, equals(2));
    expect(selector[2].statusCalls, equals(0));
  });
}
