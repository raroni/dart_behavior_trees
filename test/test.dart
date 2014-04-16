import 'package:unittest/unittest.dart';

import 'src/behavior_test.dart' as BehaviorTest;
import 'src/sequence_test.dart' as SequenceTest;
import 'src/loop_test.dart' as LoopTest;
import 'src/branch_test.dart' as BranchTest;
import 'src/fallback_selector_test.dart' as FallbackSelectorTest;
import 'src/priority_selector_test.dart' as PrioritySelectorTest;
import 'src/concurrent_test.dart' as ConcurrentTest;
import 'src/cache_decorator_test.dart' as CacheDecoratorTest;

main() {
  group('Behavior test', BehaviorTest.main);
  group('Branch test', BranchTest.main);
  group('Sequence test', SequenceTest.main);
  group('Loop test', LoopTest.main);
  group('Fallback selector test', FallbackSelectorTest.main);
  group('Priority selector test', PrioritySelectorTest.main);
  group('Concurrent test', ConcurrentTest.main);
  group('Cache decorator test', CacheDecoratorTest.main);
}
