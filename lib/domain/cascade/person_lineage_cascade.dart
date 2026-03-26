/// How removing a person affects their descendant persons in the pedigree.
///
/// This is the first building block for lineage-wide rules. Later you can plug
/// in hereditary traits (e.g. diagnoses, carrier status) by reacting to the
/// same deletion events—see [notifyPersonsRemovedForCascade].
enum DescendantsDeletionPolicy {
  /// Descendant persons remain in the database; unions involving the deleted
  /// person are removed and links are updated (same as before).
  retain,

  /// Delete this person and every descendant reachable through their parental
  /// unions (multi-generation).
  deleteRecursively,
}

/// Hook for future inheritance / clinical cascade (diseases, carriers, etc.).
///
/// Called after the database transaction commits for the removed [personIds].
void notifyPersonsRemovedForCascade(Iterable<int> personIds) {
  if (personIds.isEmpty) return;
  // Future: propagate hereditary diagnoses, recompute risks, audit trail, …
}
