import 'package:unittest/unittest.dart';

import 'src/behavior_test.dart' as BehaviorTest;
import 'src/sequence_test.dart' as SequenceTest;
import 'src/fallback_selector_test.dart' as FallbackSelectorTest;
import 'src/priority_selector_test.dart' as PrioritySelectorTest;
import 'src/concurrent_test.dart' as ConcurrentTest;

main() {
  group('Behavior test', BehaviorTest.main);
  group('Sequence test', SequenceTest.main);
  group('Fallback selector test', FallbackSelectorTest.main);
  group('Priority selector test', PrioritySelectorTest.main);
  group('Concurrent test', ConcurrentTest.main);
}
