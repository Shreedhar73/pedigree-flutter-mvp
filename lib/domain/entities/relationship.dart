class Relationship {
  const Relationship({
    required this.id,
    required this.pedigreeId,
    required this.memberAId,
    required this.memberBId,
  });

  final int id;
  final int pedigreeId;
  final int memberAId;
  final int memberBId;
}

