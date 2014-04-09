part of behavior_trees;

class Status {
  static const UNINITIALIZED = const Status._(0);
  static const SUCCESS = const Status._(1);
  static const FAILURE = const Status._(2);
  static const RUNNING = const Status._(3);

  final int _value;

  const Status._(this._value);
  
  String toString() {
    return "${_value}";
  }
}
