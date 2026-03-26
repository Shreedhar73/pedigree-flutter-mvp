/// Pedigree person symbol (domain).
/// Sex: M / F / U (maps to drift `people.sex`).
class Person {
  const Person({
    required this.id,
    required this.pedigreeId,
    required this.centerX,
    required this.centerY,
    this.sex,
    this.nodeId = 0,
    this.age,
    this.ageUnits,
    this.height,
    this.gestAge,
    this.note,
    this.proband = false,
    this.deceased = false,
    this.aw = false,
    this.stillBirth = false,
    this.sab = false,
    this.top = false,
    this.p = false,
    this.donor = false,
    this.surrogate = false,
    this.adoptedIn = false,
    this.adoptedOut = false,
    this.causeOfDeath,
    this.ageAtDeath,
    this.ageAtDeathUnits,
  });

  final int id;
  final int pedigreeId;
  final double centerX;
  final double centerY;

  /// 'M' | 'F' | 'U'
  final String? sex;

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

  Person copyWith({
    double? centerX,
    double? centerY,
    String? sex,
    int? nodeId,
    String? age,
    String? ageUnits,
    String? height,
    String? gestAge,
    String? note,
    bool? proband,
    bool? deceased,
    bool? aw,
    bool? stillBirth,
    bool? sab,
    bool? top,
    bool? p,
    bool? donor,
    bool? surrogate,
    bool? adoptedIn,
    bool? adoptedOut,
    String? causeOfDeath,
    String? ageAtDeath,
    String? ageAtDeathUnits,
  }) {
    return Person(
      id: id,
      pedigreeId: pedigreeId,
      centerX: centerX ?? this.centerX,
      centerY: centerY ?? this.centerY,
      sex: sex ?? this.sex,
      nodeId: nodeId ?? this.nodeId,
      age: age ?? this.age,
      ageUnits: ageUnits ?? this.ageUnits,
      height: height ?? this.height,
      gestAge: gestAge ?? this.gestAge,
      note: note ?? this.note,
      proband: proband ?? this.proband,
      deceased: deceased ?? this.deceased,
      aw: aw ?? this.aw,
      stillBirth: stillBirth ?? this.stillBirth,
      sab: sab ?? this.sab,
      top: top ?? this.top,
      p: p ?? this.p,
      donor: donor ?? this.donor,
      surrogate: surrogate ?? this.surrogate,
      adoptedIn: adoptedIn ?? this.adoptedIn,
      adoptedOut: adoptedOut ?? this.adoptedOut,
      causeOfDeath: causeOfDeath ?? this.causeOfDeath,
      ageAtDeath: ageAtDeath ?? this.ageAtDeath,
      ageAtDeathUnits: ageAtDeathUnits ?? this.ageAtDeathUnits,
    );
  }
}
