part of behavior_trees;

abstract class Branch<Subject, Update> extends Behavior<Subject, Update> {
  List<Behavior<Subject, Update>> children = new List<Behavior<Subject, Update>>();
  
  Branch(Subject subject) : super(subject);
  
  void add(Behavior<Subject, Update> child) {
    children.add(child);   
  }
}
