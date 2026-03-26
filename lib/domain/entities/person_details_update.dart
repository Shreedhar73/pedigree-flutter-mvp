/// Fields persisted from the Main Details / editor UI.
class PersonDetailsUpdate {
  const PersonDetailsUpdate({
    required this.personId,
    required this.sex,
    required this.nodeId,
    this.age,
    this.ageUnits,
    this.height,
    this.gestAge,
    this.note,
    required this.proband,
    required this.deceased,
    required this.aw,
    required this.stillBirth,
    required this.sab,
    required this.top,
    required this.p,
    required this.donor,
    required this.surrogate,
    required this.adoptedIn,
    required this.adoptedOut,
    this.causeOfDeath,
    this.ageAtDeath,
    this.ageAtDeathUnits,
  });

  final int personId;
  final String sex;
  final int nodeId;
  final String? age;
  final String? ageUnits;
  final String? height;
  final String? gestAge;
  final String? note;
  final bool proband;
  final bool deceased;
  final bool aw;
  final bool stillBirth;
  final bool sab;
  final bool top;
  final bool p;
  final bool donor;
  final bool surrogate;
  final bool adoptedIn;
  final bool adoptedOut;
  final String? causeOfDeath;
  final String? ageAtDeath;
  final String? ageAtDeathUnits;
}
