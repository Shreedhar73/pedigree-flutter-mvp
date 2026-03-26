import 'meta.dart';
import 'person.dart';
import 'relationship.dart';

class PedigreeSnapshot {
  const PedigreeSnapshot({
    required this.pedigreeId,
    required this.meta,
    required this.people,
    required this.relationships,
    required this.relationshipChildren,
  });

  final int pedigreeId;
  final PedigreeMeta meta;
  final List<Person> people;
  final List<Relationship> relationships;

  /// relationshipId -> child personIds
  final Map<int, List<int>> relationshipChildren;

  /// Descendants reachable through any union where [personId] is a parent
  /// (recursive; does not count [personId]).
  int countDescendantPersons(int personId) {
    final visited = <int>{};
    var count = 0;
    void walk(int pid) {
      for (final r in relationships) {
        if (r.memberAId != pid && r.memberBId != pid) continue;
        for (final childId in relationshipChildren[r.id] ?? const <int>[]) {
          if (visited.add(childId)) {
            count++;
            walk(childId);
          }
        }
      }
    }

    walk(personId);
    return count;
  }
}

