part of behavior_trees;

abstract class Branch<Subject> extends Behavior<Subject> {
  List<Behavior<Subject>> children = new List<Behavior<Subject>>();
  
  Branch(Subject subject) : super(subject);
  
  void add(Behavior<Subject> child) {
    children.add(child);   
  }
}
