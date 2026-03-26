// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PedigreesTable extends Pedigrees
    with TableInfo<$PedigreesTable, Pedigree> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PedigreesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pedigrees';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pedigree> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pedigree map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pedigree(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $PedigreesTable createAlias(String alias) {
    return $PedigreesTable(attachedDatabase, alias);
  }
}

class Pedigree extends DataClass implements Insertable<Pedigree> {
  final int id;
  final int? createdAt;
  const Pedigree({required this.id, this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<int>(createdAt);
    }
    return map;
  }

  PedigreesCompanion toCompanion(bool nullToAbsent) {
    return PedigreesCompanion(
      id: Value(id),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Pedigree.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pedigree(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<int?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<int?>(createdAt),
    };
  }

  Pedigree copyWith({int? id, Value<int?> createdAt = const Value.absent()}) =>
      Pedigree(
        id: id ?? this.id,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  Pedigree copyWithCompanion(PedigreesCompanion data) {
    return Pedigree(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pedigree(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pedigree &&
          other.id == this.id &&
          other.createdAt == this.createdAt);
}

class PedigreesCompanion extends UpdateCompanion<Pedigree> {
  final Value<int> id;
  final Value<int?> createdAt;
  const PedigreesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PedigreesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Pedigree> custom({
    Expression<int>? id,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PedigreesCompanion copyWith({Value<int>? id, Value<int?>? createdAt}) {
    return PedigreesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PedigreesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RelationshipsTable extends Relationships
    with TableInfo<$RelationshipsTable, Relationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pedigreeIdMeta = const VerificationMeta(
    'pedigreeId',
  );
  @override
  late final GeneratedColumn<int> pedigreeId = GeneratedColumn<int>(
    'pedigree_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pedigrees (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<int> active = GeneratedColumn<int>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _consanguinousMeta = const VerificationMeta(
    'consanguinous',
  );
  @override
  late final GeneratedColumn<int> consanguinous = GeneratedColumn<int>(
    'consanguinous',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _consanguinityDegreeMeta =
      const VerificationMeta('consanguinityDegree');
  @override
  late final GeneratedColumn<String> consanguinityDegree =
      GeneratedColumn<String>(
        'consanguinity_degree',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _noChildrenByChoiceMeta =
      const VerificationMeta('noChildrenByChoice');
  @override
  late final GeneratedColumn<int> noChildrenByChoice = GeneratedColumn<int>(
    'no_children_by_choice',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noChildrenInfertilityMeta =
      const VerificationMeta('noChildrenInfertility');
  @override
  late final GeneratedColumn<int> noChildrenInfertility = GeneratedColumn<int>(
    'no_children_infertility',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pedigreeId,
    active,
    consanguinous,
    consanguinityDegree,
    noChildrenByChoice,
    noChildrenInfertility,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationships';
  @override
  VerificationContext validateIntegrity(
    Insertable<Relationship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pedigree_id')) {
      context.handle(
        _pedigreeIdMeta,
        pedigreeId.isAcceptableOrUnknown(data['pedigree_id']!, _pedigreeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pedigreeIdMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('consanguinous')) {
      context.handle(
        _consanguinousMeta,
        consanguinous.isAcceptableOrUnknown(
          data['consanguinous']!,
          _consanguinousMeta,
        ),
      );
    }
    if (data.containsKey('consanguinity_degree')) {
      context.handle(
        _consanguinityDegreeMeta,
        consanguinityDegree.isAcceptableOrUnknown(
          data['consanguinity_degree']!,
          _consanguinityDegreeMeta,
        ),
      );
    }
    if (data.containsKey('no_children_by_choice')) {
      context.handle(
        _noChildrenByChoiceMeta,
        noChildrenByChoice.isAcceptableOrUnknown(
          data['no_children_by_choice']!,
          _noChildrenByChoiceMeta,
        ),
      );
    }
    if (data.containsKey('no_children_infertility')) {
      context.handle(
        _noChildrenInfertilityMeta,
        noChildrenInfertility.isAcceptableOrUnknown(
          data['no_children_infertility']!,
          _noChildrenInfertilityMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Relationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Relationship(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pedigreeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pedigree_id'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active'],
      )!,
      consanguinous: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}consanguinous'],
      )!,
      consanguinityDegree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consanguinity_degree'],
      ),
      noChildrenByChoice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_children_by_choice'],
      )!,
      noChildrenInfertility: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_children_infertility'],
      )!,
    );
  }

  @override
  $RelationshipsTable createAlias(String alias) {
    return $RelationshipsTable(attachedDatabase, alias);
  }
}

class Relationship extends DataClass implements Insertable<Relationship> {
  final int id;
  final int pedigreeId;
  final int active;
  final int consanguinous;
  final String? consanguinityDegree;
  final int noChildrenByChoice;
  final int noChildrenInfertility;
  const Relationship({
    required this.id,
    required this.pedigreeId,
    required this.active,
    required this.consanguinous,
    this.consanguinityDegree,
    required this.noChildrenByChoice,
    required this.noChildrenInfertility,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pedigree_id'] = Variable<int>(pedigreeId);
    map['active'] = Variable<int>(active);
    map['consanguinous'] = Variable<int>(consanguinous);
    if (!nullToAbsent || consanguinityDegree != null) {
      map['consanguinity_degree'] = Variable<String>(consanguinityDegree);
    }
    map['no_children_by_choice'] = Variable<int>(noChildrenByChoice);
    map['no_children_infertility'] = Variable<int>(noChildrenInfertility);
    return map;
  }

  RelationshipsCompanion toCompanion(bool nullToAbsent) {
    return RelationshipsCompanion(
      id: Value(id),
      pedigreeId: Value(pedigreeId),
      active: Value(active),
      consanguinous: Value(consanguinous),
      consanguinityDegree: consanguinityDegree == null && nullToAbsent
          ? const Value.absent()
          : Value(consanguinityDegree),
      noChildrenByChoice: Value(noChildrenByChoice),
      noChildrenInfertility: Value(noChildrenInfertility),
    );
  }

  factory Relationship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relationship(
      id: serializer.fromJson<int>(json['id']),
      pedigreeId: serializer.fromJson<int>(json['pedigreeId']),
      active: serializer.fromJson<int>(json['active']),
      consanguinous: serializer.fromJson<int>(json['consanguinous']),
      consanguinityDegree: serializer.fromJson<String?>(
        json['consanguinityDegree'],
      ),
      noChildrenByChoice: serializer.fromJson<int>(json['noChildrenByChoice']),
      noChildrenInfertility: serializer.fromJson<int>(
        json['noChildrenInfertility'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pedigreeId': serializer.toJson<int>(pedigreeId),
      'active': serializer.toJson<int>(active),
      'consanguinous': serializer.toJson<int>(consanguinous),
      'consanguinityDegree': serializer.toJson<String?>(consanguinityDegree),
      'noChildrenByChoice': serializer.toJson<int>(noChildrenByChoice),
      'noChildrenInfertility': serializer.toJson<int>(noChildrenInfertility),
    };
  }

  Relationship copyWith({
    int? id,
    int? pedigreeId,
    int? active,
    int? consanguinous,
    Value<String?> consanguinityDegree = const Value.absent(),
    int? noChildrenByChoice,
    int? noChildrenInfertility,
  }) => Relationship(
    id: id ?? this.id,
    pedigreeId: pedigreeId ?? this.pedigreeId,
    active: active ?? this.active,
    consanguinous: consanguinous ?? this.consanguinous,
    consanguinityDegree: consanguinityDegree.present
        ? consanguinityDegree.value
        : this.consanguinityDegree,
    noChildrenByChoice: noChildrenByChoice ?? this.noChildrenByChoice,
    noChildrenInfertility: noChildrenInfertility ?? this.noChildrenInfertility,
  );
  Relationship copyWithCompanion(RelationshipsCompanion data) {
    return Relationship(
      id: data.id.present ? data.id.value : this.id,
      pedigreeId: data.pedigreeId.present
          ? data.pedigreeId.value
          : this.pedigreeId,
      active: data.active.present ? data.active.value : this.active,
      consanguinous: data.consanguinous.present
          ? data.consanguinous.value
          : this.consanguinous,
      consanguinityDegree: data.consanguinityDegree.present
          ? data.consanguinityDegree.value
          : this.consanguinityDegree,
      noChildrenByChoice: data.noChildrenByChoice.present
          ? data.noChildrenByChoice.value
          : this.noChildrenByChoice,
      noChildrenInfertility: data.noChildrenInfertility.present
          ? data.noChildrenInfertility.value
          : this.noChildrenInfertility,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Relationship(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('active: $active, ')
          ..write('consanguinous: $consanguinous, ')
          ..write('consanguinityDegree: $consanguinityDegree, ')
          ..write('noChildrenByChoice: $noChildrenByChoice, ')
          ..write('noChildrenInfertility: $noChildrenInfertility')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pedigreeId,
    active,
    consanguinous,
    consanguinityDegree,
    noChildrenByChoice,
    noChildrenInfertility,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relationship &&
          other.id == this.id &&
          other.pedigreeId == this.pedigreeId &&
          other.active == this.active &&
          other.consanguinous == this.consanguinous &&
          other.consanguinityDegree == this.consanguinityDegree &&
          other.noChildrenByChoice == this.noChildrenByChoice &&
          other.noChildrenInfertility == this.noChildrenInfertility);
}

class RelationshipsCompanion extends UpdateCompanion<Relationship> {
  final Value<int> id;
  final Value<int> pedigreeId;
  final Value<int> active;
  final Value<int> consanguinous;
  final Value<String?> consanguinityDegree;
  final Value<int> noChildrenByChoice;
  final Value<int> noChildrenInfertility;
  const RelationshipsCompanion({
    this.id = const Value.absent(),
    this.pedigreeId = const Value.absent(),
    this.active = const Value.absent(),
    this.consanguinous = const Value.absent(),
    this.consanguinityDegree = const Value.absent(),
    this.noChildrenByChoice = const Value.absent(),
    this.noChildrenInfertility = const Value.absent(),
  });
  RelationshipsCompanion.insert({
    this.id = const Value.absent(),
    required int pedigreeId,
    this.active = const Value.absent(),
    this.consanguinous = const Value.absent(),
    this.consanguinityDegree = const Value.absent(),
    this.noChildrenByChoice = const Value.absent(),
    this.noChildrenInfertility = const Value.absent(),
  }) : pedigreeId = Value(pedigreeId);
  static Insertable<Relationship> custom({
    Expression<int>? id,
    Expression<int>? pedigreeId,
    Expression<int>? active,
    Expression<int>? consanguinous,
    Expression<String>? consanguinityDegree,
    Expression<int>? noChildrenByChoice,
    Expression<int>? noChildrenInfertility,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pedigreeId != null) 'pedigree_id': pedigreeId,
      if (active != null) 'active': active,
      if (consanguinous != null) 'consanguinous': consanguinous,
      if (consanguinityDegree != null)
        'consanguinity_degree': consanguinityDegree,
      if (noChildrenByChoice != null)
        'no_children_by_choice': noChildrenByChoice,
      if (noChildrenInfertility != null)
        'no_children_infertility': noChildrenInfertility,
    });
  }

  RelationshipsCompanion copyWith({
    Value<int>? id,
    Value<int>? pedigreeId,
    Value<int>? active,
    Value<int>? consanguinous,
    Value<String?>? consanguinityDegree,
    Value<int>? noChildrenByChoice,
    Value<int>? noChildrenInfertility,
  }) {
    return RelationshipsCompanion(
      id: id ?? this.id,
      pedigreeId: pedigreeId ?? this.pedigreeId,
      active: active ?? this.active,
      consanguinous: consanguinous ?? this.consanguinous,
      consanguinityDegree: consanguinityDegree ?? this.consanguinityDegree,
      noChildrenByChoice: noChildrenByChoice ?? this.noChildrenByChoice,
      noChildrenInfertility:
          noChildrenInfertility ?? this.noChildrenInfertility,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pedigreeId.present) {
      map['pedigree_id'] = Variable<int>(pedigreeId.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (consanguinous.present) {
      map['consanguinous'] = Variable<int>(consanguinous.value);
    }
    if (consanguinityDegree.present) {
      map['consanguinity_degree'] = Variable<String>(consanguinityDegree.value);
    }
    if (noChildrenByChoice.present) {
      map['no_children_by_choice'] = Variable<int>(noChildrenByChoice.value);
    }
    if (noChildrenInfertility.present) {
      map['no_children_infertility'] = Variable<int>(
        noChildrenInfertility.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipsCompanion(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('active: $active, ')
          ..write('consanguinous: $consanguinous, ')
          ..write('consanguinityDegree: $consanguinityDegree, ')
          ..write('noChildrenByChoice: $noChildrenByChoice, ')
          ..write('noChildrenInfertility: $noChildrenInfertility')
          ..write(')'))
        .toString();
  }
}

class $PregnanciesTable extends Pregnancies
    with TableInfo<$PregnanciesTable, Pregnancy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PregnanciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMsMeta = const VerificationMeta('dateMs');
  @override
  late final GeneratedColumn<int> dateMs = GeneratedColumn<int>(
    'date_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dateMs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pregnancies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pregnancy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_ms')) {
      context.handle(
        _dateMsMeta,
        dateMs.isAcceptableOrUnknown(data['date_ms']!, _dateMsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pregnancy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pregnancy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dateMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date_ms'],
      ),
    );
  }

  @override
  $PregnanciesTable createAlias(String alias) {
    return $PregnanciesTable(attachedDatabase, alias);
  }
}

class Pregnancy extends DataClass implements Insertable<Pregnancy> {
  final int id;
  final int? dateMs;
  const Pregnancy({required this.id, this.dateMs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || dateMs != null) {
      map['date_ms'] = Variable<int>(dateMs);
    }
    return map;
  }

  PregnanciesCompanion toCompanion(bool nullToAbsent) {
    return PregnanciesCompanion(
      id: Value(id),
      dateMs: dateMs == null && nullToAbsent
          ? const Value.absent()
          : Value(dateMs),
    );
  }

  factory Pregnancy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pregnancy(
      id: serializer.fromJson<int>(json['id']),
      dateMs: serializer.fromJson<int?>(json['dateMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateMs': serializer.toJson<int?>(dateMs),
    };
  }

  Pregnancy copyWith({int? id, Value<int?> dateMs = const Value.absent()}) =>
      Pregnancy(
        id: id ?? this.id,
        dateMs: dateMs.present ? dateMs.value : this.dateMs,
      );
  Pregnancy copyWithCompanion(PregnanciesCompanion data) {
    return Pregnancy(
      id: data.id.present ? data.id.value : this.id,
      dateMs: data.dateMs.present ? data.dateMs.value : this.dateMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pregnancy(')
          ..write('id: $id, ')
          ..write('dateMs: $dateMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pregnancy &&
          other.id == this.id &&
          other.dateMs == this.dateMs);
}

class PregnanciesCompanion extends UpdateCompanion<Pregnancy> {
  final Value<int> id;
  final Value<int?> dateMs;
  const PregnanciesCompanion({
    this.id = const Value.absent(),
    this.dateMs = const Value.absent(),
  });
  PregnanciesCompanion.insert({
    this.id = const Value.absent(),
    this.dateMs = const Value.absent(),
  });
  static Insertable<Pregnancy> custom({
    Expression<int>? id,
    Expression<int>? dateMs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateMs != null) 'date_ms': dateMs,
    });
  }

  PregnanciesCompanion copyWith({Value<int>? id, Value<int?>? dateMs}) {
    return PregnanciesCompanion(
      id: id ?? this.id,
      dateMs: dateMs ?? this.dateMs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateMs.present) {
      map['date_ms'] = Variable<int>(dateMs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PregnanciesCompanion(')
          ..write('id: $id, ')
          ..write('dateMs: $dateMs')
          ..write(')'))
        .toString();
  }
}

class $NletsTable extends Nlets with TableInfo<$NletsTable, Nlet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NletsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nlets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Nlet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Nlet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Nlet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $NletsTable createAlias(String alias) {
    return $NletsTable(attachedDatabase, alias);
  }
}

class Nlet extends DataClass implements Insertable<Nlet> {
  final int id;
  const Nlet({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  NletsCompanion toCompanion(bool nullToAbsent) {
    return NletsCompanion(id: Value(id));
  }

  factory Nlet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nlet(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  Nlet copyWith({int? id}) => Nlet(id: id ?? this.id);
  Nlet copyWithCompanion(NletsCompanion data) {
    return Nlet(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('Nlet(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Nlet && other.id == this.id);
}

class NletsCompanion extends UpdateCompanion<Nlet> {
  final Value<int> id;
  const NletsCompanion({this.id = const Value.absent()});
  NletsCompanion.insert({this.id = const Value.absent()});
  static Insertable<Nlet> custom({Expression<int>? id}) {
    return RawValuesInsertable({if (id != null) 'id': id});
  }

  NletsCompanion copyWith({Value<int>? id}) {
    return NletsCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NletsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $PeopleTable extends People with TableInfo<$PeopleTable, PeopleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeopleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pedigreeIdMeta = const VerificationMeta(
    'pedigreeId',
  );
  @override
  late final GeneratedColumn<int> pedigreeId = GeneratedColumn<int>(
    'pedigree_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pedigrees (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<int> nodeId = GeneratedColumn<int>(
    'node_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _centerXMeta = const VerificationMeta(
    'centerX',
  );
  @override
  late final GeneratedColumn<double> centerX = GeneratedColumn<double>(
    'center_x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _centerYMeta = const VerificationMeta(
    'centerY',
  );
  @override
  late final GeneratedColumn<double> centerY = GeneratedColumn<double>(
    'center_y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1'),
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageUnitsMeta = const VerificationMeta(
    'ageUnits',
  );
  @override
  late final GeneratedColumn<String> ageUnits = GeneratedColumn<String>(
    'age_units',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<String> height = GeneratedColumn<String>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gestAgeMeta = const VerificationMeta(
    'gestAge',
  );
  @override
  late final GeneratedColumn<String> gestAge = GeneratedColumn<String>(
    'gest_age',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _probandMeta = const VerificationMeta(
    'proband',
  );
  @override
  late final GeneratedColumn<int> proband = GeneratedColumn<int>(
    'proband',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deceasedMeta = const VerificationMeta(
    'deceased',
  );
  @override
  late final GeneratedColumn<int> deceased = GeneratedColumn<int>(
    'deceased',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _awMeta = const VerificationMeta('aw');
  @override
  late final GeneratedColumn<int> aw = GeneratedColumn<int>(
    'aw',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stillBirthMeta = const VerificationMeta(
    'stillBirth',
  );
  @override
  late final GeneratedColumn<int> stillBirth = GeneratedColumn<int>(
    'still_birth',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sabMeta = const VerificationMeta('sab');
  @override
  late final GeneratedColumn<int> sab = GeneratedColumn<int>(
    'sab',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _topMeta = const VerificationMeta('top');
  @override
  late final GeneratedColumn<int> top = GeneratedColumn<int>(
    'top',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<int> p = GeneratedColumn<int>(
    'p',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _donorMeta = const VerificationMeta('donor');
  @override
  late final GeneratedColumn<int> donor = GeneratedColumn<int>(
    'donor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _surrogateMeta = const VerificationMeta(
    'surrogate',
  );
  @override
  late final GeneratedColumn<int> surrogate = GeneratedColumn<int>(
    'surrogate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _adoptedInMeta = const VerificationMeta(
    'adoptedIn',
  );
  @override
  late final GeneratedColumn<int> adoptedIn = GeneratedColumn<int>(
    'adopted_in',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _adoptedOutMeta = const VerificationMeta(
    'adoptedOut',
  );
  @override
  late final GeneratedColumn<int> adoptedOut = GeneratedColumn<int>(
    'adopted_out',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noChildrenByChoiceMeta =
      const VerificationMeta('noChildrenByChoice');
  @override
  late final GeneratedColumn<int> noChildrenByChoice = GeneratedColumn<int>(
    'no_children_by_choice',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noChildrenInfertilityMeta =
      const VerificationMeta('noChildrenInfertility');
  @override
  late final GeneratedColumn<int> noChildrenInfertility = GeneratedColumn<int>(
    'no_children_infertility',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _infertilityReasonMeta = const VerificationMeta(
    'infertilityReason',
  );
  @override
  late final GeneratedColumn<String> infertilityReason =
      GeneratedColumn<String>(
        'infertility_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _carriedBySurrogateMeta =
      const VerificationMeta('carriedBySurrogate');
  @override
  late final GeneratedColumn<int> carriedBySurrogate = GeneratedColumn<int>(
    'carried_by_surrogate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ageAtDeathMeta = const VerificationMeta(
    'ageAtDeath',
  );
  @override
  late final GeneratedColumn<String> ageAtDeath = GeneratedColumn<String>(
    'age_at_death',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageAtDeathUnitsMeta = const VerificationMeta(
    'ageAtDeathUnits',
  );
  @override
  late final GeneratedColumn<String> ageAtDeathUnits = GeneratedColumn<String>(
    'age_at_death_units',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _causeOfDeathMeta = const VerificationMeta(
    'causeOfDeath',
  );
  @override
  late final GeneratedColumn<String> causeOfDeath = GeneratedColumn<String>(
    'cause_of_death',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _causeOfDeathOntologyMeta =
      const VerificationMeta('causeOfDeathOntology');
  @override
  late final GeneratedColumn<String> causeOfDeathOntology =
      GeneratedColumn<String>(
        'cause_of_death_ontology',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _causeOfDeathOntologyIdMeta =
      const VerificationMeta('causeOfDeathOntologyId');
  @override
  late final GeneratedColumn<String> causeOfDeathOntologyId =
      GeneratedColumn<String>(
        'cause_of_death_ontology_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _causeOfDeathOntologyVersionMeta =
      const VerificationMeta('causeOfDeathOntologyVersion');
  @override
  late final GeneratedColumn<String> causeOfDeathOntologyVersion =
      GeneratedColumn<String>(
        'cause_of_death_ontology_version',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _affected1Meta = const VerificationMeta(
    'affected1',
  );
  @override
  late final GeneratedColumn<int> affected1 = GeneratedColumn<int>(
    'affected1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _affected2Meta = const VerificationMeta(
    'affected2',
  );
  @override
  late final GeneratedColumn<int> affected2 = GeneratedColumn<int>(
    'affected2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _affected3Meta = const VerificationMeta(
    'affected3',
  );
  @override
  late final GeneratedColumn<int> affected3 = GeneratedColumn<int>(
    'affected3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _affected4Meta = const VerificationMeta(
    'affected4',
  );
  @override
  late final GeneratedColumn<int> affected4 = GeneratedColumn<int>(
    'affected4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _affected1DxAgeMeta = const VerificationMeta(
    'affected1DxAge',
  );
  @override
  late final GeneratedColumn<double> affected1DxAge = GeneratedColumn<double>(
    'affected1_dx_age',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affected2DxAgeMeta = const VerificationMeta(
    'affected2DxAge',
  );
  @override
  late final GeneratedColumn<double> affected2DxAge = GeneratedColumn<double>(
    'affected2_dx_age',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affected3DxAgeMeta = const VerificationMeta(
    'affected3DxAge',
  );
  @override
  late final GeneratedColumn<double> affected3DxAge = GeneratedColumn<double>(
    'affected3_dx_age',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affected4DxAgeMeta = const VerificationMeta(
    'affected4DxAge',
  );
  @override
  late final GeneratedColumn<double> affected4DxAge = GeneratedColumn<double>(
    'affected4_dx_age',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affected1DxAgeUnitsMeta =
      const VerificationMeta('affected1DxAgeUnits');
  @override
  late final GeneratedColumn<String> affected1DxAgeUnits =
      GeneratedColumn<String>(
        'affected1_dx_age_units',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Y'),
      );
  static const VerificationMeta _affected2DxAgeUnitsMeta =
      const VerificationMeta('affected2DxAgeUnits');
  @override
  late final GeneratedColumn<String> affected2DxAgeUnits =
      GeneratedColumn<String>(
        'affected2_dx_age_units',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Y'),
      );
  static const VerificationMeta _affected3DxAgeUnitsMeta =
      const VerificationMeta('affected3DxAgeUnits');
  @override
  late final GeneratedColumn<String> affected3DxAgeUnits =
      GeneratedColumn<String>(
        'affected3_dx_age_units',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Y'),
      );
  static const VerificationMeta _affected4DxAgeUnitsMeta =
      const VerificationMeta('affected4DxAgeUnits');
  @override
  late final GeneratedColumn<String> affected4DxAgeUnits =
      GeneratedColumn<String>(
        'affected4_dx_age_units',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Y'),
      );
  static const VerificationMeta _descendancyRelationshipIdMeta =
      const VerificationMeta('descendancyRelationshipId');
  @override
  late final GeneratedColumn<int> descendancyRelationshipId =
      GeneratedColumn<int>(
        'descendancy_relationship_id',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES relationships (id) ON DELETE SET NULL',
        ),
      );
  static const VerificationMeta _explicitBioMotherIdMeta =
      const VerificationMeta('explicitBioMotherId');
  @override
  late final GeneratedColumn<int> explicitBioMotherId = GeneratedColumn<int>(
    'explicit_bio_mother_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _explicitBioFatherIdMeta =
      const VerificationMeta('explicitBioFatherId');
  @override
  late final GeneratedColumn<int> explicitBioFatherId = GeneratedColumn<int>(
    'explicit_bio_father_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _eggDonorIdMeta = const VerificationMeta(
    'eggDonorId',
  );
  @override
  late final GeneratedColumn<int> eggDonorId = GeneratedColumn<int>(
    'egg_donor_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _spermDonorIdMeta = const VerificationMeta(
    'spermDonorId',
  );
  @override
  late final GeneratedColumn<int> spermDonorId = GeneratedColumn<int>(
    'sperm_donor_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _carriedByIdMeta = const VerificationMeta(
    'carriedById',
  );
  @override
  late final GeneratedColumn<int> carriedById = GeneratedColumn<int>(
    'carried_by_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<int> pregnancyId = GeneratedColumn<int>(
    'pregnancy_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _nletsIdMeta = const VerificationMeta(
    'nletsId',
  );
  @override
  late final GeneratedColumn<int> nletsId = GeneratedColumn<int>(
    'nlets_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES nlets (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pedigreeId,
    nodeId,
    centerX,
    centerY,
    sex,
    quantity,
    age,
    ageUnits,
    height,
    gestAge,
    note,
    proband,
    deceased,
    aw,
    stillBirth,
    sab,
    top,
    p,
    donor,
    surrogate,
    adoptedIn,
    adoptedOut,
    noChildrenByChoice,
    noChildrenInfertility,
    infertilityReason,
    carriedBySurrogate,
    ageAtDeath,
    ageAtDeathUnits,
    causeOfDeath,
    causeOfDeathOntology,
    causeOfDeathOntologyId,
    causeOfDeathOntologyVersion,
    affected1,
    affected2,
    affected3,
    affected4,
    affected1DxAge,
    affected2DxAge,
    affected3DxAge,
    affected4DxAge,
    affected1DxAgeUnits,
    affected2DxAgeUnits,
    affected3DxAgeUnits,
    affected4DxAgeUnits,
    descendancyRelationshipId,
    explicitBioMotherId,
    explicitBioFatherId,
    eggDonorId,
    spermDonorId,
    carriedById,
    pregnancyId,
    nletsId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeopleData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pedigree_id')) {
      context.handle(
        _pedigreeIdMeta,
        pedigreeId.isAcceptableOrUnknown(data['pedigree_id']!, _pedigreeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pedigreeIdMeta);
    }
    if (data.containsKey('node_id')) {
      context.handle(
        _nodeIdMeta,
        nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta),
      );
    }
    if (data.containsKey('center_x')) {
      context.handle(
        _centerXMeta,
        centerX.isAcceptableOrUnknown(data['center_x']!, _centerXMeta),
      );
    }
    if (data.containsKey('center_y')) {
      context.handle(
        _centerYMeta,
        centerY.isAcceptableOrUnknown(data['center_y']!, _centerYMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('age_units')) {
      context.handle(
        _ageUnitsMeta,
        ageUnits.isAcceptableOrUnknown(data['age_units']!, _ageUnitsMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('gest_age')) {
      context.handle(
        _gestAgeMeta,
        gestAge.isAcceptableOrUnknown(data['gest_age']!, _gestAgeMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('proband')) {
      context.handle(
        _probandMeta,
        proband.isAcceptableOrUnknown(data['proband']!, _probandMeta),
      );
    }
    if (data.containsKey('deceased')) {
      context.handle(
        _deceasedMeta,
        deceased.isAcceptableOrUnknown(data['deceased']!, _deceasedMeta),
      );
    }
    if (data.containsKey('aw')) {
      context.handle(_awMeta, aw.isAcceptableOrUnknown(data['aw']!, _awMeta));
    }
    if (data.containsKey('still_birth')) {
      context.handle(
        _stillBirthMeta,
        stillBirth.isAcceptableOrUnknown(data['still_birth']!, _stillBirthMeta),
      );
    }
    if (data.containsKey('sab')) {
      context.handle(
        _sabMeta,
        sab.isAcceptableOrUnknown(data['sab']!, _sabMeta),
      );
    }
    if (data.containsKey('top')) {
      context.handle(
        _topMeta,
        top.isAcceptableOrUnknown(data['top']!, _topMeta),
      );
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('donor')) {
      context.handle(
        _donorMeta,
        donor.isAcceptableOrUnknown(data['donor']!, _donorMeta),
      );
    }
    if (data.containsKey('surrogate')) {
      context.handle(
        _surrogateMeta,
        surrogate.isAcceptableOrUnknown(data['surrogate']!, _surrogateMeta),
      );
    }
    if (data.containsKey('adopted_in')) {
      context.handle(
        _adoptedInMeta,
        adoptedIn.isAcceptableOrUnknown(data['adopted_in']!, _adoptedInMeta),
      );
    }
    if (data.containsKey('adopted_out')) {
      context.handle(
        _adoptedOutMeta,
        adoptedOut.isAcceptableOrUnknown(data['adopted_out']!, _adoptedOutMeta),
      );
    }
    if (data.containsKey('no_children_by_choice')) {
      context.handle(
        _noChildrenByChoiceMeta,
        noChildrenByChoice.isAcceptableOrUnknown(
          data['no_children_by_choice']!,
          _noChildrenByChoiceMeta,
        ),
      );
    }
    if (data.containsKey('no_children_infertility')) {
      context.handle(
        _noChildrenInfertilityMeta,
        noChildrenInfertility.isAcceptableOrUnknown(
          data['no_children_infertility']!,
          _noChildrenInfertilityMeta,
        ),
      );
    }
    if (data.containsKey('infertility_reason')) {
      context.handle(
        _infertilityReasonMeta,
        infertilityReason.isAcceptableOrUnknown(
          data['infertility_reason']!,
          _infertilityReasonMeta,
        ),
      );
    }
    if (data.containsKey('carried_by_surrogate')) {
      context.handle(
        _carriedBySurrogateMeta,
        carriedBySurrogate.isAcceptableOrUnknown(
          data['carried_by_surrogate']!,
          _carriedBySurrogateMeta,
        ),
      );
    }
    if (data.containsKey('age_at_death')) {
      context.handle(
        _ageAtDeathMeta,
        ageAtDeath.isAcceptableOrUnknown(
          data['age_at_death']!,
          _ageAtDeathMeta,
        ),
      );
    }
    if (data.containsKey('age_at_death_units')) {
      context.handle(
        _ageAtDeathUnitsMeta,
        ageAtDeathUnits.isAcceptableOrUnknown(
          data['age_at_death_units']!,
          _ageAtDeathUnitsMeta,
        ),
      );
    }
    if (data.containsKey('cause_of_death')) {
      context.handle(
        _causeOfDeathMeta,
        causeOfDeath.isAcceptableOrUnknown(
          data['cause_of_death']!,
          _causeOfDeathMeta,
        ),
      );
    }
    if (data.containsKey('cause_of_death_ontology')) {
      context.handle(
        _causeOfDeathOntologyMeta,
        causeOfDeathOntology.isAcceptableOrUnknown(
          data['cause_of_death_ontology']!,
          _causeOfDeathOntologyMeta,
        ),
      );
    }
    if (data.containsKey('cause_of_death_ontology_id')) {
      context.handle(
        _causeOfDeathOntologyIdMeta,
        causeOfDeathOntologyId.isAcceptableOrUnknown(
          data['cause_of_death_ontology_id']!,
          _causeOfDeathOntologyIdMeta,
        ),
      );
    }
    if (data.containsKey('cause_of_death_ontology_version')) {
      context.handle(
        _causeOfDeathOntologyVersionMeta,
        causeOfDeathOntologyVersion.isAcceptableOrUnknown(
          data['cause_of_death_ontology_version']!,
          _causeOfDeathOntologyVersionMeta,
        ),
      );
    }
    if (data.containsKey('affected1')) {
      context.handle(
        _affected1Meta,
        affected1.isAcceptableOrUnknown(data['affected1']!, _affected1Meta),
      );
    }
    if (data.containsKey('affected2')) {
      context.handle(
        _affected2Meta,
        affected2.isAcceptableOrUnknown(data['affected2']!, _affected2Meta),
      );
    }
    if (data.containsKey('affected3')) {
      context.handle(
        _affected3Meta,
        affected3.isAcceptableOrUnknown(data['affected3']!, _affected3Meta),
      );
    }
    if (data.containsKey('affected4')) {
      context.handle(
        _affected4Meta,
        affected4.isAcceptableOrUnknown(data['affected4']!, _affected4Meta),
      );
    }
    if (data.containsKey('affected1_dx_age')) {
      context.handle(
        _affected1DxAgeMeta,
        affected1DxAge.isAcceptableOrUnknown(
          data['affected1_dx_age']!,
          _affected1DxAgeMeta,
        ),
      );
    }
    if (data.containsKey('affected2_dx_age')) {
      context.handle(
        _affected2DxAgeMeta,
        affected2DxAge.isAcceptableOrUnknown(
          data['affected2_dx_age']!,
          _affected2DxAgeMeta,
        ),
      );
    }
    if (data.containsKey('affected3_dx_age')) {
      context.handle(
        _affected3DxAgeMeta,
        affected3DxAge.isAcceptableOrUnknown(
          data['affected3_dx_age']!,
          _affected3DxAgeMeta,
        ),
      );
    }
    if (data.containsKey('affected4_dx_age')) {
      context.handle(
        _affected4DxAgeMeta,
        affected4DxAge.isAcceptableOrUnknown(
          data['affected4_dx_age']!,
          _affected4DxAgeMeta,
        ),
      );
    }
    if (data.containsKey('affected1_dx_age_units')) {
      context.handle(
        _affected1DxAgeUnitsMeta,
        affected1DxAgeUnits.isAcceptableOrUnknown(
          data['affected1_dx_age_units']!,
          _affected1DxAgeUnitsMeta,
        ),
      );
    }
    if (data.containsKey('affected2_dx_age_units')) {
      context.handle(
        _affected2DxAgeUnitsMeta,
        affected2DxAgeUnits.isAcceptableOrUnknown(
          data['affected2_dx_age_units']!,
          _affected2DxAgeUnitsMeta,
        ),
      );
    }
    if (data.containsKey('affected3_dx_age_units')) {
      context.handle(
        _affected3DxAgeUnitsMeta,
        affected3DxAgeUnits.isAcceptableOrUnknown(
          data['affected3_dx_age_units']!,
          _affected3DxAgeUnitsMeta,
        ),
      );
    }
    if (data.containsKey('affected4_dx_age_units')) {
      context.handle(
        _affected4DxAgeUnitsMeta,
        affected4DxAgeUnits.isAcceptableOrUnknown(
          data['affected4_dx_age_units']!,
          _affected4DxAgeUnitsMeta,
        ),
      );
    }
    if (data.containsKey('descendancy_relationship_id')) {
      context.handle(
        _descendancyRelationshipIdMeta,
        descendancyRelationshipId.isAcceptableOrUnknown(
          data['descendancy_relationship_id']!,
          _descendancyRelationshipIdMeta,
        ),
      );
    }
    if (data.containsKey('explicit_bio_mother_id')) {
      context.handle(
        _explicitBioMotherIdMeta,
        explicitBioMotherId.isAcceptableOrUnknown(
          data['explicit_bio_mother_id']!,
          _explicitBioMotherIdMeta,
        ),
      );
    }
    if (data.containsKey('explicit_bio_father_id')) {
      context.handle(
        _explicitBioFatherIdMeta,
        explicitBioFatherId.isAcceptableOrUnknown(
          data['explicit_bio_father_id']!,
          _explicitBioFatherIdMeta,
        ),
      );
    }
    if (data.containsKey('egg_donor_id')) {
      context.handle(
        _eggDonorIdMeta,
        eggDonorId.isAcceptableOrUnknown(
          data['egg_donor_id']!,
          _eggDonorIdMeta,
        ),
      );
    }
    if (data.containsKey('sperm_donor_id')) {
      context.handle(
        _spermDonorIdMeta,
        spermDonorId.isAcceptableOrUnknown(
          data['sperm_donor_id']!,
          _spermDonorIdMeta,
        ),
      );
    }
    if (data.containsKey('carried_by_id')) {
      context.handle(
        _carriedByIdMeta,
        carriedById.isAcceptableOrUnknown(
          data['carried_by_id']!,
          _carriedByIdMeta,
        ),
      );
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    }
    if (data.containsKey('nlets_id')) {
      context.handle(
        _nletsIdMeta,
        nletsId.isAcceptableOrUnknown(data['nlets_id']!, _nletsIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeopleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeopleData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pedigreeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pedigree_id'],
      )!,
      nodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}node_id'],
      )!,
      centerX: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}center_x'],
      )!,
      centerY: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}center_y'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age'],
      ),
      ageUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_units'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}height'],
      ),
      gestAge: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gest_age'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      proband: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proband'],
      )!,
      deceased: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deceased'],
      )!,
      aw: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aw'],
      )!,
      stillBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}still_birth'],
      )!,
      sab: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sab'],
      )!,
      top: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}top'],
      )!,
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}p'],
      )!,
      donor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}donor'],
      )!,
      surrogate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surrogate'],
      )!,
      adoptedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adopted_in'],
      )!,
      adoptedOut: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adopted_out'],
      )!,
      noChildrenByChoice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_children_by_choice'],
      )!,
      noChildrenInfertility: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_children_infertility'],
      )!,
      infertilityReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}infertility_reason'],
      ),
      carriedBySurrogate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carried_by_surrogate'],
      )!,
      ageAtDeath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_at_death'],
      ),
      ageAtDeathUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_at_death_units'],
      ),
      causeOfDeath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cause_of_death'],
      ),
      causeOfDeathOntology: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cause_of_death_ontology'],
      ),
      causeOfDeathOntologyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cause_of_death_ontology_id'],
      ),
      causeOfDeathOntologyVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cause_of_death_ontology_version'],
      ),
      affected1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected1'],
      )!,
      affected2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected2'],
      )!,
      affected3: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected3'],
      )!,
      affected4: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected4'],
      )!,
      affected1DxAge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}affected1_dx_age'],
      ),
      affected2DxAge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}affected2_dx_age'],
      ),
      affected3DxAge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}affected3_dx_age'],
      ),
      affected4DxAge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}affected4_dx_age'],
      ),
      affected1DxAgeUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}affected1_dx_age_units'],
      )!,
      affected2DxAgeUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}affected2_dx_age_units'],
      )!,
      affected3DxAgeUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}affected3_dx_age_units'],
      )!,
      affected4DxAgeUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}affected4_dx_age_units'],
      )!,
      descendancyRelationshipId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}descendancy_relationship_id'],
      ),
      explicitBioMotherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}explicit_bio_mother_id'],
      ),
      explicitBioFatherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}explicit_bio_father_id'],
      ),
      eggDonorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}egg_donor_id'],
      ),
      spermDonorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sperm_donor_id'],
      ),
      carriedById: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carried_by_id'],
      ),
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pregnancy_id'],
      ),
      nletsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nlets_id'],
      ),
    );
  }

  @override
  $PeopleTable createAlias(String alias) {
    return $PeopleTable(attachedDatabase, alias);
  }
}

class PeopleData extends DataClass implements Insertable<PeopleData> {
  final int id;
  final int pedigreeId;
  final int nodeId;
  final double centerX;
  final double centerY;
  final String? sex;
  final String quantity;
  final String? age;
  final String? ageUnits;
  final String? height;
  final String? gestAge;
  final String? note;
  final int proband;
  final int deceased;
  final int aw;
  final int stillBirth;
  final int sab;
  final int top;
  final int p;
  final int donor;
  final int surrogate;
  final int adoptedIn;
  final int adoptedOut;
  final int noChildrenByChoice;
  final int noChildrenInfertility;
  final String? infertilityReason;
  final int carriedBySurrogate;
  final String? ageAtDeath;
  final String? ageAtDeathUnits;
  final String? causeOfDeath;
  final String? causeOfDeathOntology;
  final String? causeOfDeathOntologyId;
  final String? causeOfDeathOntologyVersion;
  final int affected1;
  final int affected2;
  final int affected3;
  final int affected4;
  final double? affected1DxAge;
  final double? affected2DxAge;
  final double? affected3DxAge;
  final double? affected4DxAge;
  final String affected1DxAgeUnits;
  final String affected2DxAgeUnits;
  final String affected3DxAgeUnits;
  final String affected4DxAgeUnits;
  final int? descendancyRelationshipId;
  final int? explicitBioMotherId;
  final int? explicitBioFatherId;
  final int? eggDonorId;
  final int? spermDonorId;
  final int? carriedById;
  final int? pregnancyId;
  final int? nletsId;
  const PeopleData({
    required this.id,
    required this.pedigreeId,
    required this.nodeId,
    required this.centerX,
    required this.centerY,
    this.sex,
    required this.quantity,
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
    required this.noChildrenByChoice,
    required this.noChildrenInfertility,
    this.infertilityReason,
    required this.carriedBySurrogate,
    this.ageAtDeath,
    this.ageAtDeathUnits,
    this.causeOfDeath,
    this.causeOfDeathOntology,
    this.causeOfDeathOntologyId,
    this.causeOfDeathOntologyVersion,
    required this.affected1,
    required this.affected2,
    required this.affected3,
    required this.affected4,
    this.affected1DxAge,
    this.affected2DxAge,
    this.affected3DxAge,
    this.affected4DxAge,
    required this.affected1DxAgeUnits,
    required this.affected2DxAgeUnits,
    required this.affected3DxAgeUnits,
    required this.affected4DxAgeUnits,
    this.descendancyRelationshipId,
    this.explicitBioMotherId,
    this.explicitBioFatherId,
    this.eggDonorId,
    this.spermDonorId,
    this.carriedById,
    this.pregnancyId,
    this.nletsId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pedigree_id'] = Variable<int>(pedigreeId);
    map['node_id'] = Variable<int>(nodeId);
    map['center_x'] = Variable<double>(centerX);
    map['center_y'] = Variable<double>(centerY);
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    map['quantity'] = Variable<String>(quantity);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<String>(age);
    }
    if (!nullToAbsent || ageUnits != null) {
      map['age_units'] = Variable<String>(ageUnits);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<String>(height);
    }
    if (!nullToAbsent || gestAge != null) {
      map['gest_age'] = Variable<String>(gestAge);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['proband'] = Variable<int>(proband);
    map['deceased'] = Variable<int>(deceased);
    map['aw'] = Variable<int>(aw);
    map['still_birth'] = Variable<int>(stillBirth);
    map['sab'] = Variable<int>(sab);
    map['top'] = Variable<int>(top);
    map['p'] = Variable<int>(p);
    map['donor'] = Variable<int>(donor);
    map['surrogate'] = Variable<int>(surrogate);
    map['adopted_in'] = Variable<int>(adoptedIn);
    map['adopted_out'] = Variable<int>(adoptedOut);
    map['no_children_by_choice'] = Variable<int>(noChildrenByChoice);
    map['no_children_infertility'] = Variable<int>(noChildrenInfertility);
    if (!nullToAbsent || infertilityReason != null) {
      map['infertility_reason'] = Variable<String>(infertilityReason);
    }
    map['carried_by_surrogate'] = Variable<int>(carriedBySurrogate);
    if (!nullToAbsent || ageAtDeath != null) {
      map['age_at_death'] = Variable<String>(ageAtDeath);
    }
    if (!nullToAbsent || ageAtDeathUnits != null) {
      map['age_at_death_units'] = Variable<String>(ageAtDeathUnits);
    }
    if (!nullToAbsent || causeOfDeath != null) {
      map['cause_of_death'] = Variable<String>(causeOfDeath);
    }
    if (!nullToAbsent || causeOfDeathOntology != null) {
      map['cause_of_death_ontology'] = Variable<String>(causeOfDeathOntology);
    }
    if (!nullToAbsent || causeOfDeathOntologyId != null) {
      map['cause_of_death_ontology_id'] = Variable<String>(
        causeOfDeathOntologyId,
      );
    }
    if (!nullToAbsent || causeOfDeathOntologyVersion != null) {
      map['cause_of_death_ontology_version'] = Variable<String>(
        causeOfDeathOntologyVersion,
      );
    }
    map['affected1'] = Variable<int>(affected1);
    map['affected2'] = Variable<int>(affected2);
    map['affected3'] = Variable<int>(affected3);
    map['affected4'] = Variable<int>(affected4);
    if (!nullToAbsent || affected1DxAge != null) {
      map['affected1_dx_age'] = Variable<double>(affected1DxAge);
    }
    if (!nullToAbsent || affected2DxAge != null) {
      map['affected2_dx_age'] = Variable<double>(affected2DxAge);
    }
    if (!nullToAbsent || affected3DxAge != null) {
      map['affected3_dx_age'] = Variable<double>(affected3DxAge);
    }
    if (!nullToAbsent || affected4DxAge != null) {
      map['affected4_dx_age'] = Variable<double>(affected4DxAge);
    }
    map['affected1_dx_age_units'] = Variable<String>(affected1DxAgeUnits);
    map['affected2_dx_age_units'] = Variable<String>(affected2DxAgeUnits);
    map['affected3_dx_age_units'] = Variable<String>(affected3DxAgeUnits);
    map['affected4_dx_age_units'] = Variable<String>(affected4DxAgeUnits);
    if (!nullToAbsent || descendancyRelationshipId != null) {
      map['descendancy_relationship_id'] = Variable<int>(
        descendancyRelationshipId,
      );
    }
    if (!nullToAbsent || explicitBioMotherId != null) {
      map['explicit_bio_mother_id'] = Variable<int>(explicitBioMotherId);
    }
    if (!nullToAbsent || explicitBioFatherId != null) {
      map['explicit_bio_father_id'] = Variable<int>(explicitBioFatherId);
    }
    if (!nullToAbsent || eggDonorId != null) {
      map['egg_donor_id'] = Variable<int>(eggDonorId);
    }
    if (!nullToAbsent || spermDonorId != null) {
      map['sperm_donor_id'] = Variable<int>(spermDonorId);
    }
    if (!nullToAbsent || carriedById != null) {
      map['carried_by_id'] = Variable<int>(carriedById);
    }
    if (!nullToAbsent || pregnancyId != null) {
      map['pregnancy_id'] = Variable<int>(pregnancyId);
    }
    if (!nullToAbsent || nletsId != null) {
      map['nlets_id'] = Variable<int>(nletsId);
    }
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      pedigreeId: Value(pedigreeId),
      nodeId: Value(nodeId),
      centerX: Value(centerX),
      centerY: Value(centerY),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      quantity: Value(quantity),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      ageUnits: ageUnits == null && nullToAbsent
          ? const Value.absent()
          : Value(ageUnits),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      gestAge: gestAge == null && nullToAbsent
          ? const Value.absent()
          : Value(gestAge),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      proband: Value(proband),
      deceased: Value(deceased),
      aw: Value(aw),
      stillBirth: Value(stillBirth),
      sab: Value(sab),
      top: Value(top),
      p: Value(p),
      donor: Value(donor),
      surrogate: Value(surrogate),
      adoptedIn: Value(adoptedIn),
      adoptedOut: Value(adoptedOut),
      noChildrenByChoice: Value(noChildrenByChoice),
      noChildrenInfertility: Value(noChildrenInfertility),
      infertilityReason: infertilityReason == null && nullToAbsent
          ? const Value.absent()
          : Value(infertilityReason),
      carriedBySurrogate: Value(carriedBySurrogate),
      ageAtDeath: ageAtDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(ageAtDeath),
      ageAtDeathUnits: ageAtDeathUnits == null && nullToAbsent
          ? const Value.absent()
          : Value(ageAtDeathUnits),
      causeOfDeath: causeOfDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(causeOfDeath),
      causeOfDeathOntology: causeOfDeathOntology == null && nullToAbsent
          ? const Value.absent()
          : Value(causeOfDeathOntology),
      causeOfDeathOntologyId: causeOfDeathOntologyId == null && nullToAbsent
          ? const Value.absent()
          : Value(causeOfDeathOntologyId),
      causeOfDeathOntologyVersion:
          causeOfDeathOntologyVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(causeOfDeathOntologyVersion),
      affected1: Value(affected1),
      affected2: Value(affected2),
      affected3: Value(affected3),
      affected4: Value(affected4),
      affected1DxAge: affected1DxAge == null && nullToAbsent
          ? const Value.absent()
          : Value(affected1DxAge),
      affected2DxAge: affected2DxAge == null && nullToAbsent
          ? const Value.absent()
          : Value(affected2DxAge),
      affected3DxAge: affected3DxAge == null && nullToAbsent
          ? const Value.absent()
          : Value(affected3DxAge),
      affected4DxAge: affected4DxAge == null && nullToAbsent
          ? const Value.absent()
          : Value(affected4DxAge),
      affected1DxAgeUnits: Value(affected1DxAgeUnits),
      affected2DxAgeUnits: Value(affected2DxAgeUnits),
      affected3DxAgeUnits: Value(affected3DxAgeUnits),
      affected4DxAgeUnits: Value(affected4DxAgeUnits),
      descendancyRelationshipId:
          descendancyRelationshipId == null && nullToAbsent
          ? const Value.absent()
          : Value(descendancyRelationshipId),
      explicitBioMotherId: explicitBioMotherId == null && nullToAbsent
          ? const Value.absent()
          : Value(explicitBioMotherId),
      explicitBioFatherId: explicitBioFatherId == null && nullToAbsent
          ? const Value.absent()
          : Value(explicitBioFatherId),
      eggDonorId: eggDonorId == null && nullToAbsent
          ? const Value.absent()
          : Value(eggDonorId),
      spermDonorId: spermDonorId == null && nullToAbsent
          ? const Value.absent()
          : Value(spermDonorId),
      carriedById: carriedById == null && nullToAbsent
          ? const Value.absent()
          : Value(carriedById),
      pregnancyId: pregnancyId == null && nullToAbsent
          ? const Value.absent()
          : Value(pregnancyId),
      nletsId: nletsId == null && nullToAbsent
          ? const Value.absent()
          : Value(nletsId),
    );
  }

  factory PeopleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeopleData(
      id: serializer.fromJson<int>(json['id']),
      pedigreeId: serializer.fromJson<int>(json['pedigreeId']),
      nodeId: serializer.fromJson<int>(json['nodeId']),
      centerX: serializer.fromJson<double>(json['centerX']),
      centerY: serializer.fromJson<double>(json['centerY']),
      sex: serializer.fromJson<String?>(json['sex']),
      quantity: serializer.fromJson<String>(json['quantity']),
      age: serializer.fromJson<String?>(json['age']),
      ageUnits: serializer.fromJson<String?>(json['ageUnits']),
      height: serializer.fromJson<String?>(json['height']),
      gestAge: serializer.fromJson<String?>(json['gestAge']),
      note: serializer.fromJson<String?>(json['note']),
      proband: serializer.fromJson<int>(json['proband']),
      deceased: serializer.fromJson<int>(json['deceased']),
      aw: serializer.fromJson<int>(json['aw']),
      stillBirth: serializer.fromJson<int>(json['stillBirth']),
      sab: serializer.fromJson<int>(json['sab']),
      top: serializer.fromJson<int>(json['top']),
      p: serializer.fromJson<int>(json['p']),
      donor: serializer.fromJson<int>(json['donor']),
      surrogate: serializer.fromJson<int>(json['surrogate']),
      adoptedIn: serializer.fromJson<int>(json['adoptedIn']),
      adoptedOut: serializer.fromJson<int>(json['adoptedOut']),
      noChildrenByChoice: serializer.fromJson<int>(json['noChildrenByChoice']),
      noChildrenInfertility: serializer.fromJson<int>(
        json['noChildrenInfertility'],
      ),
      infertilityReason: serializer.fromJson<String?>(
        json['infertilityReason'],
      ),
      carriedBySurrogate: serializer.fromJson<int>(json['carriedBySurrogate']),
      ageAtDeath: serializer.fromJson<String?>(json['ageAtDeath']),
      ageAtDeathUnits: serializer.fromJson<String?>(json['ageAtDeathUnits']),
      causeOfDeath: serializer.fromJson<String?>(json['causeOfDeath']),
      causeOfDeathOntology: serializer.fromJson<String?>(
        json['causeOfDeathOntology'],
      ),
      causeOfDeathOntologyId: serializer.fromJson<String?>(
        json['causeOfDeathOntologyId'],
      ),
      causeOfDeathOntologyVersion: serializer.fromJson<String?>(
        json['causeOfDeathOntologyVersion'],
      ),
      affected1: serializer.fromJson<int>(json['affected1']),
      affected2: serializer.fromJson<int>(json['affected2']),
      affected3: serializer.fromJson<int>(json['affected3']),
      affected4: serializer.fromJson<int>(json['affected4']),
      affected1DxAge: serializer.fromJson<double?>(json['affected1DxAge']),
      affected2DxAge: serializer.fromJson<double?>(json['affected2DxAge']),
      affected3DxAge: serializer.fromJson<double?>(json['affected3DxAge']),
      affected4DxAge: serializer.fromJson<double?>(json['affected4DxAge']),
      affected1DxAgeUnits: serializer.fromJson<String>(
        json['affected1DxAgeUnits'],
      ),
      affected2DxAgeUnits: serializer.fromJson<String>(
        json['affected2DxAgeUnits'],
      ),
      affected3DxAgeUnits: serializer.fromJson<String>(
        json['affected3DxAgeUnits'],
      ),
      affected4DxAgeUnits: serializer.fromJson<String>(
        json['affected4DxAgeUnits'],
      ),
      descendancyRelationshipId: serializer.fromJson<int?>(
        json['descendancyRelationshipId'],
      ),
      explicitBioMotherId: serializer.fromJson<int?>(
        json['explicitBioMotherId'],
      ),
      explicitBioFatherId: serializer.fromJson<int?>(
        json['explicitBioFatherId'],
      ),
      eggDonorId: serializer.fromJson<int?>(json['eggDonorId']),
      spermDonorId: serializer.fromJson<int?>(json['spermDonorId']),
      carriedById: serializer.fromJson<int?>(json['carriedById']),
      pregnancyId: serializer.fromJson<int?>(json['pregnancyId']),
      nletsId: serializer.fromJson<int?>(json['nletsId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pedigreeId': serializer.toJson<int>(pedigreeId),
      'nodeId': serializer.toJson<int>(nodeId),
      'centerX': serializer.toJson<double>(centerX),
      'centerY': serializer.toJson<double>(centerY),
      'sex': serializer.toJson<String?>(sex),
      'quantity': serializer.toJson<String>(quantity),
      'age': serializer.toJson<String?>(age),
      'ageUnits': serializer.toJson<String?>(ageUnits),
      'height': serializer.toJson<String?>(height),
      'gestAge': serializer.toJson<String?>(gestAge),
      'note': serializer.toJson<String?>(note),
      'proband': serializer.toJson<int>(proband),
      'deceased': serializer.toJson<int>(deceased),
      'aw': serializer.toJson<int>(aw),
      'stillBirth': serializer.toJson<int>(stillBirth),
      'sab': serializer.toJson<int>(sab),
      'top': serializer.toJson<int>(top),
      'p': serializer.toJson<int>(p),
      'donor': serializer.toJson<int>(donor),
      'surrogate': serializer.toJson<int>(surrogate),
      'adoptedIn': serializer.toJson<int>(adoptedIn),
      'adoptedOut': serializer.toJson<int>(adoptedOut),
      'noChildrenByChoice': serializer.toJson<int>(noChildrenByChoice),
      'noChildrenInfertility': serializer.toJson<int>(noChildrenInfertility),
      'infertilityReason': serializer.toJson<String?>(infertilityReason),
      'carriedBySurrogate': serializer.toJson<int>(carriedBySurrogate),
      'ageAtDeath': serializer.toJson<String?>(ageAtDeath),
      'ageAtDeathUnits': serializer.toJson<String?>(ageAtDeathUnits),
      'causeOfDeath': serializer.toJson<String?>(causeOfDeath),
      'causeOfDeathOntology': serializer.toJson<String?>(causeOfDeathOntology),
      'causeOfDeathOntologyId': serializer.toJson<String?>(
        causeOfDeathOntologyId,
      ),
      'causeOfDeathOntologyVersion': serializer.toJson<String?>(
        causeOfDeathOntologyVersion,
      ),
      'affected1': serializer.toJson<int>(affected1),
      'affected2': serializer.toJson<int>(affected2),
      'affected3': serializer.toJson<int>(affected3),
      'affected4': serializer.toJson<int>(affected4),
      'affected1DxAge': serializer.toJson<double?>(affected1DxAge),
      'affected2DxAge': serializer.toJson<double?>(affected2DxAge),
      'affected3DxAge': serializer.toJson<double?>(affected3DxAge),
      'affected4DxAge': serializer.toJson<double?>(affected4DxAge),
      'affected1DxAgeUnits': serializer.toJson<String>(affected1DxAgeUnits),
      'affected2DxAgeUnits': serializer.toJson<String>(affected2DxAgeUnits),
      'affected3DxAgeUnits': serializer.toJson<String>(affected3DxAgeUnits),
      'affected4DxAgeUnits': serializer.toJson<String>(affected4DxAgeUnits),
      'descendancyRelationshipId': serializer.toJson<int?>(
        descendancyRelationshipId,
      ),
      'explicitBioMotherId': serializer.toJson<int?>(explicitBioMotherId),
      'explicitBioFatherId': serializer.toJson<int?>(explicitBioFatherId),
      'eggDonorId': serializer.toJson<int?>(eggDonorId),
      'spermDonorId': serializer.toJson<int?>(spermDonorId),
      'carriedById': serializer.toJson<int?>(carriedById),
      'pregnancyId': serializer.toJson<int?>(pregnancyId),
      'nletsId': serializer.toJson<int?>(nletsId),
    };
  }

  PeopleData copyWith({
    int? id,
    int? pedigreeId,
    int? nodeId,
    double? centerX,
    double? centerY,
    Value<String?> sex = const Value.absent(),
    String? quantity,
    Value<String?> age = const Value.absent(),
    Value<String?> ageUnits = const Value.absent(),
    Value<String?> height = const Value.absent(),
    Value<String?> gestAge = const Value.absent(),
    Value<String?> note = const Value.absent(),
    int? proband,
    int? deceased,
    int? aw,
    int? stillBirth,
    int? sab,
    int? top,
    int? p,
    int? donor,
    int? surrogate,
    int? adoptedIn,
    int? adoptedOut,
    int? noChildrenByChoice,
    int? noChildrenInfertility,
    Value<String?> infertilityReason = const Value.absent(),
    int? carriedBySurrogate,
    Value<String?> ageAtDeath = const Value.absent(),
    Value<String?> ageAtDeathUnits = const Value.absent(),
    Value<String?> causeOfDeath = const Value.absent(),
    Value<String?> causeOfDeathOntology = const Value.absent(),
    Value<String?> causeOfDeathOntologyId = const Value.absent(),
    Value<String?> causeOfDeathOntologyVersion = const Value.absent(),
    int? affected1,
    int? affected2,
    int? affected3,
    int? affected4,
    Value<double?> affected1DxAge = const Value.absent(),
    Value<double?> affected2DxAge = const Value.absent(),
    Value<double?> affected3DxAge = const Value.absent(),
    Value<double?> affected4DxAge = const Value.absent(),
    String? affected1DxAgeUnits,
    String? affected2DxAgeUnits,
    String? affected3DxAgeUnits,
    String? affected4DxAgeUnits,
    Value<int?> descendancyRelationshipId = const Value.absent(),
    Value<int?> explicitBioMotherId = const Value.absent(),
    Value<int?> explicitBioFatherId = const Value.absent(),
    Value<int?> eggDonorId = const Value.absent(),
    Value<int?> spermDonorId = const Value.absent(),
    Value<int?> carriedById = const Value.absent(),
    Value<int?> pregnancyId = const Value.absent(),
    Value<int?> nletsId = const Value.absent(),
  }) => PeopleData(
    id: id ?? this.id,
    pedigreeId: pedigreeId ?? this.pedigreeId,
    nodeId: nodeId ?? this.nodeId,
    centerX: centerX ?? this.centerX,
    centerY: centerY ?? this.centerY,
    sex: sex.present ? sex.value : this.sex,
    quantity: quantity ?? this.quantity,
    age: age.present ? age.value : this.age,
    ageUnits: ageUnits.present ? ageUnits.value : this.ageUnits,
    height: height.present ? height.value : this.height,
    gestAge: gestAge.present ? gestAge.value : this.gestAge,
    note: note.present ? note.value : this.note,
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
    noChildrenByChoice: noChildrenByChoice ?? this.noChildrenByChoice,
    noChildrenInfertility: noChildrenInfertility ?? this.noChildrenInfertility,
    infertilityReason: infertilityReason.present
        ? infertilityReason.value
        : this.infertilityReason,
    carriedBySurrogate: carriedBySurrogate ?? this.carriedBySurrogate,
    ageAtDeath: ageAtDeath.present ? ageAtDeath.value : this.ageAtDeath,
    ageAtDeathUnits: ageAtDeathUnits.present
        ? ageAtDeathUnits.value
        : this.ageAtDeathUnits,
    causeOfDeath: causeOfDeath.present ? causeOfDeath.value : this.causeOfDeath,
    causeOfDeathOntology: causeOfDeathOntology.present
        ? causeOfDeathOntology.value
        : this.causeOfDeathOntology,
    causeOfDeathOntologyId: causeOfDeathOntologyId.present
        ? causeOfDeathOntologyId.value
        : this.causeOfDeathOntologyId,
    causeOfDeathOntologyVersion: causeOfDeathOntologyVersion.present
        ? causeOfDeathOntologyVersion.value
        : this.causeOfDeathOntologyVersion,
    affected1: affected1 ?? this.affected1,
    affected2: affected2 ?? this.affected2,
    affected3: affected3 ?? this.affected3,
    affected4: affected4 ?? this.affected4,
    affected1DxAge: affected1DxAge.present
        ? affected1DxAge.value
        : this.affected1DxAge,
    affected2DxAge: affected2DxAge.present
        ? affected2DxAge.value
        : this.affected2DxAge,
    affected3DxAge: affected3DxAge.present
        ? affected3DxAge.value
        : this.affected3DxAge,
    affected4DxAge: affected4DxAge.present
        ? affected4DxAge.value
        : this.affected4DxAge,
    affected1DxAgeUnits: affected1DxAgeUnits ?? this.affected1DxAgeUnits,
    affected2DxAgeUnits: affected2DxAgeUnits ?? this.affected2DxAgeUnits,
    affected3DxAgeUnits: affected3DxAgeUnits ?? this.affected3DxAgeUnits,
    affected4DxAgeUnits: affected4DxAgeUnits ?? this.affected4DxAgeUnits,
    descendancyRelationshipId: descendancyRelationshipId.present
        ? descendancyRelationshipId.value
        : this.descendancyRelationshipId,
    explicitBioMotherId: explicitBioMotherId.present
        ? explicitBioMotherId.value
        : this.explicitBioMotherId,
    explicitBioFatherId: explicitBioFatherId.present
        ? explicitBioFatherId.value
        : this.explicitBioFatherId,
    eggDonorId: eggDonorId.present ? eggDonorId.value : this.eggDonorId,
    spermDonorId: spermDonorId.present ? spermDonorId.value : this.spermDonorId,
    carriedById: carriedById.present ? carriedById.value : this.carriedById,
    pregnancyId: pregnancyId.present ? pregnancyId.value : this.pregnancyId,
    nletsId: nletsId.present ? nletsId.value : this.nletsId,
  );
  PeopleData copyWithCompanion(PeopleCompanion data) {
    return PeopleData(
      id: data.id.present ? data.id.value : this.id,
      pedigreeId: data.pedigreeId.present
          ? data.pedigreeId.value
          : this.pedigreeId,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      centerX: data.centerX.present ? data.centerX.value : this.centerX,
      centerY: data.centerY.present ? data.centerY.value : this.centerY,
      sex: data.sex.present ? data.sex.value : this.sex,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      age: data.age.present ? data.age.value : this.age,
      ageUnits: data.ageUnits.present ? data.ageUnits.value : this.ageUnits,
      height: data.height.present ? data.height.value : this.height,
      gestAge: data.gestAge.present ? data.gestAge.value : this.gestAge,
      note: data.note.present ? data.note.value : this.note,
      proband: data.proband.present ? data.proband.value : this.proband,
      deceased: data.deceased.present ? data.deceased.value : this.deceased,
      aw: data.aw.present ? data.aw.value : this.aw,
      stillBirth: data.stillBirth.present
          ? data.stillBirth.value
          : this.stillBirth,
      sab: data.sab.present ? data.sab.value : this.sab,
      top: data.top.present ? data.top.value : this.top,
      p: data.p.present ? data.p.value : this.p,
      donor: data.donor.present ? data.donor.value : this.donor,
      surrogate: data.surrogate.present ? data.surrogate.value : this.surrogate,
      adoptedIn: data.adoptedIn.present ? data.adoptedIn.value : this.adoptedIn,
      adoptedOut: data.adoptedOut.present
          ? data.adoptedOut.value
          : this.adoptedOut,
      noChildrenByChoice: data.noChildrenByChoice.present
          ? data.noChildrenByChoice.value
          : this.noChildrenByChoice,
      noChildrenInfertility: data.noChildrenInfertility.present
          ? data.noChildrenInfertility.value
          : this.noChildrenInfertility,
      infertilityReason: data.infertilityReason.present
          ? data.infertilityReason.value
          : this.infertilityReason,
      carriedBySurrogate: data.carriedBySurrogate.present
          ? data.carriedBySurrogate.value
          : this.carriedBySurrogate,
      ageAtDeath: data.ageAtDeath.present
          ? data.ageAtDeath.value
          : this.ageAtDeath,
      ageAtDeathUnits: data.ageAtDeathUnits.present
          ? data.ageAtDeathUnits.value
          : this.ageAtDeathUnits,
      causeOfDeath: data.causeOfDeath.present
          ? data.causeOfDeath.value
          : this.causeOfDeath,
      causeOfDeathOntology: data.causeOfDeathOntology.present
          ? data.causeOfDeathOntology.value
          : this.causeOfDeathOntology,
      causeOfDeathOntologyId: data.causeOfDeathOntologyId.present
          ? data.causeOfDeathOntologyId.value
          : this.causeOfDeathOntologyId,
      causeOfDeathOntologyVersion: data.causeOfDeathOntologyVersion.present
          ? data.causeOfDeathOntologyVersion.value
          : this.causeOfDeathOntologyVersion,
      affected1: data.affected1.present ? data.affected1.value : this.affected1,
      affected2: data.affected2.present ? data.affected2.value : this.affected2,
      affected3: data.affected3.present ? data.affected3.value : this.affected3,
      affected4: data.affected4.present ? data.affected4.value : this.affected4,
      affected1DxAge: data.affected1DxAge.present
          ? data.affected1DxAge.value
          : this.affected1DxAge,
      affected2DxAge: data.affected2DxAge.present
          ? data.affected2DxAge.value
          : this.affected2DxAge,
      affected3DxAge: data.affected3DxAge.present
          ? data.affected3DxAge.value
          : this.affected3DxAge,
      affected4DxAge: data.affected4DxAge.present
          ? data.affected4DxAge.value
          : this.affected4DxAge,
      affected1DxAgeUnits: data.affected1DxAgeUnits.present
          ? data.affected1DxAgeUnits.value
          : this.affected1DxAgeUnits,
      affected2DxAgeUnits: data.affected2DxAgeUnits.present
          ? data.affected2DxAgeUnits.value
          : this.affected2DxAgeUnits,
      affected3DxAgeUnits: data.affected3DxAgeUnits.present
          ? data.affected3DxAgeUnits.value
          : this.affected3DxAgeUnits,
      affected4DxAgeUnits: data.affected4DxAgeUnits.present
          ? data.affected4DxAgeUnits.value
          : this.affected4DxAgeUnits,
      descendancyRelationshipId: data.descendancyRelationshipId.present
          ? data.descendancyRelationshipId.value
          : this.descendancyRelationshipId,
      explicitBioMotherId: data.explicitBioMotherId.present
          ? data.explicitBioMotherId.value
          : this.explicitBioMotherId,
      explicitBioFatherId: data.explicitBioFatherId.present
          ? data.explicitBioFatherId.value
          : this.explicitBioFatherId,
      eggDonorId: data.eggDonorId.present
          ? data.eggDonorId.value
          : this.eggDonorId,
      spermDonorId: data.spermDonorId.present
          ? data.spermDonorId.value
          : this.spermDonorId,
      carriedById: data.carriedById.present
          ? data.carriedById.value
          : this.carriedById,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      nletsId: data.nletsId.present ? data.nletsId.value : this.nletsId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeopleData(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('nodeId: $nodeId, ')
          ..write('centerX: $centerX, ')
          ..write('centerY: $centerY, ')
          ..write('sex: $sex, ')
          ..write('quantity: $quantity, ')
          ..write('age: $age, ')
          ..write('ageUnits: $ageUnits, ')
          ..write('height: $height, ')
          ..write('gestAge: $gestAge, ')
          ..write('note: $note, ')
          ..write('proband: $proband, ')
          ..write('deceased: $deceased, ')
          ..write('aw: $aw, ')
          ..write('stillBirth: $stillBirth, ')
          ..write('sab: $sab, ')
          ..write('top: $top, ')
          ..write('p: $p, ')
          ..write('donor: $donor, ')
          ..write('surrogate: $surrogate, ')
          ..write('adoptedIn: $adoptedIn, ')
          ..write('adoptedOut: $adoptedOut, ')
          ..write('noChildrenByChoice: $noChildrenByChoice, ')
          ..write('noChildrenInfertility: $noChildrenInfertility, ')
          ..write('infertilityReason: $infertilityReason, ')
          ..write('carriedBySurrogate: $carriedBySurrogate, ')
          ..write('ageAtDeath: $ageAtDeath, ')
          ..write('ageAtDeathUnits: $ageAtDeathUnits, ')
          ..write('causeOfDeath: $causeOfDeath, ')
          ..write('causeOfDeathOntology: $causeOfDeathOntology, ')
          ..write('causeOfDeathOntologyId: $causeOfDeathOntologyId, ')
          ..write('causeOfDeathOntologyVersion: $causeOfDeathOntologyVersion, ')
          ..write('affected1: $affected1, ')
          ..write('affected2: $affected2, ')
          ..write('affected3: $affected3, ')
          ..write('affected4: $affected4, ')
          ..write('affected1DxAge: $affected1DxAge, ')
          ..write('affected2DxAge: $affected2DxAge, ')
          ..write('affected3DxAge: $affected3DxAge, ')
          ..write('affected4DxAge: $affected4DxAge, ')
          ..write('affected1DxAgeUnits: $affected1DxAgeUnits, ')
          ..write('affected2DxAgeUnits: $affected2DxAgeUnits, ')
          ..write('affected3DxAgeUnits: $affected3DxAgeUnits, ')
          ..write('affected4DxAgeUnits: $affected4DxAgeUnits, ')
          ..write('descendancyRelationshipId: $descendancyRelationshipId, ')
          ..write('explicitBioMotherId: $explicitBioMotherId, ')
          ..write('explicitBioFatherId: $explicitBioFatherId, ')
          ..write('eggDonorId: $eggDonorId, ')
          ..write('spermDonorId: $spermDonorId, ')
          ..write('carriedById: $carriedById, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('nletsId: $nletsId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    pedigreeId,
    nodeId,
    centerX,
    centerY,
    sex,
    quantity,
    age,
    ageUnits,
    height,
    gestAge,
    note,
    proband,
    deceased,
    aw,
    stillBirth,
    sab,
    top,
    p,
    donor,
    surrogate,
    adoptedIn,
    adoptedOut,
    noChildrenByChoice,
    noChildrenInfertility,
    infertilityReason,
    carriedBySurrogate,
    ageAtDeath,
    ageAtDeathUnits,
    causeOfDeath,
    causeOfDeathOntology,
    causeOfDeathOntologyId,
    causeOfDeathOntologyVersion,
    affected1,
    affected2,
    affected3,
    affected4,
    affected1DxAge,
    affected2DxAge,
    affected3DxAge,
    affected4DxAge,
    affected1DxAgeUnits,
    affected2DxAgeUnits,
    affected3DxAgeUnits,
    affected4DxAgeUnits,
    descendancyRelationshipId,
    explicitBioMotherId,
    explicitBioFatherId,
    eggDonorId,
    spermDonorId,
    carriedById,
    pregnancyId,
    nletsId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeopleData &&
          other.id == this.id &&
          other.pedigreeId == this.pedigreeId &&
          other.nodeId == this.nodeId &&
          other.centerX == this.centerX &&
          other.centerY == this.centerY &&
          other.sex == this.sex &&
          other.quantity == this.quantity &&
          other.age == this.age &&
          other.ageUnits == this.ageUnits &&
          other.height == this.height &&
          other.gestAge == this.gestAge &&
          other.note == this.note &&
          other.proband == this.proband &&
          other.deceased == this.deceased &&
          other.aw == this.aw &&
          other.stillBirth == this.stillBirth &&
          other.sab == this.sab &&
          other.top == this.top &&
          other.p == this.p &&
          other.donor == this.donor &&
          other.surrogate == this.surrogate &&
          other.adoptedIn == this.adoptedIn &&
          other.adoptedOut == this.adoptedOut &&
          other.noChildrenByChoice == this.noChildrenByChoice &&
          other.noChildrenInfertility == this.noChildrenInfertility &&
          other.infertilityReason == this.infertilityReason &&
          other.carriedBySurrogate == this.carriedBySurrogate &&
          other.ageAtDeath == this.ageAtDeath &&
          other.ageAtDeathUnits == this.ageAtDeathUnits &&
          other.causeOfDeath == this.causeOfDeath &&
          other.causeOfDeathOntology == this.causeOfDeathOntology &&
          other.causeOfDeathOntologyId == this.causeOfDeathOntologyId &&
          other.causeOfDeathOntologyVersion ==
              this.causeOfDeathOntologyVersion &&
          other.affected1 == this.affected1 &&
          other.affected2 == this.affected2 &&
          other.affected3 == this.affected3 &&
          other.affected4 == this.affected4 &&
          other.affected1DxAge == this.affected1DxAge &&
          other.affected2DxAge == this.affected2DxAge &&
          other.affected3DxAge == this.affected3DxAge &&
          other.affected4DxAge == this.affected4DxAge &&
          other.affected1DxAgeUnits == this.affected1DxAgeUnits &&
          other.affected2DxAgeUnits == this.affected2DxAgeUnits &&
          other.affected3DxAgeUnits == this.affected3DxAgeUnits &&
          other.affected4DxAgeUnits == this.affected4DxAgeUnits &&
          other.descendancyRelationshipId == this.descendancyRelationshipId &&
          other.explicitBioMotherId == this.explicitBioMotherId &&
          other.explicitBioFatherId == this.explicitBioFatherId &&
          other.eggDonorId == this.eggDonorId &&
          other.spermDonorId == this.spermDonorId &&
          other.carriedById == this.carriedById &&
          other.pregnancyId == this.pregnancyId &&
          other.nletsId == this.nletsId);
}

class PeopleCompanion extends UpdateCompanion<PeopleData> {
  final Value<int> id;
  final Value<int> pedigreeId;
  final Value<int> nodeId;
  final Value<double> centerX;
  final Value<double> centerY;
  final Value<String?> sex;
  final Value<String> quantity;
  final Value<String?> age;
  final Value<String?> ageUnits;
  final Value<String?> height;
  final Value<String?> gestAge;
  final Value<String?> note;
  final Value<int> proband;
  final Value<int> deceased;
  final Value<int> aw;
  final Value<int> stillBirth;
  final Value<int> sab;
  final Value<int> top;
  final Value<int> p;
  final Value<int> donor;
  final Value<int> surrogate;
  final Value<int> adoptedIn;
  final Value<int> adoptedOut;
  final Value<int> noChildrenByChoice;
  final Value<int> noChildrenInfertility;
  final Value<String?> infertilityReason;
  final Value<int> carriedBySurrogate;
  final Value<String?> ageAtDeath;
  final Value<String?> ageAtDeathUnits;
  final Value<String?> causeOfDeath;
  final Value<String?> causeOfDeathOntology;
  final Value<String?> causeOfDeathOntologyId;
  final Value<String?> causeOfDeathOntologyVersion;
  final Value<int> affected1;
  final Value<int> affected2;
  final Value<int> affected3;
  final Value<int> affected4;
  final Value<double?> affected1DxAge;
  final Value<double?> affected2DxAge;
  final Value<double?> affected3DxAge;
  final Value<double?> affected4DxAge;
  final Value<String> affected1DxAgeUnits;
  final Value<String> affected2DxAgeUnits;
  final Value<String> affected3DxAgeUnits;
  final Value<String> affected4DxAgeUnits;
  final Value<int?> descendancyRelationshipId;
  final Value<int?> explicitBioMotherId;
  final Value<int?> explicitBioFatherId;
  final Value<int?> eggDonorId;
  final Value<int?> spermDonorId;
  final Value<int?> carriedById;
  final Value<int?> pregnancyId;
  final Value<int?> nletsId;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.pedigreeId = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.centerX = const Value.absent(),
    this.centerY = const Value.absent(),
    this.sex = const Value.absent(),
    this.quantity = const Value.absent(),
    this.age = const Value.absent(),
    this.ageUnits = const Value.absent(),
    this.height = const Value.absent(),
    this.gestAge = const Value.absent(),
    this.note = const Value.absent(),
    this.proband = const Value.absent(),
    this.deceased = const Value.absent(),
    this.aw = const Value.absent(),
    this.stillBirth = const Value.absent(),
    this.sab = const Value.absent(),
    this.top = const Value.absent(),
    this.p = const Value.absent(),
    this.donor = const Value.absent(),
    this.surrogate = const Value.absent(),
    this.adoptedIn = const Value.absent(),
    this.adoptedOut = const Value.absent(),
    this.noChildrenByChoice = const Value.absent(),
    this.noChildrenInfertility = const Value.absent(),
    this.infertilityReason = const Value.absent(),
    this.carriedBySurrogate = const Value.absent(),
    this.ageAtDeath = const Value.absent(),
    this.ageAtDeathUnits = const Value.absent(),
    this.causeOfDeath = const Value.absent(),
    this.causeOfDeathOntology = const Value.absent(),
    this.causeOfDeathOntologyId = const Value.absent(),
    this.causeOfDeathOntologyVersion = const Value.absent(),
    this.affected1 = const Value.absent(),
    this.affected2 = const Value.absent(),
    this.affected3 = const Value.absent(),
    this.affected4 = const Value.absent(),
    this.affected1DxAge = const Value.absent(),
    this.affected2DxAge = const Value.absent(),
    this.affected3DxAge = const Value.absent(),
    this.affected4DxAge = const Value.absent(),
    this.affected1DxAgeUnits = const Value.absent(),
    this.affected2DxAgeUnits = const Value.absent(),
    this.affected3DxAgeUnits = const Value.absent(),
    this.affected4DxAgeUnits = const Value.absent(),
    this.descendancyRelationshipId = const Value.absent(),
    this.explicitBioMotherId = const Value.absent(),
    this.explicitBioFatherId = const Value.absent(),
    this.eggDonorId = const Value.absent(),
    this.spermDonorId = const Value.absent(),
    this.carriedById = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.nletsId = const Value.absent(),
  });
  PeopleCompanion.insert({
    this.id = const Value.absent(),
    required int pedigreeId,
    this.nodeId = const Value.absent(),
    this.centerX = const Value.absent(),
    this.centerY = const Value.absent(),
    this.sex = const Value.absent(),
    this.quantity = const Value.absent(),
    this.age = const Value.absent(),
    this.ageUnits = const Value.absent(),
    this.height = const Value.absent(),
    this.gestAge = const Value.absent(),
    this.note = const Value.absent(),
    this.proband = const Value.absent(),
    this.deceased = const Value.absent(),
    this.aw = const Value.absent(),
    this.stillBirth = const Value.absent(),
    this.sab = const Value.absent(),
    this.top = const Value.absent(),
    this.p = const Value.absent(),
    this.donor = const Value.absent(),
    this.surrogate = const Value.absent(),
    this.adoptedIn = const Value.absent(),
    this.adoptedOut = const Value.absent(),
    this.noChildrenByChoice = const Value.absent(),
    this.noChildrenInfertility = const Value.absent(),
    this.infertilityReason = const Value.absent(),
    this.carriedBySurrogate = const Value.absent(),
    this.ageAtDeath = const Value.absent(),
    this.ageAtDeathUnits = const Value.absent(),
    this.causeOfDeath = const Value.absent(),
    this.causeOfDeathOntology = const Value.absent(),
    this.causeOfDeathOntologyId = const Value.absent(),
    this.causeOfDeathOntologyVersion = const Value.absent(),
    this.affected1 = const Value.absent(),
    this.affected2 = const Value.absent(),
    this.affected3 = const Value.absent(),
    this.affected4 = const Value.absent(),
    this.affected1DxAge = const Value.absent(),
    this.affected2DxAge = const Value.absent(),
    this.affected3DxAge = const Value.absent(),
    this.affected4DxAge = const Value.absent(),
    this.affected1DxAgeUnits = const Value.absent(),
    this.affected2DxAgeUnits = const Value.absent(),
    this.affected3DxAgeUnits = const Value.absent(),
    this.affected4DxAgeUnits = const Value.absent(),
    this.descendancyRelationshipId = const Value.absent(),
    this.explicitBioMotherId = const Value.absent(),
    this.explicitBioFatherId = const Value.absent(),
    this.eggDonorId = const Value.absent(),
    this.spermDonorId = const Value.absent(),
    this.carriedById = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.nletsId = const Value.absent(),
  }) : pedigreeId = Value(pedigreeId);
  static Insertable<PeopleData> custom({
    Expression<int>? id,
    Expression<int>? pedigreeId,
    Expression<int>? nodeId,
    Expression<double>? centerX,
    Expression<double>? centerY,
    Expression<String>? sex,
    Expression<String>? quantity,
    Expression<String>? age,
    Expression<String>? ageUnits,
    Expression<String>? height,
    Expression<String>? gestAge,
    Expression<String>? note,
    Expression<int>? proband,
    Expression<int>? deceased,
    Expression<int>? aw,
    Expression<int>? stillBirth,
    Expression<int>? sab,
    Expression<int>? top,
    Expression<int>? p,
    Expression<int>? donor,
    Expression<int>? surrogate,
    Expression<int>? adoptedIn,
    Expression<int>? adoptedOut,
    Expression<int>? noChildrenByChoice,
    Expression<int>? noChildrenInfertility,
    Expression<String>? infertilityReason,
    Expression<int>? carriedBySurrogate,
    Expression<String>? ageAtDeath,
    Expression<String>? ageAtDeathUnits,
    Expression<String>? causeOfDeath,
    Expression<String>? causeOfDeathOntology,
    Expression<String>? causeOfDeathOntologyId,
    Expression<String>? causeOfDeathOntologyVersion,
    Expression<int>? affected1,
    Expression<int>? affected2,
    Expression<int>? affected3,
    Expression<int>? affected4,
    Expression<double>? affected1DxAge,
    Expression<double>? affected2DxAge,
    Expression<double>? affected3DxAge,
    Expression<double>? affected4DxAge,
    Expression<String>? affected1DxAgeUnits,
    Expression<String>? affected2DxAgeUnits,
    Expression<String>? affected3DxAgeUnits,
    Expression<String>? affected4DxAgeUnits,
    Expression<int>? descendancyRelationshipId,
    Expression<int>? explicitBioMotherId,
    Expression<int>? explicitBioFatherId,
    Expression<int>? eggDonorId,
    Expression<int>? spermDonorId,
    Expression<int>? carriedById,
    Expression<int>? pregnancyId,
    Expression<int>? nletsId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pedigreeId != null) 'pedigree_id': pedigreeId,
      if (nodeId != null) 'node_id': nodeId,
      if (centerX != null) 'center_x': centerX,
      if (centerY != null) 'center_y': centerY,
      if (sex != null) 'sex': sex,
      if (quantity != null) 'quantity': quantity,
      if (age != null) 'age': age,
      if (ageUnits != null) 'age_units': ageUnits,
      if (height != null) 'height': height,
      if (gestAge != null) 'gest_age': gestAge,
      if (note != null) 'note': note,
      if (proband != null) 'proband': proband,
      if (deceased != null) 'deceased': deceased,
      if (aw != null) 'aw': aw,
      if (stillBirth != null) 'still_birth': stillBirth,
      if (sab != null) 'sab': sab,
      if (top != null) 'top': top,
      if (p != null) 'p': p,
      if (donor != null) 'donor': donor,
      if (surrogate != null) 'surrogate': surrogate,
      if (adoptedIn != null) 'adopted_in': adoptedIn,
      if (adoptedOut != null) 'adopted_out': adoptedOut,
      if (noChildrenByChoice != null)
        'no_children_by_choice': noChildrenByChoice,
      if (noChildrenInfertility != null)
        'no_children_infertility': noChildrenInfertility,
      if (infertilityReason != null) 'infertility_reason': infertilityReason,
      if (carriedBySurrogate != null)
        'carried_by_surrogate': carriedBySurrogate,
      if (ageAtDeath != null) 'age_at_death': ageAtDeath,
      if (ageAtDeathUnits != null) 'age_at_death_units': ageAtDeathUnits,
      if (causeOfDeath != null) 'cause_of_death': causeOfDeath,
      if (causeOfDeathOntology != null)
        'cause_of_death_ontology': causeOfDeathOntology,
      if (causeOfDeathOntologyId != null)
        'cause_of_death_ontology_id': causeOfDeathOntologyId,
      if (causeOfDeathOntologyVersion != null)
        'cause_of_death_ontology_version': causeOfDeathOntologyVersion,
      if (affected1 != null) 'affected1': affected1,
      if (affected2 != null) 'affected2': affected2,
      if (affected3 != null) 'affected3': affected3,
      if (affected4 != null) 'affected4': affected4,
      if (affected1DxAge != null) 'affected1_dx_age': affected1DxAge,
      if (affected2DxAge != null) 'affected2_dx_age': affected2DxAge,
      if (affected3DxAge != null) 'affected3_dx_age': affected3DxAge,
      if (affected4DxAge != null) 'affected4_dx_age': affected4DxAge,
      if (affected1DxAgeUnits != null)
        'affected1_dx_age_units': affected1DxAgeUnits,
      if (affected2DxAgeUnits != null)
        'affected2_dx_age_units': affected2DxAgeUnits,
      if (affected3DxAgeUnits != null)
        'affected3_dx_age_units': affected3DxAgeUnits,
      if (affected4DxAgeUnits != null)
        'affected4_dx_age_units': affected4DxAgeUnits,
      if (descendancyRelationshipId != null)
        'descendancy_relationship_id': descendancyRelationshipId,
      if (explicitBioMotherId != null)
        'explicit_bio_mother_id': explicitBioMotherId,
      if (explicitBioFatherId != null)
        'explicit_bio_father_id': explicitBioFatherId,
      if (eggDonorId != null) 'egg_donor_id': eggDonorId,
      if (spermDonorId != null) 'sperm_donor_id': spermDonorId,
      if (carriedById != null) 'carried_by_id': carriedById,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (nletsId != null) 'nlets_id': nletsId,
    });
  }

  PeopleCompanion copyWith({
    Value<int>? id,
    Value<int>? pedigreeId,
    Value<int>? nodeId,
    Value<double>? centerX,
    Value<double>? centerY,
    Value<String?>? sex,
    Value<String>? quantity,
    Value<String?>? age,
    Value<String?>? ageUnits,
    Value<String?>? height,
    Value<String?>? gestAge,
    Value<String?>? note,
    Value<int>? proband,
    Value<int>? deceased,
    Value<int>? aw,
    Value<int>? stillBirth,
    Value<int>? sab,
    Value<int>? top,
    Value<int>? p,
    Value<int>? donor,
    Value<int>? surrogate,
    Value<int>? adoptedIn,
    Value<int>? adoptedOut,
    Value<int>? noChildrenByChoice,
    Value<int>? noChildrenInfertility,
    Value<String?>? infertilityReason,
    Value<int>? carriedBySurrogate,
    Value<String?>? ageAtDeath,
    Value<String?>? ageAtDeathUnits,
    Value<String?>? causeOfDeath,
    Value<String?>? causeOfDeathOntology,
    Value<String?>? causeOfDeathOntologyId,
    Value<String?>? causeOfDeathOntologyVersion,
    Value<int>? affected1,
    Value<int>? affected2,
    Value<int>? affected3,
    Value<int>? affected4,
    Value<double?>? affected1DxAge,
    Value<double?>? affected2DxAge,
    Value<double?>? affected3DxAge,
    Value<double?>? affected4DxAge,
    Value<String>? affected1DxAgeUnits,
    Value<String>? affected2DxAgeUnits,
    Value<String>? affected3DxAgeUnits,
    Value<String>? affected4DxAgeUnits,
    Value<int?>? descendancyRelationshipId,
    Value<int?>? explicitBioMotherId,
    Value<int?>? explicitBioFatherId,
    Value<int?>? eggDonorId,
    Value<int?>? spermDonorId,
    Value<int?>? carriedById,
    Value<int?>? pregnancyId,
    Value<int?>? nletsId,
  }) {
    return PeopleCompanion(
      id: id ?? this.id,
      pedigreeId: pedigreeId ?? this.pedigreeId,
      nodeId: nodeId ?? this.nodeId,
      centerX: centerX ?? this.centerX,
      centerY: centerY ?? this.centerY,
      sex: sex ?? this.sex,
      quantity: quantity ?? this.quantity,
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
      noChildrenByChoice: noChildrenByChoice ?? this.noChildrenByChoice,
      noChildrenInfertility:
          noChildrenInfertility ?? this.noChildrenInfertility,
      infertilityReason: infertilityReason ?? this.infertilityReason,
      carriedBySurrogate: carriedBySurrogate ?? this.carriedBySurrogate,
      ageAtDeath: ageAtDeath ?? this.ageAtDeath,
      ageAtDeathUnits: ageAtDeathUnits ?? this.ageAtDeathUnits,
      causeOfDeath: causeOfDeath ?? this.causeOfDeath,
      causeOfDeathOntology: causeOfDeathOntology ?? this.causeOfDeathOntology,
      causeOfDeathOntologyId:
          causeOfDeathOntologyId ?? this.causeOfDeathOntologyId,
      causeOfDeathOntologyVersion:
          causeOfDeathOntologyVersion ?? this.causeOfDeathOntologyVersion,
      affected1: affected1 ?? this.affected1,
      affected2: affected2 ?? this.affected2,
      affected3: affected3 ?? this.affected3,
      affected4: affected4 ?? this.affected4,
      affected1DxAge: affected1DxAge ?? this.affected1DxAge,
      affected2DxAge: affected2DxAge ?? this.affected2DxAge,
      affected3DxAge: affected3DxAge ?? this.affected3DxAge,
      affected4DxAge: affected4DxAge ?? this.affected4DxAge,
      affected1DxAgeUnits: affected1DxAgeUnits ?? this.affected1DxAgeUnits,
      affected2DxAgeUnits: affected2DxAgeUnits ?? this.affected2DxAgeUnits,
      affected3DxAgeUnits: affected3DxAgeUnits ?? this.affected3DxAgeUnits,
      affected4DxAgeUnits: affected4DxAgeUnits ?? this.affected4DxAgeUnits,
      descendancyRelationshipId:
          descendancyRelationshipId ?? this.descendancyRelationshipId,
      explicitBioMotherId: explicitBioMotherId ?? this.explicitBioMotherId,
      explicitBioFatherId: explicitBioFatherId ?? this.explicitBioFatherId,
      eggDonorId: eggDonorId ?? this.eggDonorId,
      spermDonorId: spermDonorId ?? this.spermDonorId,
      carriedById: carriedById ?? this.carriedById,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      nletsId: nletsId ?? this.nletsId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pedigreeId.present) {
      map['pedigree_id'] = Variable<int>(pedigreeId.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<int>(nodeId.value);
    }
    if (centerX.present) {
      map['center_x'] = Variable<double>(centerX.value);
    }
    if (centerY.present) {
      map['center_y'] = Variable<double>(centerY.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (ageUnits.present) {
      map['age_units'] = Variable<String>(ageUnits.value);
    }
    if (height.present) {
      map['height'] = Variable<String>(height.value);
    }
    if (gestAge.present) {
      map['gest_age'] = Variable<String>(gestAge.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (proband.present) {
      map['proband'] = Variable<int>(proband.value);
    }
    if (deceased.present) {
      map['deceased'] = Variable<int>(deceased.value);
    }
    if (aw.present) {
      map['aw'] = Variable<int>(aw.value);
    }
    if (stillBirth.present) {
      map['still_birth'] = Variable<int>(stillBirth.value);
    }
    if (sab.present) {
      map['sab'] = Variable<int>(sab.value);
    }
    if (top.present) {
      map['top'] = Variable<int>(top.value);
    }
    if (p.present) {
      map['p'] = Variable<int>(p.value);
    }
    if (donor.present) {
      map['donor'] = Variable<int>(donor.value);
    }
    if (surrogate.present) {
      map['surrogate'] = Variable<int>(surrogate.value);
    }
    if (adoptedIn.present) {
      map['adopted_in'] = Variable<int>(adoptedIn.value);
    }
    if (adoptedOut.present) {
      map['adopted_out'] = Variable<int>(adoptedOut.value);
    }
    if (noChildrenByChoice.present) {
      map['no_children_by_choice'] = Variable<int>(noChildrenByChoice.value);
    }
    if (noChildrenInfertility.present) {
      map['no_children_infertility'] = Variable<int>(
        noChildrenInfertility.value,
      );
    }
    if (infertilityReason.present) {
      map['infertility_reason'] = Variable<String>(infertilityReason.value);
    }
    if (carriedBySurrogate.present) {
      map['carried_by_surrogate'] = Variable<int>(carriedBySurrogate.value);
    }
    if (ageAtDeath.present) {
      map['age_at_death'] = Variable<String>(ageAtDeath.value);
    }
    if (ageAtDeathUnits.present) {
      map['age_at_death_units'] = Variable<String>(ageAtDeathUnits.value);
    }
    if (causeOfDeath.present) {
      map['cause_of_death'] = Variable<String>(causeOfDeath.value);
    }
    if (causeOfDeathOntology.present) {
      map['cause_of_death_ontology'] = Variable<String>(
        causeOfDeathOntology.value,
      );
    }
    if (causeOfDeathOntologyId.present) {
      map['cause_of_death_ontology_id'] = Variable<String>(
        causeOfDeathOntologyId.value,
      );
    }
    if (causeOfDeathOntologyVersion.present) {
      map['cause_of_death_ontology_version'] = Variable<String>(
        causeOfDeathOntologyVersion.value,
      );
    }
    if (affected1.present) {
      map['affected1'] = Variable<int>(affected1.value);
    }
    if (affected2.present) {
      map['affected2'] = Variable<int>(affected2.value);
    }
    if (affected3.present) {
      map['affected3'] = Variable<int>(affected3.value);
    }
    if (affected4.present) {
      map['affected4'] = Variable<int>(affected4.value);
    }
    if (affected1DxAge.present) {
      map['affected1_dx_age'] = Variable<double>(affected1DxAge.value);
    }
    if (affected2DxAge.present) {
      map['affected2_dx_age'] = Variable<double>(affected2DxAge.value);
    }
    if (affected3DxAge.present) {
      map['affected3_dx_age'] = Variable<double>(affected3DxAge.value);
    }
    if (affected4DxAge.present) {
      map['affected4_dx_age'] = Variable<double>(affected4DxAge.value);
    }
    if (affected1DxAgeUnits.present) {
      map['affected1_dx_age_units'] = Variable<String>(
        affected1DxAgeUnits.value,
      );
    }
    if (affected2DxAgeUnits.present) {
      map['affected2_dx_age_units'] = Variable<String>(
        affected2DxAgeUnits.value,
      );
    }
    if (affected3DxAgeUnits.present) {
      map['affected3_dx_age_units'] = Variable<String>(
        affected3DxAgeUnits.value,
      );
    }
    if (affected4DxAgeUnits.present) {
      map['affected4_dx_age_units'] = Variable<String>(
        affected4DxAgeUnits.value,
      );
    }
    if (descendancyRelationshipId.present) {
      map['descendancy_relationship_id'] = Variable<int>(
        descendancyRelationshipId.value,
      );
    }
    if (explicitBioMotherId.present) {
      map['explicit_bio_mother_id'] = Variable<int>(explicitBioMotherId.value);
    }
    if (explicitBioFatherId.present) {
      map['explicit_bio_father_id'] = Variable<int>(explicitBioFatherId.value);
    }
    if (eggDonorId.present) {
      map['egg_donor_id'] = Variable<int>(eggDonorId.value);
    }
    if (spermDonorId.present) {
      map['sperm_donor_id'] = Variable<int>(spermDonorId.value);
    }
    if (carriedById.present) {
      map['carried_by_id'] = Variable<int>(carriedById.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<int>(pregnancyId.value);
    }
    if (nletsId.present) {
      map['nlets_id'] = Variable<int>(nletsId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('nodeId: $nodeId, ')
          ..write('centerX: $centerX, ')
          ..write('centerY: $centerY, ')
          ..write('sex: $sex, ')
          ..write('quantity: $quantity, ')
          ..write('age: $age, ')
          ..write('ageUnits: $ageUnits, ')
          ..write('height: $height, ')
          ..write('gestAge: $gestAge, ')
          ..write('note: $note, ')
          ..write('proband: $proband, ')
          ..write('deceased: $deceased, ')
          ..write('aw: $aw, ')
          ..write('stillBirth: $stillBirth, ')
          ..write('sab: $sab, ')
          ..write('top: $top, ')
          ..write('p: $p, ')
          ..write('donor: $donor, ')
          ..write('surrogate: $surrogate, ')
          ..write('adoptedIn: $adoptedIn, ')
          ..write('adoptedOut: $adoptedOut, ')
          ..write('noChildrenByChoice: $noChildrenByChoice, ')
          ..write('noChildrenInfertility: $noChildrenInfertility, ')
          ..write('infertilityReason: $infertilityReason, ')
          ..write('carriedBySurrogate: $carriedBySurrogate, ')
          ..write('ageAtDeath: $ageAtDeath, ')
          ..write('ageAtDeathUnits: $ageAtDeathUnits, ')
          ..write('causeOfDeath: $causeOfDeath, ')
          ..write('causeOfDeathOntology: $causeOfDeathOntology, ')
          ..write('causeOfDeathOntologyId: $causeOfDeathOntologyId, ')
          ..write('causeOfDeathOntologyVersion: $causeOfDeathOntologyVersion, ')
          ..write('affected1: $affected1, ')
          ..write('affected2: $affected2, ')
          ..write('affected3: $affected3, ')
          ..write('affected4: $affected4, ')
          ..write('affected1DxAge: $affected1DxAge, ')
          ..write('affected2DxAge: $affected2DxAge, ')
          ..write('affected3DxAge: $affected3DxAge, ')
          ..write('affected4DxAge: $affected4DxAge, ')
          ..write('affected1DxAgeUnits: $affected1DxAgeUnits, ')
          ..write('affected2DxAgeUnits: $affected2DxAgeUnits, ')
          ..write('affected3DxAgeUnits: $affected3DxAgeUnits, ')
          ..write('affected4DxAgeUnits: $affected4DxAgeUnits, ')
          ..write('descendancyRelationshipId: $descendancyRelationshipId, ')
          ..write('explicitBioMotherId: $explicitBioMotherId, ')
          ..write('explicitBioFatherId: $explicitBioFatherId, ')
          ..write('eggDonorId: $eggDonorId, ')
          ..write('spermDonorId: $spermDonorId, ')
          ..write('carriedById: $carriedById, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('nletsId: $nletsId')
          ..write(')'))
        .toString();
  }
}

class $DiagnosesTable extends Diagnoses
    with TableInfo<$DiagnosesTable, Diagnose> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ontologyMeta = const VerificationMeta(
    'ontology',
  );
  @override
  late final GeneratedColumn<String> ontology = GeneratedColumn<String>(
    'ontology',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ontologyVersionMeta = const VerificationMeta(
    'ontologyVersion',
  );
  @override
  late final GeneratedColumn<String> ontologyVersion = GeneratedColumn<String>(
    'ontology_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ontologyIdMeta = const VerificationMeta(
    'ontologyId',
  );
  @override
  late final GeneratedColumn<String> ontologyId = GeneratedColumn<String>(
    'ontology_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ageAtDxMeta = const VerificationMeta(
    'ageAtDx',
  );
  @override
  late final GeneratedColumn<double> ageAtDx = GeneratedColumn<double>(
    'age_at_dx',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageAtDxUnitsMeta = const VerificationMeta(
    'ageAtDxUnits',
  );
  @override
  late final GeneratedColumn<String> ageAtDxUnits = GeneratedColumn<String>(
    'age_at_dx_units',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Y'),
  );
  static const VerificationMeta _carrierMeta = const VerificationMeta(
    'carrier',
  );
  @override
  late final GeneratedColumn<int> carrier = GeneratedColumn<int>(
    'carrier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _causeOfDeathMeta = const VerificationMeta(
    'causeOfDeath',
  );
  @override
  late final GeneratedColumn<int> causeOfDeath = GeneratedColumn<int>(
    'cause_of_death',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _modeOfInheritanceMeta = const VerificationMeta(
    'modeOfInheritance',
  );
  @override
  late final GeneratedColumn<String> modeOfInheritance =
      GeneratedColumn<String>(
        'mode_of_inheritance',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    personId,
    name,
    ontology,
    ontologyVersion,
    ontologyId,
    orderIndex,
    ageAtDx,
    ageAtDxUnits,
    carrier,
    causeOfDeath,
    modeOfInheritance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diagnoses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Diagnose> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('ontology')) {
      context.handle(
        _ontologyMeta,
        ontology.isAcceptableOrUnknown(data['ontology']!, _ontologyMeta),
      );
    }
    if (data.containsKey('ontology_version')) {
      context.handle(
        _ontologyVersionMeta,
        ontologyVersion.isAcceptableOrUnknown(
          data['ontology_version']!,
          _ontologyVersionMeta,
        ),
      );
    }
    if (data.containsKey('ontology_id')) {
      context.handle(
        _ontologyIdMeta,
        ontologyId.isAcceptableOrUnknown(data['ontology_id']!, _ontologyIdMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('age_at_dx')) {
      context.handle(
        _ageAtDxMeta,
        ageAtDx.isAcceptableOrUnknown(data['age_at_dx']!, _ageAtDxMeta),
      );
    }
    if (data.containsKey('age_at_dx_units')) {
      context.handle(
        _ageAtDxUnitsMeta,
        ageAtDxUnits.isAcceptableOrUnknown(
          data['age_at_dx_units']!,
          _ageAtDxUnitsMeta,
        ),
      );
    }
    if (data.containsKey('carrier')) {
      context.handle(
        _carrierMeta,
        carrier.isAcceptableOrUnknown(data['carrier']!, _carrierMeta),
      );
    }
    if (data.containsKey('cause_of_death')) {
      context.handle(
        _causeOfDeathMeta,
        causeOfDeath.isAcceptableOrUnknown(
          data['cause_of_death']!,
          _causeOfDeathMeta,
        ),
      );
    }
    if (data.containsKey('mode_of_inheritance')) {
      context.handle(
        _modeOfInheritanceMeta,
        modeOfInheritance.isAcceptableOrUnknown(
          data['mode_of_inheritance']!,
          _modeOfInheritanceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Diagnose map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Diagnose(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}person_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      ontology: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ontology'],
      ),
      ontologyVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ontology_version'],
      ),
      ontologyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ontology_id'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      ageAtDx: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}age_at_dx'],
      ),
      ageAtDxUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_at_dx_units'],
      )!,
      carrier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carrier'],
      )!,
      causeOfDeath: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cause_of_death'],
      )!,
      modeOfInheritance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode_of_inheritance'],
      ),
    );
  }

  @override
  $DiagnosesTable createAlias(String alias) {
    return $DiagnosesTable(attachedDatabase, alias);
  }
}

class Diagnose extends DataClass implements Insertable<Diagnose> {
  final int id;
  final int? personId;
  final String? name;
  final String? ontology;
  final String? ontologyVersion;
  final String? ontologyId;
  final int orderIndex;
  final double? ageAtDx;
  final String ageAtDxUnits;
  final int carrier;
  final int causeOfDeath;
  final String? modeOfInheritance;
  const Diagnose({
    required this.id,
    this.personId,
    this.name,
    this.ontology,
    this.ontologyVersion,
    this.ontologyId,
    required this.orderIndex,
    this.ageAtDx,
    required this.ageAtDxUnits,
    required this.carrier,
    required this.causeOfDeath,
    this.modeOfInheritance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<int>(personId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || ontology != null) {
      map['ontology'] = Variable<String>(ontology);
    }
    if (!nullToAbsent || ontologyVersion != null) {
      map['ontology_version'] = Variable<String>(ontologyVersion);
    }
    if (!nullToAbsent || ontologyId != null) {
      map['ontology_id'] = Variable<String>(ontologyId);
    }
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || ageAtDx != null) {
      map['age_at_dx'] = Variable<double>(ageAtDx);
    }
    map['age_at_dx_units'] = Variable<String>(ageAtDxUnits);
    map['carrier'] = Variable<int>(carrier);
    map['cause_of_death'] = Variable<int>(causeOfDeath);
    if (!nullToAbsent || modeOfInheritance != null) {
      map['mode_of_inheritance'] = Variable<String>(modeOfInheritance);
    }
    return map;
  }

  DiagnosesCompanion toCompanion(bool nullToAbsent) {
    return DiagnosesCompanion(
      id: Value(id),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      ontology: ontology == null && nullToAbsent
          ? const Value.absent()
          : Value(ontology),
      ontologyVersion: ontologyVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(ontologyVersion),
      ontologyId: ontologyId == null && nullToAbsent
          ? const Value.absent()
          : Value(ontologyId),
      orderIndex: Value(orderIndex),
      ageAtDx: ageAtDx == null && nullToAbsent
          ? const Value.absent()
          : Value(ageAtDx),
      ageAtDxUnits: Value(ageAtDxUnits),
      carrier: Value(carrier),
      causeOfDeath: Value(causeOfDeath),
      modeOfInheritance: modeOfInheritance == null && nullToAbsent
          ? const Value.absent()
          : Value(modeOfInheritance),
    );
  }

  factory Diagnose.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Diagnose(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int?>(json['personId']),
      name: serializer.fromJson<String?>(json['name']),
      ontology: serializer.fromJson<String?>(json['ontology']),
      ontologyVersion: serializer.fromJson<String?>(json['ontologyVersion']),
      ontologyId: serializer.fromJson<String?>(json['ontologyId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      ageAtDx: serializer.fromJson<double?>(json['ageAtDx']),
      ageAtDxUnits: serializer.fromJson<String>(json['ageAtDxUnits']),
      carrier: serializer.fromJson<int>(json['carrier']),
      causeOfDeath: serializer.fromJson<int>(json['causeOfDeath']),
      modeOfInheritance: serializer.fromJson<String?>(
        json['modeOfInheritance'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int?>(personId),
      'name': serializer.toJson<String?>(name),
      'ontology': serializer.toJson<String?>(ontology),
      'ontologyVersion': serializer.toJson<String?>(ontologyVersion),
      'ontologyId': serializer.toJson<String?>(ontologyId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'ageAtDx': serializer.toJson<double?>(ageAtDx),
      'ageAtDxUnits': serializer.toJson<String>(ageAtDxUnits),
      'carrier': serializer.toJson<int>(carrier),
      'causeOfDeath': serializer.toJson<int>(causeOfDeath),
      'modeOfInheritance': serializer.toJson<String?>(modeOfInheritance),
    };
  }

  Diagnose copyWith({
    int? id,
    Value<int?> personId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> ontology = const Value.absent(),
    Value<String?> ontologyVersion = const Value.absent(),
    Value<String?> ontologyId = const Value.absent(),
    int? orderIndex,
    Value<double?> ageAtDx = const Value.absent(),
    String? ageAtDxUnits,
    int? carrier,
    int? causeOfDeath,
    Value<String?> modeOfInheritance = const Value.absent(),
  }) => Diagnose(
    id: id ?? this.id,
    personId: personId.present ? personId.value : this.personId,
    name: name.present ? name.value : this.name,
    ontology: ontology.present ? ontology.value : this.ontology,
    ontologyVersion: ontologyVersion.present
        ? ontologyVersion.value
        : this.ontologyVersion,
    ontologyId: ontologyId.present ? ontologyId.value : this.ontologyId,
    orderIndex: orderIndex ?? this.orderIndex,
    ageAtDx: ageAtDx.present ? ageAtDx.value : this.ageAtDx,
    ageAtDxUnits: ageAtDxUnits ?? this.ageAtDxUnits,
    carrier: carrier ?? this.carrier,
    causeOfDeath: causeOfDeath ?? this.causeOfDeath,
    modeOfInheritance: modeOfInheritance.present
        ? modeOfInheritance.value
        : this.modeOfInheritance,
  );
  Diagnose copyWithCompanion(DiagnosesCompanion data) {
    return Diagnose(
      id: data.id.present ? data.id.value : this.id,
      personId: data.personId.present ? data.personId.value : this.personId,
      name: data.name.present ? data.name.value : this.name,
      ontology: data.ontology.present ? data.ontology.value : this.ontology,
      ontologyVersion: data.ontologyVersion.present
          ? data.ontologyVersion.value
          : this.ontologyVersion,
      ontologyId: data.ontologyId.present
          ? data.ontologyId.value
          : this.ontologyId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      ageAtDx: data.ageAtDx.present ? data.ageAtDx.value : this.ageAtDx,
      ageAtDxUnits: data.ageAtDxUnits.present
          ? data.ageAtDxUnits.value
          : this.ageAtDxUnits,
      carrier: data.carrier.present ? data.carrier.value : this.carrier,
      causeOfDeath: data.causeOfDeath.present
          ? data.causeOfDeath.value
          : this.causeOfDeath,
      modeOfInheritance: data.modeOfInheritance.present
          ? data.modeOfInheritance.value
          : this.modeOfInheritance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Diagnose(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('ontology: $ontology, ')
          ..write('ontologyVersion: $ontologyVersion, ')
          ..write('ontologyId: $ontologyId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('ageAtDx: $ageAtDx, ')
          ..write('ageAtDxUnits: $ageAtDxUnits, ')
          ..write('carrier: $carrier, ')
          ..write('causeOfDeath: $causeOfDeath, ')
          ..write('modeOfInheritance: $modeOfInheritance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    personId,
    name,
    ontology,
    ontologyVersion,
    ontologyId,
    orderIndex,
    ageAtDx,
    ageAtDxUnits,
    carrier,
    causeOfDeath,
    modeOfInheritance,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diagnose &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.name == this.name &&
          other.ontology == this.ontology &&
          other.ontologyVersion == this.ontologyVersion &&
          other.ontologyId == this.ontologyId &&
          other.orderIndex == this.orderIndex &&
          other.ageAtDx == this.ageAtDx &&
          other.ageAtDxUnits == this.ageAtDxUnits &&
          other.carrier == this.carrier &&
          other.causeOfDeath == this.causeOfDeath &&
          other.modeOfInheritance == this.modeOfInheritance);
}

class DiagnosesCompanion extends UpdateCompanion<Diagnose> {
  final Value<int> id;
  final Value<int?> personId;
  final Value<String?> name;
  final Value<String?> ontology;
  final Value<String?> ontologyVersion;
  final Value<String?> ontologyId;
  final Value<int> orderIndex;
  final Value<double?> ageAtDx;
  final Value<String> ageAtDxUnits;
  final Value<int> carrier;
  final Value<int> causeOfDeath;
  final Value<String?> modeOfInheritance;
  const DiagnosesCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.name = const Value.absent(),
    this.ontology = const Value.absent(),
    this.ontologyVersion = const Value.absent(),
    this.ontologyId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.ageAtDx = const Value.absent(),
    this.ageAtDxUnits = const Value.absent(),
    this.carrier = const Value.absent(),
    this.causeOfDeath = const Value.absent(),
    this.modeOfInheritance = const Value.absent(),
  });
  DiagnosesCompanion.insert({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.name = const Value.absent(),
    this.ontology = const Value.absent(),
    this.ontologyVersion = const Value.absent(),
    this.ontologyId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.ageAtDx = const Value.absent(),
    this.ageAtDxUnits = const Value.absent(),
    this.carrier = const Value.absent(),
    this.causeOfDeath = const Value.absent(),
    this.modeOfInheritance = const Value.absent(),
  });
  static Insertable<Diagnose> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? name,
    Expression<String>? ontology,
    Expression<String>? ontologyVersion,
    Expression<String>? ontologyId,
    Expression<int>? orderIndex,
    Expression<double>? ageAtDx,
    Expression<String>? ageAtDxUnits,
    Expression<int>? carrier,
    Expression<int>? causeOfDeath,
    Expression<String>? modeOfInheritance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (name != null) 'name': name,
      if (ontology != null) 'ontology': ontology,
      if (ontologyVersion != null) 'ontology_version': ontologyVersion,
      if (ontologyId != null) 'ontology_id': ontologyId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (ageAtDx != null) 'age_at_dx': ageAtDx,
      if (ageAtDxUnits != null) 'age_at_dx_units': ageAtDxUnits,
      if (carrier != null) 'carrier': carrier,
      if (causeOfDeath != null) 'cause_of_death': causeOfDeath,
      if (modeOfInheritance != null) 'mode_of_inheritance': modeOfInheritance,
    });
  }

  DiagnosesCompanion copyWith({
    Value<int>? id,
    Value<int?>? personId,
    Value<String?>? name,
    Value<String?>? ontology,
    Value<String?>? ontologyVersion,
    Value<String?>? ontologyId,
    Value<int>? orderIndex,
    Value<double?>? ageAtDx,
    Value<String>? ageAtDxUnits,
    Value<int>? carrier,
    Value<int>? causeOfDeath,
    Value<String?>? modeOfInheritance,
  }) {
    return DiagnosesCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      name: name ?? this.name,
      ontology: ontology ?? this.ontology,
      ontologyVersion: ontologyVersion ?? this.ontologyVersion,
      ontologyId: ontologyId ?? this.ontologyId,
      orderIndex: orderIndex ?? this.orderIndex,
      ageAtDx: ageAtDx ?? this.ageAtDx,
      ageAtDxUnits: ageAtDxUnits ?? this.ageAtDxUnits,
      carrier: carrier ?? this.carrier,
      causeOfDeath: causeOfDeath ?? this.causeOfDeath,
      modeOfInheritance: modeOfInheritance ?? this.modeOfInheritance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ontology.present) {
      map['ontology'] = Variable<String>(ontology.value);
    }
    if (ontologyVersion.present) {
      map['ontology_version'] = Variable<String>(ontologyVersion.value);
    }
    if (ontologyId.present) {
      map['ontology_id'] = Variable<String>(ontologyId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (ageAtDx.present) {
      map['age_at_dx'] = Variable<double>(ageAtDx.value);
    }
    if (ageAtDxUnits.present) {
      map['age_at_dx_units'] = Variable<String>(ageAtDxUnits.value);
    }
    if (carrier.present) {
      map['carrier'] = Variable<int>(carrier.value);
    }
    if (causeOfDeath.present) {
      map['cause_of_death'] = Variable<int>(causeOfDeath.value);
    }
    if (modeOfInheritance.present) {
      map['mode_of_inheritance'] = Variable<String>(modeOfInheritance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosesCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('ontology: $ontology, ')
          ..write('ontologyVersion: $ontologyVersion, ')
          ..write('ontologyId: $ontologyId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('ageAtDx: $ageAtDx, ')
          ..write('ageAtDxUnits: $ageAtDxUnits, ')
          ..write('carrier: $carrier, ')
          ..write('causeOfDeath: $causeOfDeath, ')
          ..write('modeOfInheritance: $modeOfInheritance')
          ..write(')'))
        .toString();
  }
}

class $MetaTable extends Meta with TableInfo<$MetaTable, MetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pedigreeIdMeta = const VerificationMeta(
    'pedigreeId',
  );
  @override
  late final GeneratedColumn<int> pedigreeId = GeneratedColumn<int>(
    'pedigree_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES pedigrees (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Unnamed'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moonsMeta = const VerificationMeta('moons');
  @override
  late final GeneratedColumn<int> moons = GeneratedColumn<int>(
    'moons',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextIdMeta = const VerificationMeta('nextId');
  @override
  late final GeneratedColumn<int> nextId = GeneratedColumn<int>(
    'next_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _affected1DiagnosisIdMeta =
      const VerificationMeta('affected1DiagnosisId');
  @override
  late final GeneratedColumn<int> affected1DiagnosisId = GeneratedColumn<int>(
    'affected1_diagnosis_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diagnoses (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _affected2DiagnosisIdMeta =
      const VerificationMeta('affected2DiagnosisId');
  @override
  late final GeneratedColumn<int> affected2DiagnosisId = GeneratedColumn<int>(
    'affected2_diagnosis_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diagnoses (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _affected3DiagnosisIdMeta =
      const VerificationMeta('affected3DiagnosisId');
  @override
  late final GeneratedColumn<int> affected3DiagnosisId = GeneratedColumn<int>(
    'affected3_diagnosis_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diagnoses (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _affected4DiagnosisIdMeta =
      const VerificationMeta('affected4DiagnosisId');
  @override
  late final GeneratedColumn<int> affected4DiagnosisId = GeneratedColumn<int>(
    'affected4_diagnosis_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diagnoses (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pedigreeId,
    name,
    notes,
    version,
    moons,
    nextId,
    affected1DiagnosisId,
    affected2DiagnosisId,
    affected3DiagnosisId,
    affected4DiagnosisId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<MetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pedigree_id')) {
      context.handle(
        _pedigreeIdMeta,
        pedigreeId.isAcceptableOrUnknown(data['pedigree_id']!, _pedigreeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pedigreeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('moons')) {
      context.handle(
        _moonsMeta,
        moons.isAcceptableOrUnknown(data['moons']!, _moonsMeta),
      );
    }
    if (data.containsKey('next_id')) {
      context.handle(
        _nextIdMeta,
        nextId.isAcceptableOrUnknown(data['next_id']!, _nextIdMeta),
      );
    }
    if (data.containsKey('affected1_diagnosis_id')) {
      context.handle(
        _affected1DiagnosisIdMeta,
        affected1DiagnosisId.isAcceptableOrUnknown(
          data['affected1_diagnosis_id']!,
          _affected1DiagnosisIdMeta,
        ),
      );
    }
    if (data.containsKey('affected2_diagnosis_id')) {
      context.handle(
        _affected2DiagnosisIdMeta,
        affected2DiagnosisId.isAcceptableOrUnknown(
          data['affected2_diagnosis_id']!,
          _affected2DiagnosisIdMeta,
        ),
      );
    }
    if (data.containsKey('affected3_diagnosis_id')) {
      context.handle(
        _affected3DiagnosisIdMeta,
        affected3DiagnosisId.isAcceptableOrUnknown(
          data['affected3_diagnosis_id']!,
          _affected3DiagnosisIdMeta,
        ),
      );
    }
    if (data.containsKey('affected4_diagnosis_id')) {
      context.handle(
        _affected4DiagnosisIdMeta,
        affected4DiagnosisId.isAcceptableOrUnknown(
          data['affected4_diagnosis_id']!,
          _affected4DiagnosisIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pedigreeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pedigree_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      ),
      moons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}moons'],
      )!,
      nextId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_id'],
      )!,
      affected1DiagnosisId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected1_diagnosis_id'],
      ),
      affected2DiagnosisId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected2_diagnosis_id'],
      ),
      affected3DiagnosisId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected3_diagnosis_id'],
      ),
      affected4DiagnosisId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affected4_diagnosis_id'],
      ),
    );
  }

  @override
  $MetaTable createAlias(String alias) {
    return $MetaTable(attachedDatabase, alias);
  }
}

class MetaData extends DataClass implements Insertable<MetaData> {
  final int id;
  final int pedigreeId;
  final String name;
  final String? notes;
  final String? version;
  final int moons;
  final int nextId;
  final int? affected1DiagnosisId;
  final int? affected2DiagnosisId;
  final int? affected3DiagnosisId;
  final int? affected4DiagnosisId;
  const MetaData({
    required this.id,
    required this.pedigreeId,
    required this.name,
    this.notes,
    this.version,
    required this.moons,
    required this.nextId,
    this.affected1DiagnosisId,
    this.affected2DiagnosisId,
    this.affected3DiagnosisId,
    this.affected4DiagnosisId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pedigree_id'] = Variable<int>(pedigreeId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    map['moons'] = Variable<int>(moons);
    map['next_id'] = Variable<int>(nextId);
    if (!nullToAbsent || affected1DiagnosisId != null) {
      map['affected1_diagnosis_id'] = Variable<int>(affected1DiagnosisId);
    }
    if (!nullToAbsent || affected2DiagnosisId != null) {
      map['affected2_diagnosis_id'] = Variable<int>(affected2DiagnosisId);
    }
    if (!nullToAbsent || affected3DiagnosisId != null) {
      map['affected3_diagnosis_id'] = Variable<int>(affected3DiagnosisId);
    }
    if (!nullToAbsent || affected4DiagnosisId != null) {
      map['affected4_diagnosis_id'] = Variable<int>(affected4DiagnosisId);
    }
    return map;
  }

  MetaCompanion toCompanion(bool nullToAbsent) {
    return MetaCompanion(
      id: Value(id),
      pedigreeId: Value(pedigreeId),
      name: Value(name),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      moons: Value(moons),
      nextId: Value(nextId),
      affected1DiagnosisId: affected1DiagnosisId == null && nullToAbsent
          ? const Value.absent()
          : Value(affected1DiagnosisId),
      affected2DiagnosisId: affected2DiagnosisId == null && nullToAbsent
          ? const Value.absent()
          : Value(affected2DiagnosisId),
      affected3DiagnosisId: affected3DiagnosisId == null && nullToAbsent
          ? const Value.absent()
          : Value(affected3DiagnosisId),
      affected4DiagnosisId: affected4DiagnosisId == null && nullToAbsent
          ? const Value.absent()
          : Value(affected4DiagnosisId),
    );
  }

  factory MetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MetaData(
      id: serializer.fromJson<int>(json['id']),
      pedigreeId: serializer.fromJson<int>(json['pedigreeId']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      version: serializer.fromJson<String?>(json['version']),
      moons: serializer.fromJson<int>(json['moons']),
      nextId: serializer.fromJson<int>(json['nextId']),
      affected1DiagnosisId: serializer.fromJson<int?>(
        json['affected1DiagnosisId'],
      ),
      affected2DiagnosisId: serializer.fromJson<int?>(
        json['affected2DiagnosisId'],
      ),
      affected3DiagnosisId: serializer.fromJson<int?>(
        json['affected3DiagnosisId'],
      ),
      affected4DiagnosisId: serializer.fromJson<int?>(
        json['affected4DiagnosisId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pedigreeId': serializer.toJson<int>(pedigreeId),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'version': serializer.toJson<String?>(version),
      'moons': serializer.toJson<int>(moons),
      'nextId': serializer.toJson<int>(nextId),
      'affected1DiagnosisId': serializer.toJson<int?>(affected1DiagnosisId),
      'affected2DiagnosisId': serializer.toJson<int?>(affected2DiagnosisId),
      'affected3DiagnosisId': serializer.toJson<int?>(affected3DiagnosisId),
      'affected4DiagnosisId': serializer.toJson<int?>(affected4DiagnosisId),
    };
  }

  MetaData copyWith({
    int? id,
    int? pedigreeId,
    String? name,
    Value<String?> notes = const Value.absent(),
    Value<String?> version = const Value.absent(),
    int? moons,
    int? nextId,
    Value<int?> affected1DiagnosisId = const Value.absent(),
    Value<int?> affected2DiagnosisId = const Value.absent(),
    Value<int?> affected3DiagnosisId = const Value.absent(),
    Value<int?> affected4DiagnosisId = const Value.absent(),
  }) => MetaData(
    id: id ?? this.id,
    pedigreeId: pedigreeId ?? this.pedigreeId,
    name: name ?? this.name,
    notes: notes.present ? notes.value : this.notes,
    version: version.present ? version.value : this.version,
    moons: moons ?? this.moons,
    nextId: nextId ?? this.nextId,
    affected1DiagnosisId: affected1DiagnosisId.present
        ? affected1DiagnosisId.value
        : this.affected1DiagnosisId,
    affected2DiagnosisId: affected2DiagnosisId.present
        ? affected2DiagnosisId.value
        : this.affected2DiagnosisId,
    affected3DiagnosisId: affected3DiagnosisId.present
        ? affected3DiagnosisId.value
        : this.affected3DiagnosisId,
    affected4DiagnosisId: affected4DiagnosisId.present
        ? affected4DiagnosisId.value
        : this.affected4DiagnosisId,
  );
  MetaData copyWithCompanion(MetaCompanion data) {
    return MetaData(
      id: data.id.present ? data.id.value : this.id,
      pedigreeId: data.pedigreeId.present
          ? data.pedigreeId.value
          : this.pedigreeId,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      version: data.version.present ? data.version.value : this.version,
      moons: data.moons.present ? data.moons.value : this.moons,
      nextId: data.nextId.present ? data.nextId.value : this.nextId,
      affected1DiagnosisId: data.affected1DiagnosisId.present
          ? data.affected1DiagnosisId.value
          : this.affected1DiagnosisId,
      affected2DiagnosisId: data.affected2DiagnosisId.present
          ? data.affected2DiagnosisId.value
          : this.affected2DiagnosisId,
      affected3DiagnosisId: data.affected3DiagnosisId.present
          ? data.affected3DiagnosisId.value
          : this.affected3DiagnosisId,
      affected4DiagnosisId: data.affected4DiagnosisId.present
          ? data.affected4DiagnosisId.value
          : this.affected4DiagnosisId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MetaData(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('version: $version, ')
          ..write('moons: $moons, ')
          ..write('nextId: $nextId, ')
          ..write('affected1DiagnosisId: $affected1DiagnosisId, ')
          ..write('affected2DiagnosisId: $affected2DiagnosisId, ')
          ..write('affected3DiagnosisId: $affected3DiagnosisId, ')
          ..write('affected4DiagnosisId: $affected4DiagnosisId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pedigreeId,
    name,
    notes,
    version,
    moons,
    nextId,
    affected1DiagnosisId,
    affected2DiagnosisId,
    affected3DiagnosisId,
    affected4DiagnosisId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MetaData &&
          other.id == this.id &&
          other.pedigreeId == this.pedigreeId &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.version == this.version &&
          other.moons == this.moons &&
          other.nextId == this.nextId &&
          other.affected1DiagnosisId == this.affected1DiagnosisId &&
          other.affected2DiagnosisId == this.affected2DiagnosisId &&
          other.affected3DiagnosisId == this.affected3DiagnosisId &&
          other.affected4DiagnosisId == this.affected4DiagnosisId);
}

class MetaCompanion extends UpdateCompanion<MetaData> {
  final Value<int> id;
  final Value<int> pedigreeId;
  final Value<String> name;
  final Value<String?> notes;
  final Value<String?> version;
  final Value<int> moons;
  final Value<int> nextId;
  final Value<int?> affected1DiagnosisId;
  final Value<int?> affected2DiagnosisId;
  final Value<int?> affected3DiagnosisId;
  final Value<int?> affected4DiagnosisId;
  const MetaCompanion({
    this.id = const Value.absent(),
    this.pedigreeId = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.version = const Value.absent(),
    this.moons = const Value.absent(),
    this.nextId = const Value.absent(),
    this.affected1DiagnosisId = const Value.absent(),
    this.affected2DiagnosisId = const Value.absent(),
    this.affected3DiagnosisId = const Value.absent(),
    this.affected4DiagnosisId = const Value.absent(),
  });
  MetaCompanion.insert({
    this.id = const Value.absent(),
    required int pedigreeId,
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.version = const Value.absent(),
    this.moons = const Value.absent(),
    this.nextId = const Value.absent(),
    this.affected1DiagnosisId = const Value.absent(),
    this.affected2DiagnosisId = const Value.absent(),
    this.affected3DiagnosisId = const Value.absent(),
    this.affected4DiagnosisId = const Value.absent(),
  }) : pedigreeId = Value(pedigreeId);
  static Insertable<MetaData> custom({
    Expression<int>? id,
    Expression<int>? pedigreeId,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<String>? version,
    Expression<int>? moons,
    Expression<int>? nextId,
    Expression<int>? affected1DiagnosisId,
    Expression<int>? affected2DiagnosisId,
    Expression<int>? affected3DiagnosisId,
    Expression<int>? affected4DiagnosisId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pedigreeId != null) 'pedigree_id': pedigreeId,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (version != null) 'version': version,
      if (moons != null) 'moons': moons,
      if (nextId != null) 'next_id': nextId,
      if (affected1DiagnosisId != null)
        'affected1_diagnosis_id': affected1DiagnosisId,
      if (affected2DiagnosisId != null)
        'affected2_diagnosis_id': affected2DiagnosisId,
      if (affected3DiagnosisId != null)
        'affected3_diagnosis_id': affected3DiagnosisId,
      if (affected4DiagnosisId != null)
        'affected4_diagnosis_id': affected4DiagnosisId,
    });
  }

  MetaCompanion copyWith({
    Value<int>? id,
    Value<int>? pedigreeId,
    Value<String>? name,
    Value<String?>? notes,
    Value<String?>? version,
    Value<int>? moons,
    Value<int>? nextId,
    Value<int?>? affected1DiagnosisId,
    Value<int?>? affected2DiagnosisId,
    Value<int?>? affected3DiagnosisId,
    Value<int?>? affected4DiagnosisId,
  }) {
    return MetaCompanion(
      id: id ?? this.id,
      pedigreeId: pedigreeId ?? this.pedigreeId,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      version: version ?? this.version,
      moons: moons ?? this.moons,
      nextId: nextId ?? this.nextId,
      affected1DiagnosisId: affected1DiagnosisId ?? this.affected1DiagnosisId,
      affected2DiagnosisId: affected2DiagnosisId ?? this.affected2DiagnosisId,
      affected3DiagnosisId: affected3DiagnosisId ?? this.affected3DiagnosisId,
      affected4DiagnosisId: affected4DiagnosisId ?? this.affected4DiagnosisId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pedigreeId.present) {
      map['pedigree_id'] = Variable<int>(pedigreeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (moons.present) {
      map['moons'] = Variable<int>(moons.value);
    }
    if (nextId.present) {
      map['next_id'] = Variable<int>(nextId.value);
    }
    if (affected1DiagnosisId.present) {
      map['affected1_diagnosis_id'] = Variable<int>(affected1DiagnosisId.value);
    }
    if (affected2DiagnosisId.present) {
      map['affected2_diagnosis_id'] = Variable<int>(affected2DiagnosisId.value);
    }
    if (affected3DiagnosisId.present) {
      map['affected3_diagnosis_id'] = Variable<int>(affected3DiagnosisId.value);
    }
    if (affected4DiagnosisId.present) {
      map['affected4_diagnosis_id'] = Variable<int>(affected4DiagnosisId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetaCompanion(')
          ..write('id: $id, ')
          ..write('pedigreeId: $pedigreeId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('version: $version, ')
          ..write('moons: $moons, ')
          ..write('nextId: $nextId, ')
          ..write('affected1DiagnosisId: $affected1DiagnosisId, ')
          ..write('affected2DiagnosisId: $affected2DiagnosisId, ')
          ..write('affected3DiagnosisId: $affected3DiagnosisId, ')
          ..write('affected4DiagnosisId: $affected4DiagnosisId')
          ..write(')'))
        .toString();
  }
}

class $RelationshipMembersTable extends RelationshipMembers
    with TableInfo<$RelationshipMembersTable, RelationshipMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _relationshipIdMeta = const VerificationMeta(
    'relationshipId',
  );
  @override
  late final GeneratedColumn<int> relationshipId = GeneratedColumn<int>(
    'relationship_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES relationships (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _roleIndexMeta = const VerificationMeta(
    'roleIndex',
  );
  @override
  late final GeneratedColumn<int> roleIndex = GeneratedColumn<int>(
    'role_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [relationshipId, personId, roleIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationship_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelationshipMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('relationship_id')) {
      context.handle(
        _relationshipIdMeta,
        relationshipId.isAcceptableOrUnknown(
          data['relationship_id']!,
          _relationshipIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('role_index')) {
      context.handle(
        _roleIndexMeta,
        roleIndex.isAcceptableOrUnknown(data['role_index']!, _roleIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {relationshipId, personId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {relationshipId, roleIndex},
  ];
  @override
  RelationshipMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationshipMember(
      relationshipId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relationship_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}person_id'],
      )!,
      roleIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_index'],
      )!,
    );
  }

  @override
  $RelationshipMembersTable createAlias(String alias) {
    return $RelationshipMembersTable(attachedDatabase, alias);
  }
}

class RelationshipMember extends DataClass
    implements Insertable<RelationshipMember> {
  final int relationshipId;
  final int personId;
  final int roleIndex;
  const RelationshipMember({
    required this.relationshipId,
    required this.personId,
    required this.roleIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['relationship_id'] = Variable<int>(relationshipId);
    map['person_id'] = Variable<int>(personId);
    map['role_index'] = Variable<int>(roleIndex);
    return map;
  }

  RelationshipMembersCompanion toCompanion(bool nullToAbsent) {
    return RelationshipMembersCompanion(
      relationshipId: Value(relationshipId),
      personId: Value(personId),
      roleIndex: Value(roleIndex),
    );
  }

  factory RelationshipMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationshipMember(
      relationshipId: serializer.fromJson<int>(json['relationshipId']),
      personId: serializer.fromJson<int>(json['personId']),
      roleIndex: serializer.fromJson<int>(json['roleIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'relationshipId': serializer.toJson<int>(relationshipId),
      'personId': serializer.toJson<int>(personId),
      'roleIndex': serializer.toJson<int>(roleIndex),
    };
  }

  RelationshipMember copyWith({
    int? relationshipId,
    int? personId,
    int? roleIndex,
  }) => RelationshipMember(
    relationshipId: relationshipId ?? this.relationshipId,
    personId: personId ?? this.personId,
    roleIndex: roleIndex ?? this.roleIndex,
  );
  RelationshipMember copyWithCompanion(RelationshipMembersCompanion data) {
    return RelationshipMember(
      relationshipId: data.relationshipId.present
          ? data.relationshipId.value
          : this.relationshipId,
      personId: data.personId.present ? data.personId.value : this.personId,
      roleIndex: data.roleIndex.present ? data.roleIndex.value : this.roleIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipMember(')
          ..write('relationshipId: $relationshipId, ')
          ..write('personId: $personId, ')
          ..write('roleIndex: $roleIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(relationshipId, personId, roleIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationshipMember &&
          other.relationshipId == this.relationshipId &&
          other.personId == this.personId &&
          other.roleIndex == this.roleIndex);
}

class RelationshipMembersCompanion extends UpdateCompanion<RelationshipMember> {
  final Value<int> relationshipId;
  final Value<int> personId;
  final Value<int> roleIndex;
  final Value<int> rowid;
  const RelationshipMembersCompanion({
    this.relationshipId = const Value.absent(),
    this.personId = const Value.absent(),
    this.roleIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationshipMembersCompanion.insert({
    required int relationshipId,
    required int personId,
    required int roleIndex,
    this.rowid = const Value.absent(),
  }) : relationshipId = Value(relationshipId),
       personId = Value(personId),
       roleIndex = Value(roleIndex);
  static Insertable<RelationshipMember> custom({
    Expression<int>? relationshipId,
    Expression<int>? personId,
    Expression<int>? roleIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (relationshipId != null) 'relationship_id': relationshipId,
      if (personId != null) 'person_id': personId,
      if (roleIndex != null) 'role_index': roleIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationshipMembersCompanion copyWith({
    Value<int>? relationshipId,
    Value<int>? personId,
    Value<int>? roleIndex,
    Value<int>? rowid,
  }) {
    return RelationshipMembersCompanion(
      relationshipId: relationshipId ?? this.relationshipId,
      personId: personId ?? this.personId,
      roleIndex: roleIndex ?? this.roleIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (relationshipId.present) {
      map['relationship_id'] = Variable<int>(relationshipId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (roleIndex.present) {
      map['role_index'] = Variable<int>(roleIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipMembersCompanion(')
          ..write('relationshipId: $relationshipId, ')
          ..write('personId: $personId, ')
          ..write('roleIndex: $roleIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationshipDescendantsTable extends RelationshipDescendants
    with TableInfo<$RelationshipDescendantsTable, RelationshipDescendant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipDescendantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _relationshipIdMeta = const VerificationMeta(
    'relationshipId',
  );
  @override
  late final GeneratedColumn<int> relationshipId = GeneratedColumn<int>(
    'relationship_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES relationships (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [relationshipId, personId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationship_descendants';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelationshipDescendant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('relationship_id')) {
      context.handle(
        _relationshipIdMeta,
        relationshipId.isAcceptableOrUnknown(
          data['relationship_id']!,
          _relationshipIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {relationshipId, personId};
  @override
  RelationshipDescendant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationshipDescendant(
      relationshipId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relationship_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}person_id'],
      )!,
    );
  }

  @override
  $RelationshipDescendantsTable createAlias(String alias) {
    return $RelationshipDescendantsTable(attachedDatabase, alias);
  }
}

class RelationshipDescendant extends DataClass
    implements Insertable<RelationshipDescendant> {
  final int relationshipId;
  final int personId;
  const RelationshipDescendant({
    required this.relationshipId,
    required this.personId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['relationship_id'] = Variable<int>(relationshipId);
    map['person_id'] = Variable<int>(personId);
    return map;
  }

  RelationshipDescendantsCompanion toCompanion(bool nullToAbsent) {
    return RelationshipDescendantsCompanion(
      relationshipId: Value(relationshipId),
      personId: Value(personId),
    );
  }

  factory RelationshipDescendant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationshipDescendant(
      relationshipId: serializer.fromJson<int>(json['relationshipId']),
      personId: serializer.fromJson<int>(json['personId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'relationshipId': serializer.toJson<int>(relationshipId),
      'personId': serializer.toJson<int>(personId),
    };
  }

  RelationshipDescendant copyWith({int? relationshipId, int? personId}) =>
      RelationshipDescendant(
        relationshipId: relationshipId ?? this.relationshipId,
        personId: personId ?? this.personId,
      );
  RelationshipDescendant copyWithCompanion(
    RelationshipDescendantsCompanion data,
  ) {
    return RelationshipDescendant(
      relationshipId: data.relationshipId.present
          ? data.relationshipId.value
          : this.relationshipId,
      personId: data.personId.present ? data.personId.value : this.personId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipDescendant(')
          ..write('relationshipId: $relationshipId, ')
          ..write('personId: $personId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(relationshipId, personId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationshipDescendant &&
          other.relationshipId == this.relationshipId &&
          other.personId == this.personId);
}

class RelationshipDescendantsCompanion
    extends UpdateCompanion<RelationshipDescendant> {
  final Value<int> relationshipId;
  final Value<int> personId;
  final Value<int> rowid;
  const RelationshipDescendantsCompanion({
    this.relationshipId = const Value.absent(),
    this.personId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationshipDescendantsCompanion.insert({
    required int relationshipId,
    required int personId,
    this.rowid = const Value.absent(),
  }) : relationshipId = Value(relationshipId),
       personId = Value(personId);
  static Insertable<RelationshipDescendant> custom({
    Expression<int>? relationshipId,
    Expression<int>? personId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (relationshipId != null) 'relationship_id': relationshipId,
      if (personId != null) 'person_id': personId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationshipDescendantsCompanion copyWith({
    Value<int>? relationshipId,
    Value<int>? personId,
    Value<int>? rowid,
  }) {
    return RelationshipDescendantsCompanion(
      relationshipId: relationshipId ?? this.relationshipId,
      personId: personId ?? this.personId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (relationshipId.present) {
      map['relationship_id'] = Variable<int>(relationshipId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipDescendantsCompanion(')
          ..write('relationshipId: $relationshipId, ')
          ..write('personId: $personId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PedigreesTable pedigrees = $PedigreesTable(this);
  late final $RelationshipsTable relationships = $RelationshipsTable(this);
  late final $PregnanciesTable pregnancies = $PregnanciesTable(this);
  late final $NletsTable nlets = $NletsTable(this);
  late final $PeopleTable people = $PeopleTable(this);
  late final $DiagnosesTable diagnoses = $DiagnosesTable(this);
  late final $MetaTable meta = $MetaTable(this);
  late final $RelationshipMembersTable relationshipMembers =
      $RelationshipMembersTable(this);
  late final $RelationshipDescendantsTable relationshipDescendants =
      $RelationshipDescendantsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pedigrees,
    relationships,
    pregnancies,
    nlets,
    people,
    diagnoses,
    meta,
    relationshipMembers,
    relationshipDescendants,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pedigrees',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('relationships', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pedigrees',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'relationships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pregnancies',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'nlets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('people', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diagnoses', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pedigrees',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meta', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diagnoses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meta', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diagnoses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meta', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diagnoses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meta', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diagnoses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meta', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'relationships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('relationship_members', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('relationship_members', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'relationships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('relationship_descendants', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'people',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('relationship_descendants', kind: UpdateKind.delete),
      ],
    ),
  ]);
}

typedef $$PedigreesTableCreateCompanionBuilder =
    PedigreesCompanion Function({Value<int> id, Value<int?> createdAt});
typedef $$PedigreesTableUpdateCompanionBuilder =
    PedigreesCompanion Function({Value<int> id, Value<int?> createdAt});

final class $$PedigreesTableReferences
    extends BaseReferences<_$AppDatabase, $PedigreesTable, Pedigree> {
  $$PedigreesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RelationshipsTable, List<Relationship>>
  _relationshipsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.relationships,
    aliasName: $_aliasNameGenerator(
      db.pedigrees.id,
      db.relationships.pedigreeId,
    ),
  );

  $$RelationshipsTableProcessedTableManager get relationshipsRefs {
    final manager = $$RelationshipsTableTableManager(
      $_db,
      $_db.relationships,
    ).filter((f) => f.pedigreeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_relationshipsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PeopleTable, List<PeopleData>> _peopleRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.people,
    aliasName: $_aliasNameGenerator(db.pedigrees.id, db.people.pedigreeId),
  );

  $$PeopleTableProcessedTableManager get peopleRefs {
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.pedigreeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_peopleRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MetaTable, List<MetaData>> _metaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meta,
    aliasName: $_aliasNameGenerator(db.pedigrees.id, db.meta.pedigreeId),
  );

  $$MetaTableProcessedTableManager get metaRefs {
    final manager = $$MetaTableTableManager(
      $_db,
      $_db.meta,
    ).filter((f) => f.pedigreeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_metaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PedigreesTableFilterComposer
    extends Composer<_$AppDatabase, $PedigreesTable> {
  $$PedigreesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> relationshipsRefs(
    Expression<bool> Function($$RelationshipsTableFilterComposer f) f,
  ) {
    final $$RelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> peopleRefs(
    Expression<bool> Function($$PeopleTableFilterComposer f) f,
  ) {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> metaRefs(
    Expression<bool> Function($$MetaTableFilterComposer f) f,
  ) {
    final $$MetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableFilterComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PedigreesTableOrderingComposer
    extends Composer<_$AppDatabase, $PedigreesTable> {
  $$PedigreesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PedigreesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PedigreesTable> {
  $$PedigreesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> relationshipsRefs<T extends Object>(
    Expression<T> Function($$RelationshipsTableAnnotationComposer a) f,
  ) {
    final $$RelationshipsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableAnnotationComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> peopleRefs<T extends Object>(
    Expression<T> Function($$PeopleTableAnnotationComposer a) f,
  ) {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> metaRefs<T extends Object>(
    Expression<T> Function($$MetaTableAnnotationComposer a) f,
  ) {
    final $$MetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.pedigreeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableAnnotationComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PedigreesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PedigreesTable,
          Pedigree,
          $$PedigreesTableFilterComposer,
          $$PedigreesTableOrderingComposer,
          $$PedigreesTableAnnotationComposer,
          $$PedigreesTableCreateCompanionBuilder,
          $$PedigreesTableUpdateCompanionBuilder,
          (Pedigree, $$PedigreesTableReferences),
          Pedigree,
          PrefetchHooks Function({
            bool relationshipsRefs,
            bool peopleRefs,
            bool metaRefs,
          })
        > {
  $$PedigreesTableTableManager(_$AppDatabase db, $PedigreesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PedigreesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PedigreesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PedigreesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> createdAt = const Value.absent(),
              }) => PedigreesCompanion(id: id, createdAt: createdAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> createdAt = const Value.absent(),
              }) => PedigreesCompanion.insert(id: id, createdAt: createdAt),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PedigreesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                relationshipsRefs = false,
                peopleRefs = false,
                metaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationshipsRefs) db.relationships,
                    if (peopleRefs) db.people,
                    if (metaRefs) db.meta,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationshipsRefs)
                        await $_getPrefetchedData<
                          Pedigree,
                          $PedigreesTable,
                          Relationship
                        >(
                          currentTable: table,
                          referencedTable: $$PedigreesTableReferences
                              ._relationshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PedigreesTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pedigreeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (peopleRefs)
                        await $_getPrefetchedData<
                          Pedigree,
                          $PedigreesTable,
                          PeopleData
                        >(
                          currentTable: table,
                          referencedTable: $$PedigreesTableReferences
                              ._peopleRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PedigreesTableReferences(
                                db,
                                table,
                                p0,
                              ).peopleRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pedigreeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (metaRefs)
                        await $_getPrefetchedData<
                          Pedigree,
                          $PedigreesTable,
                          MetaData
                        >(
                          currentTable: table,
                          referencedTable: $$PedigreesTableReferences
                              ._metaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PedigreesTableReferences(
                                db,
                                table,
                                p0,
                              ).metaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pedigreeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PedigreesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PedigreesTable,
      Pedigree,
      $$PedigreesTableFilterComposer,
      $$PedigreesTableOrderingComposer,
      $$PedigreesTableAnnotationComposer,
      $$PedigreesTableCreateCompanionBuilder,
      $$PedigreesTableUpdateCompanionBuilder,
      (Pedigree, $$PedigreesTableReferences),
      Pedigree,
      PrefetchHooks Function({
        bool relationshipsRefs,
        bool peopleRefs,
        bool metaRefs,
      })
    >;
typedef $$RelationshipsTableCreateCompanionBuilder =
    RelationshipsCompanion Function({
      Value<int> id,
      required int pedigreeId,
      Value<int> active,
      Value<int> consanguinous,
      Value<String?> consanguinityDegree,
      Value<int> noChildrenByChoice,
      Value<int> noChildrenInfertility,
    });
typedef $$RelationshipsTableUpdateCompanionBuilder =
    RelationshipsCompanion Function({
      Value<int> id,
      Value<int> pedigreeId,
      Value<int> active,
      Value<int> consanguinous,
      Value<String?> consanguinityDegree,
      Value<int> noChildrenByChoice,
      Value<int> noChildrenInfertility,
    });

final class $$RelationshipsTableReferences
    extends BaseReferences<_$AppDatabase, $RelationshipsTable, Relationship> {
  $$RelationshipsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PedigreesTable _pedigreeIdTable(_$AppDatabase db) =>
      db.pedigrees.createAlias(
        $_aliasNameGenerator(db.relationships.pedigreeId, db.pedigrees.id),
      );

  $$PedigreesTableProcessedTableManager get pedigreeId {
    final $_column = $_itemColumn<int>('pedigree_id')!;

    final manager = $$PedigreesTableTableManager(
      $_db,
      $_db.pedigrees,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pedigreeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PeopleTable, List<PeopleData>> _peopleRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.people,
    aliasName: $_aliasNameGenerator(
      db.relationships.id,
      db.people.descendancyRelationshipId,
    ),
  );

  $$PeopleTableProcessedTableManager get peopleRefs {
    final manager = $$PeopleTableTableManager($_db, $_db.people).filter(
      (f) => f.descendancyRelationshipId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_peopleRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationshipMembersTable,
    List<RelationshipMember>
  >
  _relationshipMembersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationshipMembers,
        aliasName: $_aliasNameGenerator(
          db.relationships.id,
          db.relationshipMembers.relationshipId,
        ),
      );

  $$RelationshipMembersTableProcessedTableManager get relationshipMembersRefs {
    final manager = $$RelationshipMembersTableTableManager(
      $_db,
      $_db.relationshipMembers,
    ).filter((f) => f.relationshipId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationshipDescendantsTable,
    List<RelationshipDescendant>
  >
  _relationshipDescendantsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationshipDescendants,
        aliasName: $_aliasNameGenerator(
          db.relationships.id,
          db.relationshipDescendants.relationshipId,
        ),
      );

  $$RelationshipDescendantsTableProcessedTableManager
  get relationshipDescendantsRefs {
    final manager = $$RelationshipDescendantsTableTableManager(
      $_db,
      $_db.relationshipDescendants,
    ).filter((f) => f.relationshipId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipDescendantsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RelationshipsTableFilterComposer
    extends Composer<_$AppDatabase, $RelationshipsTable> {
  $$RelationshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get consanguinous => $composableBuilder(
    column: $table.consanguinous,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consanguinityDegree => $composableBuilder(
    column: $table.consanguinityDegree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => ColumnFilters(column),
  );

  $$PedigreesTableFilterComposer get pedigreeId {
    final $$PedigreesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableFilterComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> peopleRefs(
    Expression<bool> Function($$PeopleTableFilterComposer f) f,
  ) {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.descendancyRelationshipId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationshipMembersRefs(
    Expression<bool> Function($$RelationshipMembersTableFilterComposer f) f,
  ) {
    final $$RelationshipMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationshipMembers,
      getReferencedColumn: (t) => t.relationshipId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipMembersTableFilterComposer(
            $db: $db,
            $table: $db.relationshipMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationshipDescendantsRefs(
    Expression<bool> Function($$RelationshipDescendantsTableFilterComposer f) f,
  ) {
    final $$RelationshipDescendantsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipDescendants,
          getReferencedColumn: (t) => t.relationshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipDescendantsTableFilterComposer(
                $db: $db,
                $table: $db.relationshipDescendants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RelationshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationshipsTable> {
  $$RelationshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get consanguinous => $composableBuilder(
    column: $table.consanguinous,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consanguinityDegree => $composableBuilder(
    column: $table.consanguinityDegree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => ColumnOrderings(column),
  );

  $$PedigreesTableOrderingComposer get pedigreeId {
    final $$PedigreesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableOrderingComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationshipsTable> {
  $$RelationshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get consanguinous => $composableBuilder(
    column: $table.consanguinous,
    builder: (column) => column,
  );

  GeneratedColumn<String> get consanguinityDegree => $composableBuilder(
    column: $table.consanguinityDegree,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => column,
  );

  $$PedigreesTableAnnotationComposer get pedigreeId {
    final $$PedigreesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableAnnotationComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> peopleRefs<T extends Object>(
    Expression<T> Function($$PeopleTableAnnotationComposer a) f,
  ) {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.descendancyRelationshipId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> relationshipMembersRefs<T extends Object>(
    Expression<T> Function($$RelationshipMembersTableAnnotationComposer a) f,
  ) {
    final $$RelationshipMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipMembers,
          getReferencedColumn: (t) => t.relationshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> relationshipDescendantsRefs<T extends Object>(
    Expression<T> Function($$RelationshipDescendantsTableAnnotationComposer a)
    f,
  ) {
    final $$RelationshipDescendantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipDescendants,
          getReferencedColumn: (t) => t.relationshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipDescendantsTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipDescendants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RelationshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationshipsTable,
          Relationship,
          $$RelationshipsTableFilterComposer,
          $$RelationshipsTableOrderingComposer,
          $$RelationshipsTableAnnotationComposer,
          $$RelationshipsTableCreateCompanionBuilder,
          $$RelationshipsTableUpdateCompanionBuilder,
          (Relationship, $$RelationshipsTableReferences),
          Relationship,
          PrefetchHooks Function({
            bool pedigreeId,
            bool peopleRefs,
            bool relationshipMembersRefs,
            bool relationshipDescendantsRefs,
          })
        > {
  $$RelationshipsTableTableManager(_$AppDatabase db, $RelationshipsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationshipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationshipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelationshipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pedigreeId = const Value.absent(),
                Value<int> active = const Value.absent(),
                Value<int> consanguinous = const Value.absent(),
                Value<String?> consanguinityDegree = const Value.absent(),
                Value<int> noChildrenByChoice = const Value.absent(),
                Value<int> noChildrenInfertility = const Value.absent(),
              }) => RelationshipsCompanion(
                id: id,
                pedigreeId: pedigreeId,
                active: active,
                consanguinous: consanguinous,
                consanguinityDegree: consanguinityDegree,
                noChildrenByChoice: noChildrenByChoice,
                noChildrenInfertility: noChildrenInfertility,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pedigreeId,
                Value<int> active = const Value.absent(),
                Value<int> consanguinous = const Value.absent(),
                Value<String?> consanguinityDegree = const Value.absent(),
                Value<int> noChildrenByChoice = const Value.absent(),
                Value<int> noChildrenInfertility = const Value.absent(),
              }) => RelationshipsCompanion.insert(
                id: id,
                pedigreeId: pedigreeId,
                active: active,
                consanguinous: consanguinous,
                consanguinityDegree: consanguinityDegree,
                noChildrenByChoice: noChildrenByChoice,
                noChildrenInfertility: noChildrenInfertility,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pedigreeId = false,
                peopleRefs = false,
                relationshipMembersRefs = false,
                relationshipDescendantsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (peopleRefs) db.people,
                    if (relationshipMembersRefs) db.relationshipMembers,
                    if (relationshipDescendantsRefs) db.relationshipDescendants,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pedigreeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pedigreeId,
                                    referencedTable:
                                        $$RelationshipsTableReferences
                                            ._pedigreeIdTable(db),
                                    referencedColumn:
                                        $$RelationshipsTableReferences
                                            ._pedigreeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (peopleRefs)
                        await $_getPrefetchedData<
                          Relationship,
                          $RelationshipsTable,
                          PeopleData
                        >(
                          currentTable: table,
                          referencedTable: $$RelationshipsTableReferences
                              ._peopleRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RelationshipsTableReferences(
                                db,
                                table,
                                p0,
                              ).peopleRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.descendancyRelationshipId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (relationshipMembersRefs)
                        await $_getPrefetchedData<
                          Relationship,
                          $RelationshipsTable,
                          RelationshipMember
                        >(
                          currentTable: table,
                          referencedTable: $$RelationshipsTableReferences
                              ._relationshipMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RelationshipsTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relationshipId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (relationshipDescendantsRefs)
                        await $_getPrefetchedData<
                          Relationship,
                          $RelationshipsTable,
                          RelationshipDescendant
                        >(
                          currentTable: table,
                          referencedTable: $$RelationshipsTableReferences
                              ._relationshipDescendantsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RelationshipsTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipDescendantsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relationshipId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RelationshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationshipsTable,
      Relationship,
      $$RelationshipsTableFilterComposer,
      $$RelationshipsTableOrderingComposer,
      $$RelationshipsTableAnnotationComposer,
      $$RelationshipsTableCreateCompanionBuilder,
      $$RelationshipsTableUpdateCompanionBuilder,
      (Relationship, $$RelationshipsTableReferences),
      Relationship,
      PrefetchHooks Function({
        bool pedigreeId,
        bool peopleRefs,
        bool relationshipMembersRefs,
        bool relationshipDescendantsRefs,
      })
    >;
typedef $$PregnanciesTableCreateCompanionBuilder =
    PregnanciesCompanion Function({Value<int> id, Value<int?> dateMs});
typedef $$PregnanciesTableUpdateCompanionBuilder =
    PregnanciesCompanion Function({Value<int> id, Value<int?> dateMs});

final class $$PregnanciesTableReferences
    extends BaseReferences<_$AppDatabase, $PregnanciesTable, Pregnancy> {
  $$PregnanciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PeopleTable, List<PeopleData>> _peopleRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.people,
    aliasName: $_aliasNameGenerator(db.pregnancies.id, db.people.pregnancyId),
  );

  $$PeopleTableProcessedTableManager get peopleRefs {
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_peopleRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PregnanciesTableFilterComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dateMs => $composableBuilder(
    column: $table.dateMs,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> peopleRefs(
    Expression<bool> Function($$PeopleTableFilterComposer f) f,
  ) {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PregnanciesTableOrderingComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dateMs => $composableBuilder(
    column: $table.dateMs,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PregnanciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dateMs =>
      $composableBuilder(column: $table.dateMs, builder: (column) => column);

  Expression<T> peopleRefs<T extends Object>(
    Expression<T> Function($$PeopleTableAnnotationComposer a) f,
  ) {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PregnanciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PregnanciesTable,
          Pregnancy,
          $$PregnanciesTableFilterComposer,
          $$PregnanciesTableOrderingComposer,
          $$PregnanciesTableAnnotationComposer,
          $$PregnanciesTableCreateCompanionBuilder,
          $$PregnanciesTableUpdateCompanionBuilder,
          (Pregnancy, $$PregnanciesTableReferences),
          Pregnancy,
          PrefetchHooks Function({bool peopleRefs})
        > {
  $$PregnanciesTableTableManager(_$AppDatabase db, $PregnanciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PregnanciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PregnanciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PregnanciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> dateMs = const Value.absent(),
              }) => PregnanciesCompanion(id: id, dateMs: dateMs),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> dateMs = const Value.absent(),
              }) => PregnanciesCompanion.insert(id: id, dateMs: dateMs),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PregnanciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({peopleRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (peopleRefs) db.people],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (peopleRefs)
                    await $_getPrefetchedData<
                      Pregnancy,
                      $PregnanciesTable,
                      PeopleData
                    >(
                      currentTable: table,
                      referencedTable: $$PregnanciesTableReferences
                          ._peopleRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PregnanciesTableReferences(
                            db,
                            table,
                            p0,
                          ).peopleRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.pregnancyId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PregnanciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PregnanciesTable,
      Pregnancy,
      $$PregnanciesTableFilterComposer,
      $$PregnanciesTableOrderingComposer,
      $$PregnanciesTableAnnotationComposer,
      $$PregnanciesTableCreateCompanionBuilder,
      $$PregnanciesTableUpdateCompanionBuilder,
      (Pregnancy, $$PregnanciesTableReferences),
      Pregnancy,
      PrefetchHooks Function({bool peopleRefs})
    >;
typedef $$NletsTableCreateCompanionBuilder =
    NletsCompanion Function({Value<int> id});
typedef $$NletsTableUpdateCompanionBuilder =
    NletsCompanion Function({Value<int> id});

final class $$NletsTableReferences
    extends BaseReferences<_$AppDatabase, $NletsTable, Nlet> {
  $$NletsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PeopleTable, List<PeopleData>> _peopleRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.people,
    aliasName: $_aliasNameGenerator(db.nlets.id, db.people.nletsId),
  );

  $$PeopleTableProcessedTableManager get peopleRefs {
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.nletsId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_peopleRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NletsTableFilterComposer extends Composer<_$AppDatabase, $NletsTable> {
  $$NletsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> peopleRefs(
    Expression<bool> Function($$PeopleTableFilterComposer f) f,
  ) {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.nletsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NletsTableOrderingComposer
    extends Composer<_$AppDatabase, $NletsTable> {
  $$NletsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NletsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NletsTable> {
  $$NletsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> peopleRefs<T extends Object>(
    Expression<T> Function($$PeopleTableAnnotationComposer a) f,
  ) {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.nletsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NletsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NletsTable,
          Nlet,
          $$NletsTableFilterComposer,
          $$NletsTableOrderingComposer,
          $$NletsTableAnnotationComposer,
          $$NletsTableCreateCompanionBuilder,
          $$NletsTableUpdateCompanionBuilder,
          (Nlet, $$NletsTableReferences),
          Nlet,
          PrefetchHooks Function({bool peopleRefs})
        > {
  $$NletsTableTableManager(_$AppDatabase db, $NletsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NletsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NletsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NletsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              NletsCompanion(id: id),
          createCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              NletsCompanion.insert(id: id),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$NletsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({peopleRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (peopleRefs) db.people],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (peopleRefs)
                    await $_getPrefetchedData<Nlet, $NletsTable, PeopleData>(
                      currentTable: table,
                      referencedTable: $$NletsTableReferences._peopleRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$NletsTableReferences(db, table, p0).peopleRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.nletsId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NletsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NletsTable,
      Nlet,
      $$NletsTableFilterComposer,
      $$NletsTableOrderingComposer,
      $$NletsTableAnnotationComposer,
      $$NletsTableCreateCompanionBuilder,
      $$NletsTableUpdateCompanionBuilder,
      (Nlet, $$NletsTableReferences),
      Nlet,
      PrefetchHooks Function({bool peopleRefs})
    >;
typedef $$PeopleTableCreateCompanionBuilder =
    PeopleCompanion Function({
      Value<int> id,
      required int pedigreeId,
      Value<int> nodeId,
      Value<double> centerX,
      Value<double> centerY,
      Value<String?> sex,
      Value<String> quantity,
      Value<String?> age,
      Value<String?> ageUnits,
      Value<String?> height,
      Value<String?> gestAge,
      Value<String?> note,
      Value<int> proband,
      Value<int> deceased,
      Value<int> aw,
      Value<int> stillBirth,
      Value<int> sab,
      Value<int> top,
      Value<int> p,
      Value<int> donor,
      Value<int> surrogate,
      Value<int> adoptedIn,
      Value<int> adoptedOut,
      Value<int> noChildrenByChoice,
      Value<int> noChildrenInfertility,
      Value<String?> infertilityReason,
      Value<int> carriedBySurrogate,
      Value<String?> ageAtDeath,
      Value<String?> ageAtDeathUnits,
      Value<String?> causeOfDeath,
      Value<String?> causeOfDeathOntology,
      Value<String?> causeOfDeathOntologyId,
      Value<String?> causeOfDeathOntologyVersion,
      Value<int> affected1,
      Value<int> affected2,
      Value<int> affected3,
      Value<int> affected4,
      Value<double?> affected1DxAge,
      Value<double?> affected2DxAge,
      Value<double?> affected3DxAge,
      Value<double?> affected4DxAge,
      Value<String> affected1DxAgeUnits,
      Value<String> affected2DxAgeUnits,
      Value<String> affected3DxAgeUnits,
      Value<String> affected4DxAgeUnits,
      Value<int?> descendancyRelationshipId,
      Value<int?> explicitBioMotherId,
      Value<int?> explicitBioFatherId,
      Value<int?> eggDonorId,
      Value<int?> spermDonorId,
      Value<int?> carriedById,
      Value<int?> pregnancyId,
      Value<int?> nletsId,
    });
typedef $$PeopleTableUpdateCompanionBuilder =
    PeopleCompanion Function({
      Value<int> id,
      Value<int> pedigreeId,
      Value<int> nodeId,
      Value<double> centerX,
      Value<double> centerY,
      Value<String?> sex,
      Value<String> quantity,
      Value<String?> age,
      Value<String?> ageUnits,
      Value<String?> height,
      Value<String?> gestAge,
      Value<String?> note,
      Value<int> proband,
      Value<int> deceased,
      Value<int> aw,
      Value<int> stillBirth,
      Value<int> sab,
      Value<int> top,
      Value<int> p,
      Value<int> donor,
      Value<int> surrogate,
      Value<int> adoptedIn,
      Value<int> adoptedOut,
      Value<int> noChildrenByChoice,
      Value<int> noChildrenInfertility,
      Value<String?> infertilityReason,
      Value<int> carriedBySurrogate,
      Value<String?> ageAtDeath,
      Value<String?> ageAtDeathUnits,
      Value<String?> causeOfDeath,
      Value<String?> causeOfDeathOntology,
      Value<String?> causeOfDeathOntologyId,
      Value<String?> causeOfDeathOntologyVersion,
      Value<int> affected1,
      Value<int> affected2,
      Value<int> affected3,
      Value<int> affected4,
      Value<double?> affected1DxAge,
      Value<double?> affected2DxAge,
      Value<double?> affected3DxAge,
      Value<double?> affected4DxAge,
      Value<String> affected1DxAgeUnits,
      Value<String> affected2DxAgeUnits,
      Value<String> affected3DxAgeUnits,
      Value<String> affected4DxAgeUnits,
      Value<int?> descendancyRelationshipId,
      Value<int?> explicitBioMotherId,
      Value<int?> explicitBioFatherId,
      Value<int?> eggDonorId,
      Value<int?> spermDonorId,
      Value<int?> carriedById,
      Value<int?> pregnancyId,
      Value<int?> nletsId,
    });

final class $$PeopleTableReferences
    extends BaseReferences<_$AppDatabase, $PeopleTable, PeopleData> {
  $$PeopleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PedigreesTable _pedigreeIdTable(_$AppDatabase db) => db.pedigrees
      .createAlias($_aliasNameGenerator(db.people.pedigreeId, db.pedigrees.id));

  $$PedigreesTableProcessedTableManager get pedigreeId {
    final $_column = $_itemColumn<int>('pedigree_id')!;

    final manager = $$PedigreesTableTableManager(
      $_db,
      $_db.pedigrees,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pedigreeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RelationshipsTable _descendancyRelationshipIdTable(
    _$AppDatabase db,
  ) => db.relationships.createAlias(
    $_aliasNameGenerator(
      db.people.descendancyRelationshipId,
      db.relationships.id,
    ),
  );

  $$RelationshipsTableProcessedTableManager? get descendancyRelationshipId {
    final $_column = $_itemColumn<int>('descendancy_relationship_id');
    if ($_column == null) return null;
    final manager = $$RelationshipsTableTableManager(
      $_db,
      $_db.relationships,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _descendancyRelationshipIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _explicitBioMotherIdTable(_$AppDatabase db) =>
      db.people.createAlias(
        $_aliasNameGenerator(db.people.explicitBioMotherId, db.people.id),
      );

  $$PeopleTableProcessedTableManager? get explicitBioMotherId {
    final $_column = $_itemColumn<int>('explicit_bio_mother_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_explicitBioMotherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _explicitBioFatherIdTable(_$AppDatabase db) =>
      db.people.createAlias(
        $_aliasNameGenerator(db.people.explicitBioFatherId, db.people.id),
      );

  $$PeopleTableProcessedTableManager? get explicitBioFatherId {
    final $_column = $_itemColumn<int>('explicit_bio_father_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_explicitBioFatherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _eggDonorIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.people.eggDonorId, db.people.id));

  $$PeopleTableProcessedTableManager? get eggDonorId {
    final $_column = $_itemColumn<int>('egg_donor_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eggDonorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _spermDonorIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.people.spermDonorId, db.people.id));

  $$PeopleTableProcessedTableManager? get spermDonorId {
    final $_column = $_itemColumn<int>('sperm_donor_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spermDonorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _carriedByIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.people.carriedById, db.people.id));

  $$PeopleTableProcessedTableManager? get carriedById {
    final $_column = $_itemColumn<int>('carried_by_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_carriedByIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(db.people.pregnancyId, db.pregnancies.id),
      );

  $$PregnanciesTableProcessedTableManager? get pregnancyId {
    final $_column = $_itemColumn<int>('pregnancy_id');
    if ($_column == null) return null;
    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $NletsTable _nletsIdTable(_$AppDatabase db) => db.nlets.createAlias(
    $_aliasNameGenerator(db.people.nletsId, db.nlets.id),
  );

  $$NletsTableProcessedTableManager? get nletsId {
    final $_column = $_itemColumn<int>('nlets_id');
    if ($_column == null) return null;
    final manager = $$NletsTableTableManager(
      $_db,
      $_db.nlets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nletsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DiagnosesTable, List<Diagnose>>
  _diagnosesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diagnoses,
    aliasName: $_aliasNameGenerator(db.people.id, db.diagnoses.personId),
  );

  $$DiagnosesTableProcessedTableManager get diagnosesRefs {
    final manager = $$DiagnosesTableTableManager(
      $_db,
      $_db.diagnoses,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_diagnosesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationshipMembersTable,
    List<RelationshipMember>
  >
  _relationshipMembersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationshipMembers,
        aliasName: $_aliasNameGenerator(
          db.people.id,
          db.relationshipMembers.personId,
        ),
      );

  $$RelationshipMembersTableProcessedTableManager get relationshipMembersRefs {
    final manager = $$RelationshipMembersTableTableManager(
      $_db,
      $_db.relationshipMembers,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationshipDescendantsTable,
    List<RelationshipDescendant>
  >
  _relationshipDescendantsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationshipDescendants,
        aliasName: $_aliasNameGenerator(
          db.people.id,
          db.relationshipDescendants.personId,
        ),
      );

  $$RelationshipDescendantsTableProcessedTableManager
  get relationshipDescendantsRefs {
    final manager = $$RelationshipDescendantsTableTableManager(
      $_db,
      $_db.relationshipDescendants,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipDescendantsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PeopleTableFilterComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centerX => $composableBuilder(
    column: $table.centerX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centerY => $composableBuilder(
    column: $table.centerY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageUnits => $composableBuilder(
    column: $table.ageUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gestAge => $composableBuilder(
    column: $table.gestAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get proband => $composableBuilder(
    column: $table.proband,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deceased => $composableBuilder(
    column: $table.deceased,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aw => $composableBuilder(
    column: $table.aw,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stillBirth => $composableBuilder(
    column: $table.stillBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sab => $composableBuilder(
    column: $table.sab,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get top => $composableBuilder(
    column: $table.top,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get donor => $composableBuilder(
    column: $table.donor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surrogate => $composableBuilder(
    column: $table.surrogate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adoptedIn => $composableBuilder(
    column: $table.adoptedIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adoptedOut => $composableBuilder(
    column: $table.adoptedOut,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get infertilityReason => $composableBuilder(
    column: $table.infertilityReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carriedBySurrogate => $composableBuilder(
    column: $table.carriedBySurrogate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageAtDeath => $composableBuilder(
    column: $table.ageAtDeath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageAtDeathUnits => $composableBuilder(
    column: $table.ageAtDeathUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get causeOfDeathOntology => $composableBuilder(
    column: $table.causeOfDeathOntology,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get causeOfDeathOntologyId => $composableBuilder(
    column: $table.causeOfDeathOntologyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get causeOfDeathOntologyVersion => $composableBuilder(
    column: $table.causeOfDeathOntologyVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affected1 => $composableBuilder(
    column: $table.affected1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affected2 => $composableBuilder(
    column: $table.affected2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affected3 => $composableBuilder(
    column: $table.affected3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affected4 => $composableBuilder(
    column: $table.affected4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get affected1DxAge => $composableBuilder(
    column: $table.affected1DxAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get affected2DxAge => $composableBuilder(
    column: $table.affected2DxAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get affected3DxAge => $composableBuilder(
    column: $table.affected3DxAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get affected4DxAge => $composableBuilder(
    column: $table.affected4DxAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get affected1DxAgeUnits => $composableBuilder(
    column: $table.affected1DxAgeUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get affected2DxAgeUnits => $composableBuilder(
    column: $table.affected2DxAgeUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get affected3DxAgeUnits => $composableBuilder(
    column: $table.affected3DxAgeUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get affected4DxAgeUnits => $composableBuilder(
    column: $table.affected4DxAgeUnits,
    builder: (column) => ColumnFilters(column),
  );

  $$PedigreesTableFilterComposer get pedigreeId {
    final $$PedigreesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableFilterComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RelationshipsTableFilterComposer get descendancyRelationshipId {
    final $$RelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.descendancyRelationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get explicitBioMotherId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioMotherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get explicitBioFatherId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioFatherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get eggDonorId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eggDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get spermDonorId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spermDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get carriedById {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.carriedById,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NletsTableFilterComposer get nletsId {
    final $$NletsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nletsId,
      referencedTable: $db.nlets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NletsTableFilterComposer(
            $db: $db,
            $table: $db.nlets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> diagnosesRefs(
    Expression<bool> Function($$DiagnosesTableFilterComposer f) f,
  ) {
    final $$DiagnosesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableFilterComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationshipMembersRefs(
    Expression<bool> Function($$RelationshipMembersTableFilterComposer f) f,
  ) {
    final $$RelationshipMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationshipMembers,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipMembersTableFilterComposer(
            $db: $db,
            $table: $db.relationshipMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationshipDescendantsRefs(
    Expression<bool> Function($$RelationshipDescendantsTableFilterComposer f) f,
  ) {
    final $$RelationshipDescendantsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipDescendants,
          getReferencedColumn: (t) => t.personId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipDescendantsTableFilterComposer(
                $db: $db,
                $table: $db.relationshipDescendants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PeopleTableOrderingComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centerX => $composableBuilder(
    column: $table.centerX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centerY => $composableBuilder(
    column: $table.centerY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageUnits => $composableBuilder(
    column: $table.ageUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gestAge => $composableBuilder(
    column: $table.gestAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get proband => $composableBuilder(
    column: $table.proband,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deceased => $composableBuilder(
    column: $table.deceased,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aw => $composableBuilder(
    column: $table.aw,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stillBirth => $composableBuilder(
    column: $table.stillBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sab => $composableBuilder(
    column: $table.sab,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get top => $composableBuilder(
    column: $table.top,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get donor => $composableBuilder(
    column: $table.donor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surrogate => $composableBuilder(
    column: $table.surrogate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adoptedIn => $composableBuilder(
    column: $table.adoptedIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adoptedOut => $composableBuilder(
    column: $table.adoptedOut,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get infertilityReason => $composableBuilder(
    column: $table.infertilityReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carriedBySurrogate => $composableBuilder(
    column: $table.carriedBySurrogate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageAtDeath => $composableBuilder(
    column: $table.ageAtDeath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageAtDeathUnits => $composableBuilder(
    column: $table.ageAtDeathUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get causeOfDeathOntology => $composableBuilder(
    column: $table.causeOfDeathOntology,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get causeOfDeathOntologyId => $composableBuilder(
    column: $table.causeOfDeathOntologyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get causeOfDeathOntologyVersion => $composableBuilder(
    column: $table.causeOfDeathOntologyVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affected1 => $composableBuilder(
    column: $table.affected1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affected2 => $composableBuilder(
    column: $table.affected2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affected3 => $composableBuilder(
    column: $table.affected3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affected4 => $composableBuilder(
    column: $table.affected4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get affected1DxAge => $composableBuilder(
    column: $table.affected1DxAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get affected2DxAge => $composableBuilder(
    column: $table.affected2DxAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get affected3DxAge => $composableBuilder(
    column: $table.affected3DxAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get affected4DxAge => $composableBuilder(
    column: $table.affected4DxAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get affected1DxAgeUnits => $composableBuilder(
    column: $table.affected1DxAgeUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get affected2DxAgeUnits => $composableBuilder(
    column: $table.affected2DxAgeUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get affected3DxAgeUnits => $composableBuilder(
    column: $table.affected3DxAgeUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get affected4DxAgeUnits => $composableBuilder(
    column: $table.affected4DxAgeUnits,
    builder: (column) => ColumnOrderings(column),
  );

  $$PedigreesTableOrderingComposer get pedigreeId {
    final $$PedigreesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableOrderingComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RelationshipsTableOrderingComposer get descendancyRelationshipId {
    final $$RelationshipsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.descendancyRelationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableOrderingComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get explicitBioMotherId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioMotherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get explicitBioFatherId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioFatherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get eggDonorId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eggDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get spermDonorId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spermDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get carriedById {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.carriedById,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NletsTableOrderingComposer get nletsId {
    final $$NletsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nletsId,
      referencedTable: $db.nlets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NletsTableOrderingComposer(
            $db: $db,
            $table: $db.nlets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PeopleTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<double> get centerX =>
      $composableBuilder(column: $table.centerX, builder: (column) => column);

  GeneratedColumn<double> get centerY =>
      $composableBuilder(column: $table.centerY, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get ageUnits =>
      $composableBuilder(column: $table.ageUnits, builder: (column) => column);

  GeneratedColumn<String> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get gestAge =>
      $composableBuilder(column: $table.gestAge, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get proband =>
      $composableBuilder(column: $table.proband, builder: (column) => column);

  GeneratedColumn<int> get deceased =>
      $composableBuilder(column: $table.deceased, builder: (column) => column);

  GeneratedColumn<int> get aw =>
      $composableBuilder(column: $table.aw, builder: (column) => column);

  GeneratedColumn<int> get stillBirth => $composableBuilder(
    column: $table.stillBirth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sab =>
      $composableBuilder(column: $table.sab, builder: (column) => column);

  GeneratedColumn<int> get top =>
      $composableBuilder(column: $table.top, builder: (column) => column);

  GeneratedColumn<int> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<int> get donor =>
      $composableBuilder(column: $table.donor, builder: (column) => column);

  GeneratedColumn<int> get surrogate =>
      $composableBuilder(column: $table.surrogate, builder: (column) => column);

  GeneratedColumn<int> get adoptedIn =>
      $composableBuilder(column: $table.adoptedIn, builder: (column) => column);

  GeneratedColumn<int> get adoptedOut => $composableBuilder(
    column: $table.adoptedOut,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noChildrenByChoice => $composableBuilder(
    column: $table.noChildrenByChoice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noChildrenInfertility => $composableBuilder(
    column: $table.noChildrenInfertility,
    builder: (column) => column,
  );

  GeneratedColumn<String> get infertilityReason => $composableBuilder(
    column: $table.infertilityReason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get carriedBySurrogate => $composableBuilder(
    column: $table.carriedBySurrogate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ageAtDeath => $composableBuilder(
    column: $table.ageAtDeath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ageAtDeathUnits => $composableBuilder(
    column: $table.ageAtDeathUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get causeOfDeathOntology => $composableBuilder(
    column: $table.causeOfDeathOntology,
    builder: (column) => column,
  );

  GeneratedColumn<String> get causeOfDeathOntologyId => $composableBuilder(
    column: $table.causeOfDeathOntologyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get causeOfDeathOntologyVersion => $composableBuilder(
    column: $table.causeOfDeathOntologyVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get affected1 =>
      $composableBuilder(column: $table.affected1, builder: (column) => column);

  GeneratedColumn<int> get affected2 =>
      $composableBuilder(column: $table.affected2, builder: (column) => column);

  GeneratedColumn<int> get affected3 =>
      $composableBuilder(column: $table.affected3, builder: (column) => column);

  GeneratedColumn<int> get affected4 =>
      $composableBuilder(column: $table.affected4, builder: (column) => column);

  GeneratedColumn<double> get affected1DxAge => $composableBuilder(
    column: $table.affected1DxAge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get affected2DxAge => $composableBuilder(
    column: $table.affected2DxAge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get affected3DxAge => $composableBuilder(
    column: $table.affected3DxAge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get affected4DxAge => $composableBuilder(
    column: $table.affected4DxAge,
    builder: (column) => column,
  );

  GeneratedColumn<String> get affected1DxAgeUnits => $composableBuilder(
    column: $table.affected1DxAgeUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get affected2DxAgeUnits => $composableBuilder(
    column: $table.affected2DxAgeUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get affected3DxAgeUnits => $composableBuilder(
    column: $table.affected3DxAgeUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get affected4DxAgeUnits => $composableBuilder(
    column: $table.affected4DxAgeUnits,
    builder: (column) => column,
  );

  $$PedigreesTableAnnotationComposer get pedigreeId {
    final $$PedigreesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableAnnotationComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RelationshipsTableAnnotationComposer get descendancyRelationshipId {
    final $$RelationshipsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.descendancyRelationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableAnnotationComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get explicitBioMotherId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioMotherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get explicitBioFatherId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.explicitBioFatherId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get eggDonorId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eggDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get spermDonorId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spermDonorId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get carriedById {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.carriedById,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NletsTableAnnotationComposer get nletsId {
    final $$NletsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nletsId,
      referencedTable: $db.nlets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NletsTableAnnotationComposer(
            $db: $db,
            $table: $db.nlets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> diagnosesRefs<T extends Object>(
    Expression<T> Function($$DiagnosesTableAnnotationComposer a) f,
  ) {
    final $$DiagnosesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> relationshipMembersRefs<T extends Object>(
    Expression<T> Function($$RelationshipMembersTableAnnotationComposer a) f,
  ) {
    final $$RelationshipMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipMembers,
          getReferencedColumn: (t) => t.personId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> relationshipDescendantsRefs<T extends Object>(
    Expression<T> Function($$RelationshipDescendantsTableAnnotationComposer a)
    f,
  ) {
    final $$RelationshipDescendantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipDescendants,
          getReferencedColumn: (t) => t.personId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipDescendantsTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipDescendants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PeopleTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeopleTable,
          PeopleData,
          $$PeopleTableFilterComposer,
          $$PeopleTableOrderingComposer,
          $$PeopleTableAnnotationComposer,
          $$PeopleTableCreateCompanionBuilder,
          $$PeopleTableUpdateCompanionBuilder,
          (PeopleData, $$PeopleTableReferences),
          PeopleData,
          PrefetchHooks Function({
            bool pedigreeId,
            bool descendancyRelationshipId,
            bool explicitBioMotherId,
            bool explicitBioFatherId,
            bool eggDonorId,
            bool spermDonorId,
            bool carriedById,
            bool pregnancyId,
            bool nletsId,
            bool diagnosesRefs,
            bool relationshipMembersRefs,
            bool relationshipDescendantsRefs,
          })
        > {
  $$PeopleTableTableManager(_$AppDatabase db, $PeopleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeopleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeopleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeopleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pedigreeId = const Value.absent(),
                Value<int> nodeId = const Value.absent(),
                Value<double> centerX = const Value.absent(),
                Value<double> centerY = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String> quantity = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> ageUnits = const Value.absent(),
                Value<String?> height = const Value.absent(),
                Value<String?> gestAge = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> proband = const Value.absent(),
                Value<int> deceased = const Value.absent(),
                Value<int> aw = const Value.absent(),
                Value<int> stillBirth = const Value.absent(),
                Value<int> sab = const Value.absent(),
                Value<int> top = const Value.absent(),
                Value<int> p = const Value.absent(),
                Value<int> donor = const Value.absent(),
                Value<int> surrogate = const Value.absent(),
                Value<int> adoptedIn = const Value.absent(),
                Value<int> adoptedOut = const Value.absent(),
                Value<int> noChildrenByChoice = const Value.absent(),
                Value<int> noChildrenInfertility = const Value.absent(),
                Value<String?> infertilityReason = const Value.absent(),
                Value<int> carriedBySurrogate = const Value.absent(),
                Value<String?> ageAtDeath = const Value.absent(),
                Value<String?> ageAtDeathUnits = const Value.absent(),
                Value<String?> causeOfDeath = const Value.absent(),
                Value<String?> causeOfDeathOntology = const Value.absent(),
                Value<String?> causeOfDeathOntologyId = const Value.absent(),
                Value<String?> causeOfDeathOntologyVersion =
                    const Value.absent(),
                Value<int> affected1 = const Value.absent(),
                Value<int> affected2 = const Value.absent(),
                Value<int> affected3 = const Value.absent(),
                Value<int> affected4 = const Value.absent(),
                Value<double?> affected1DxAge = const Value.absent(),
                Value<double?> affected2DxAge = const Value.absent(),
                Value<double?> affected3DxAge = const Value.absent(),
                Value<double?> affected4DxAge = const Value.absent(),
                Value<String> affected1DxAgeUnits = const Value.absent(),
                Value<String> affected2DxAgeUnits = const Value.absent(),
                Value<String> affected3DxAgeUnits = const Value.absent(),
                Value<String> affected4DxAgeUnits = const Value.absent(),
                Value<int?> descendancyRelationshipId = const Value.absent(),
                Value<int?> explicitBioMotherId = const Value.absent(),
                Value<int?> explicitBioFatherId = const Value.absent(),
                Value<int?> eggDonorId = const Value.absent(),
                Value<int?> spermDonorId = const Value.absent(),
                Value<int?> carriedById = const Value.absent(),
                Value<int?> pregnancyId = const Value.absent(),
                Value<int?> nletsId = const Value.absent(),
              }) => PeopleCompanion(
                id: id,
                pedigreeId: pedigreeId,
                nodeId: nodeId,
                centerX: centerX,
                centerY: centerY,
                sex: sex,
                quantity: quantity,
                age: age,
                ageUnits: ageUnits,
                height: height,
                gestAge: gestAge,
                note: note,
                proband: proband,
                deceased: deceased,
                aw: aw,
                stillBirth: stillBirth,
                sab: sab,
                top: top,
                p: p,
                donor: donor,
                surrogate: surrogate,
                adoptedIn: adoptedIn,
                adoptedOut: adoptedOut,
                noChildrenByChoice: noChildrenByChoice,
                noChildrenInfertility: noChildrenInfertility,
                infertilityReason: infertilityReason,
                carriedBySurrogate: carriedBySurrogate,
                ageAtDeath: ageAtDeath,
                ageAtDeathUnits: ageAtDeathUnits,
                causeOfDeath: causeOfDeath,
                causeOfDeathOntology: causeOfDeathOntology,
                causeOfDeathOntologyId: causeOfDeathOntologyId,
                causeOfDeathOntologyVersion: causeOfDeathOntologyVersion,
                affected1: affected1,
                affected2: affected2,
                affected3: affected3,
                affected4: affected4,
                affected1DxAge: affected1DxAge,
                affected2DxAge: affected2DxAge,
                affected3DxAge: affected3DxAge,
                affected4DxAge: affected4DxAge,
                affected1DxAgeUnits: affected1DxAgeUnits,
                affected2DxAgeUnits: affected2DxAgeUnits,
                affected3DxAgeUnits: affected3DxAgeUnits,
                affected4DxAgeUnits: affected4DxAgeUnits,
                descendancyRelationshipId: descendancyRelationshipId,
                explicitBioMotherId: explicitBioMotherId,
                explicitBioFatherId: explicitBioFatherId,
                eggDonorId: eggDonorId,
                spermDonorId: spermDonorId,
                carriedById: carriedById,
                pregnancyId: pregnancyId,
                nletsId: nletsId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pedigreeId,
                Value<int> nodeId = const Value.absent(),
                Value<double> centerX = const Value.absent(),
                Value<double> centerY = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String> quantity = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> ageUnits = const Value.absent(),
                Value<String?> height = const Value.absent(),
                Value<String?> gestAge = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> proband = const Value.absent(),
                Value<int> deceased = const Value.absent(),
                Value<int> aw = const Value.absent(),
                Value<int> stillBirth = const Value.absent(),
                Value<int> sab = const Value.absent(),
                Value<int> top = const Value.absent(),
                Value<int> p = const Value.absent(),
                Value<int> donor = const Value.absent(),
                Value<int> surrogate = const Value.absent(),
                Value<int> adoptedIn = const Value.absent(),
                Value<int> adoptedOut = const Value.absent(),
                Value<int> noChildrenByChoice = const Value.absent(),
                Value<int> noChildrenInfertility = const Value.absent(),
                Value<String?> infertilityReason = const Value.absent(),
                Value<int> carriedBySurrogate = const Value.absent(),
                Value<String?> ageAtDeath = const Value.absent(),
                Value<String?> ageAtDeathUnits = const Value.absent(),
                Value<String?> causeOfDeath = const Value.absent(),
                Value<String?> causeOfDeathOntology = const Value.absent(),
                Value<String?> causeOfDeathOntologyId = const Value.absent(),
                Value<String?> causeOfDeathOntologyVersion =
                    const Value.absent(),
                Value<int> affected1 = const Value.absent(),
                Value<int> affected2 = const Value.absent(),
                Value<int> affected3 = const Value.absent(),
                Value<int> affected4 = const Value.absent(),
                Value<double?> affected1DxAge = const Value.absent(),
                Value<double?> affected2DxAge = const Value.absent(),
                Value<double?> affected3DxAge = const Value.absent(),
                Value<double?> affected4DxAge = const Value.absent(),
                Value<String> affected1DxAgeUnits = const Value.absent(),
                Value<String> affected2DxAgeUnits = const Value.absent(),
                Value<String> affected3DxAgeUnits = const Value.absent(),
                Value<String> affected4DxAgeUnits = const Value.absent(),
                Value<int?> descendancyRelationshipId = const Value.absent(),
                Value<int?> explicitBioMotherId = const Value.absent(),
                Value<int?> explicitBioFatherId = const Value.absent(),
                Value<int?> eggDonorId = const Value.absent(),
                Value<int?> spermDonorId = const Value.absent(),
                Value<int?> carriedById = const Value.absent(),
                Value<int?> pregnancyId = const Value.absent(),
                Value<int?> nletsId = const Value.absent(),
              }) => PeopleCompanion.insert(
                id: id,
                pedigreeId: pedigreeId,
                nodeId: nodeId,
                centerX: centerX,
                centerY: centerY,
                sex: sex,
                quantity: quantity,
                age: age,
                ageUnits: ageUnits,
                height: height,
                gestAge: gestAge,
                note: note,
                proband: proband,
                deceased: deceased,
                aw: aw,
                stillBirth: stillBirth,
                sab: sab,
                top: top,
                p: p,
                donor: donor,
                surrogate: surrogate,
                adoptedIn: adoptedIn,
                adoptedOut: adoptedOut,
                noChildrenByChoice: noChildrenByChoice,
                noChildrenInfertility: noChildrenInfertility,
                infertilityReason: infertilityReason,
                carriedBySurrogate: carriedBySurrogate,
                ageAtDeath: ageAtDeath,
                ageAtDeathUnits: ageAtDeathUnits,
                causeOfDeath: causeOfDeath,
                causeOfDeathOntology: causeOfDeathOntology,
                causeOfDeathOntologyId: causeOfDeathOntologyId,
                causeOfDeathOntologyVersion: causeOfDeathOntologyVersion,
                affected1: affected1,
                affected2: affected2,
                affected3: affected3,
                affected4: affected4,
                affected1DxAge: affected1DxAge,
                affected2DxAge: affected2DxAge,
                affected3DxAge: affected3DxAge,
                affected4DxAge: affected4DxAge,
                affected1DxAgeUnits: affected1DxAgeUnits,
                affected2DxAgeUnits: affected2DxAgeUnits,
                affected3DxAgeUnits: affected3DxAgeUnits,
                affected4DxAgeUnits: affected4DxAgeUnits,
                descendancyRelationshipId: descendancyRelationshipId,
                explicitBioMotherId: explicitBioMotherId,
                explicitBioFatherId: explicitBioFatherId,
                eggDonorId: eggDonorId,
                spermDonorId: spermDonorId,
                carriedById: carriedById,
                pregnancyId: pregnancyId,
                nletsId: nletsId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PeopleTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pedigreeId = false,
                descendancyRelationshipId = false,
                explicitBioMotherId = false,
                explicitBioFatherId = false,
                eggDonorId = false,
                spermDonorId = false,
                carriedById = false,
                pregnancyId = false,
                nletsId = false,
                diagnosesRefs = false,
                relationshipMembersRefs = false,
                relationshipDescendantsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (diagnosesRefs) db.diagnoses,
                    if (relationshipMembersRefs) db.relationshipMembers,
                    if (relationshipDescendantsRefs) db.relationshipDescendants,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pedigreeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pedigreeId,
                                    referencedTable: $$PeopleTableReferences
                                        ._pedigreeIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._pedigreeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (descendancyRelationshipId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.descendancyRelationshipId,
                                    referencedTable: $$PeopleTableReferences
                                        ._descendancyRelationshipIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._descendancyRelationshipIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (explicitBioMotherId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.explicitBioMotherId,
                                    referencedTable: $$PeopleTableReferences
                                        ._explicitBioMotherIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._explicitBioMotherIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (explicitBioFatherId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.explicitBioFatherId,
                                    referencedTable: $$PeopleTableReferences
                                        ._explicitBioFatherIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._explicitBioFatherIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (eggDonorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.eggDonorId,
                                    referencedTable: $$PeopleTableReferences
                                        ._eggDonorIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._eggDonorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (spermDonorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.spermDonorId,
                                    referencedTable: $$PeopleTableReferences
                                        ._spermDonorIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._spermDonorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (carriedById) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.carriedById,
                                    referencedTable: $$PeopleTableReferences
                                        ._carriedByIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._carriedByIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (pregnancyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pregnancyId,
                                    referencedTable: $$PeopleTableReferences
                                        ._pregnancyIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._pregnancyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (nletsId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.nletsId,
                                    referencedTable: $$PeopleTableReferences
                                        ._nletsIdTable(db),
                                    referencedColumn: $$PeopleTableReferences
                                        ._nletsIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (diagnosesRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          $PeopleTable,
                          Diagnose
                        >(
                          currentTable: table,
                          referencedTable: $$PeopleTableReferences
                              ._diagnosesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PeopleTableReferences(
                                db,
                                table,
                                p0,
                              ).diagnosesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.personId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (relationshipMembersRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          $PeopleTable,
                          RelationshipMember
                        >(
                          currentTable: table,
                          referencedTable: $$PeopleTableReferences
                              ._relationshipMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PeopleTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.personId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (relationshipDescendantsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          $PeopleTable,
                          RelationshipDescendant
                        >(
                          currentTable: table,
                          referencedTable: $$PeopleTableReferences
                              ._relationshipDescendantsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PeopleTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipDescendantsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.personId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PeopleTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeopleTable,
      PeopleData,
      $$PeopleTableFilterComposer,
      $$PeopleTableOrderingComposer,
      $$PeopleTableAnnotationComposer,
      $$PeopleTableCreateCompanionBuilder,
      $$PeopleTableUpdateCompanionBuilder,
      (PeopleData, $$PeopleTableReferences),
      PeopleData,
      PrefetchHooks Function({
        bool pedigreeId,
        bool descendancyRelationshipId,
        bool explicitBioMotherId,
        bool explicitBioFatherId,
        bool eggDonorId,
        bool spermDonorId,
        bool carriedById,
        bool pregnancyId,
        bool nletsId,
        bool diagnosesRefs,
        bool relationshipMembersRefs,
        bool relationshipDescendantsRefs,
      })
    >;
typedef $$DiagnosesTableCreateCompanionBuilder =
    DiagnosesCompanion Function({
      Value<int> id,
      Value<int?> personId,
      Value<String?> name,
      Value<String?> ontology,
      Value<String?> ontologyVersion,
      Value<String?> ontologyId,
      Value<int> orderIndex,
      Value<double?> ageAtDx,
      Value<String> ageAtDxUnits,
      Value<int> carrier,
      Value<int> causeOfDeath,
      Value<String?> modeOfInheritance,
    });
typedef $$DiagnosesTableUpdateCompanionBuilder =
    DiagnosesCompanion Function({
      Value<int> id,
      Value<int?> personId,
      Value<String?> name,
      Value<String?> ontology,
      Value<String?> ontologyVersion,
      Value<String?> ontologyId,
      Value<int> orderIndex,
      Value<double?> ageAtDx,
      Value<String> ageAtDxUnits,
      Value<int> carrier,
      Value<int> causeOfDeath,
      Value<String?> modeOfInheritance,
    });

final class $$DiagnosesTableReferences
    extends BaseReferences<_$AppDatabase, $DiagnosesTable, Diagnose> {
  $$DiagnosesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people.createAlias(
    $_aliasNameGenerator(db.diagnoses.personId, db.people.id),
  );

  $$PeopleTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<int>('person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MetaTable, List<MetaData>> _metaAffected1Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meta,
    aliasName: $_aliasNameGenerator(
      db.diagnoses.id,
      db.meta.affected1DiagnosisId,
    ),
  );

  $$MetaTableProcessedTableManager get metaAffected1 {
    final manager = $$MetaTableTableManager($_db, $_db.meta).filter(
      (f) => f.affected1DiagnosisId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_metaAffected1Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MetaTable, List<MetaData>> _metaAffected2Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meta,
    aliasName: $_aliasNameGenerator(
      db.diagnoses.id,
      db.meta.affected2DiagnosisId,
    ),
  );

  $$MetaTableProcessedTableManager get metaAffected2 {
    final manager = $$MetaTableTableManager($_db, $_db.meta).filter(
      (f) => f.affected2DiagnosisId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_metaAffected2Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MetaTable, List<MetaData>> _metaAffected3Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meta,
    aliasName: $_aliasNameGenerator(
      db.diagnoses.id,
      db.meta.affected3DiagnosisId,
    ),
  );

  $$MetaTableProcessedTableManager get metaAffected3 {
    final manager = $$MetaTableTableManager($_db, $_db.meta).filter(
      (f) => f.affected3DiagnosisId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_metaAffected3Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MetaTable, List<MetaData>> _metaAffected4Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meta,
    aliasName: $_aliasNameGenerator(
      db.diagnoses.id,
      db.meta.affected4DiagnosisId,
    ),
  );

  $$MetaTableProcessedTableManager get metaAffected4 {
    final manager = $$MetaTableTableManager($_db, $_db.meta).filter(
      (f) => f.affected4DiagnosisId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_metaAffected4Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DiagnosesTableFilterComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ontology => $composableBuilder(
    column: $table.ontology,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ontologyVersion => $composableBuilder(
    column: $table.ontologyVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ontologyId => $composableBuilder(
    column: $table.ontologyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ageAtDx => $composableBuilder(
    column: $table.ageAtDx,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageAtDxUnits => $composableBuilder(
    column: $table.ageAtDxUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carrier => $composableBuilder(
    column: $table.carrier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modeOfInheritance => $composableBuilder(
    column: $table.modeOfInheritance,
    builder: (column) => ColumnFilters(column),
  );

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> metaAffected1(
    Expression<bool> Function($$MetaTableFilterComposer f) f,
  ) {
    final $$MetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected1DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableFilterComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> metaAffected2(
    Expression<bool> Function($$MetaTableFilterComposer f) f,
  ) {
    final $$MetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected2DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableFilterComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> metaAffected3(
    Expression<bool> Function($$MetaTableFilterComposer f) f,
  ) {
    final $$MetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected3DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableFilterComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> metaAffected4(
    Expression<bool> Function($$MetaTableFilterComposer f) f,
  ) {
    final $$MetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected4DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableFilterComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DiagnosesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ontology => $composableBuilder(
    column: $table.ontology,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ontologyVersion => $composableBuilder(
    column: $table.ontologyVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ontologyId => $composableBuilder(
    column: $table.ontologyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ageAtDx => $composableBuilder(
    column: $table.ageAtDx,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageAtDxUnits => $composableBuilder(
    column: $table.ageAtDxUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carrier => $composableBuilder(
    column: $table.carrier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modeOfInheritance => $composableBuilder(
    column: $table.modeOfInheritance,
    builder: (column) => ColumnOrderings(column),
  );

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiagnosesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get ontology =>
      $composableBuilder(column: $table.ontology, builder: (column) => column);

  GeneratedColumn<String> get ontologyVersion => $composableBuilder(
    column: $table.ontologyVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ontologyId => $composableBuilder(
    column: $table.ontologyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ageAtDx =>
      $composableBuilder(column: $table.ageAtDx, builder: (column) => column);

  GeneratedColumn<String> get ageAtDxUnits => $composableBuilder(
    column: $table.ageAtDxUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get carrier =>
      $composableBuilder(column: $table.carrier, builder: (column) => column);

  GeneratedColumn<int> get causeOfDeath => $composableBuilder(
    column: $table.causeOfDeath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modeOfInheritance => $composableBuilder(
    column: $table.modeOfInheritance,
    builder: (column) => column,
  );

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> metaAffected1<T extends Object>(
    Expression<T> Function($$MetaTableAnnotationComposer a) f,
  ) {
    final $$MetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected1DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableAnnotationComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> metaAffected2<T extends Object>(
    Expression<T> Function($$MetaTableAnnotationComposer a) f,
  ) {
    final $$MetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected2DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableAnnotationComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> metaAffected3<T extends Object>(
    Expression<T> Function($$MetaTableAnnotationComposer a) f,
  ) {
    final $$MetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected3DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableAnnotationComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> metaAffected4<T extends Object>(
    Expression<T> Function($$MetaTableAnnotationComposer a) f,
  ) {
    final $$MetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meta,
      getReferencedColumn: (t) => t.affected4DiagnosisId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetaTableAnnotationComposer(
            $db: $db,
            $table: $db.meta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DiagnosesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiagnosesTable,
          Diagnose,
          $$DiagnosesTableFilterComposer,
          $$DiagnosesTableOrderingComposer,
          $$DiagnosesTableAnnotationComposer,
          $$DiagnosesTableCreateCompanionBuilder,
          $$DiagnosesTableUpdateCompanionBuilder,
          (Diagnose, $$DiagnosesTableReferences),
          Diagnose,
          PrefetchHooks Function({
            bool personId,
            bool metaAffected1,
            bool metaAffected2,
            bool metaAffected3,
            bool metaAffected4,
          })
        > {
  $$DiagnosesTableTableManager(_$AppDatabase db, $DiagnosesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiagnosesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiagnosesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiagnosesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> personId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> ontology = const Value.absent(),
                Value<String?> ontologyVersion = const Value.absent(),
                Value<String?> ontologyId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<double?> ageAtDx = const Value.absent(),
                Value<String> ageAtDxUnits = const Value.absent(),
                Value<int> carrier = const Value.absent(),
                Value<int> causeOfDeath = const Value.absent(),
                Value<String?> modeOfInheritance = const Value.absent(),
              }) => DiagnosesCompanion(
                id: id,
                personId: personId,
                name: name,
                ontology: ontology,
                ontologyVersion: ontologyVersion,
                ontologyId: ontologyId,
                orderIndex: orderIndex,
                ageAtDx: ageAtDx,
                ageAtDxUnits: ageAtDxUnits,
                carrier: carrier,
                causeOfDeath: causeOfDeath,
                modeOfInheritance: modeOfInheritance,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> personId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> ontology = const Value.absent(),
                Value<String?> ontologyVersion = const Value.absent(),
                Value<String?> ontologyId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<double?> ageAtDx = const Value.absent(),
                Value<String> ageAtDxUnits = const Value.absent(),
                Value<int> carrier = const Value.absent(),
                Value<int> causeOfDeath = const Value.absent(),
                Value<String?> modeOfInheritance = const Value.absent(),
              }) => DiagnosesCompanion.insert(
                id: id,
                personId: personId,
                name: name,
                ontology: ontology,
                ontologyVersion: ontologyVersion,
                ontologyId: ontologyId,
                orderIndex: orderIndex,
                ageAtDx: ageAtDx,
                ageAtDxUnits: ageAtDxUnits,
                carrier: carrier,
                causeOfDeath: causeOfDeath,
                modeOfInheritance: modeOfInheritance,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DiagnosesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                personId = false,
                metaAffected1 = false,
                metaAffected2 = false,
                metaAffected3 = false,
                metaAffected4 = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (metaAffected1) db.meta,
                    if (metaAffected2) db.meta,
                    if (metaAffected3) db.meta,
                    if (metaAffected4) db.meta,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (personId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.personId,
                                    referencedTable: $$DiagnosesTableReferences
                                        ._personIdTable(db),
                                    referencedColumn: $$DiagnosesTableReferences
                                        ._personIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (metaAffected1)
                        await $_getPrefetchedData<
                          Diagnose,
                          $DiagnosesTable,
                          MetaData
                        >(
                          currentTable: table,
                          referencedTable: $$DiagnosesTableReferences
                              ._metaAffected1Table(db),
                          managerFromTypedResult: (p0) =>
                              $$DiagnosesTableReferences(
                                db,
                                table,
                                p0,
                              ).metaAffected1,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.affected1DiagnosisId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (metaAffected2)
                        await $_getPrefetchedData<
                          Diagnose,
                          $DiagnosesTable,
                          MetaData
                        >(
                          currentTable: table,
                          referencedTable: $$DiagnosesTableReferences
                              ._metaAffected2Table(db),
                          managerFromTypedResult: (p0) =>
                              $$DiagnosesTableReferences(
                                db,
                                table,
                                p0,
                              ).metaAffected2,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.affected2DiagnosisId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (metaAffected3)
                        await $_getPrefetchedData<
                          Diagnose,
                          $DiagnosesTable,
                          MetaData
                        >(
                          currentTable: table,
                          referencedTable: $$DiagnosesTableReferences
                              ._metaAffected3Table(db),
                          managerFromTypedResult: (p0) =>
                              $$DiagnosesTableReferences(
                                db,
                                table,
                                p0,
                              ).metaAffected3,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.affected3DiagnosisId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (metaAffected4)
                        await $_getPrefetchedData<
                          Diagnose,
                          $DiagnosesTable,
                          MetaData
                        >(
                          currentTable: table,
                          referencedTable: $$DiagnosesTableReferences
                              ._metaAffected4Table(db),
                          managerFromTypedResult: (p0) =>
                              $$DiagnosesTableReferences(
                                db,
                                table,
                                p0,
                              ).metaAffected4,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.affected4DiagnosisId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DiagnosesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiagnosesTable,
      Diagnose,
      $$DiagnosesTableFilterComposer,
      $$DiagnosesTableOrderingComposer,
      $$DiagnosesTableAnnotationComposer,
      $$DiagnosesTableCreateCompanionBuilder,
      $$DiagnosesTableUpdateCompanionBuilder,
      (Diagnose, $$DiagnosesTableReferences),
      Diagnose,
      PrefetchHooks Function({
        bool personId,
        bool metaAffected1,
        bool metaAffected2,
        bool metaAffected3,
        bool metaAffected4,
      })
    >;
typedef $$MetaTableCreateCompanionBuilder =
    MetaCompanion Function({
      Value<int> id,
      required int pedigreeId,
      Value<String> name,
      Value<String?> notes,
      Value<String?> version,
      Value<int> moons,
      Value<int> nextId,
      Value<int?> affected1DiagnosisId,
      Value<int?> affected2DiagnosisId,
      Value<int?> affected3DiagnosisId,
      Value<int?> affected4DiagnosisId,
    });
typedef $$MetaTableUpdateCompanionBuilder =
    MetaCompanion Function({
      Value<int> id,
      Value<int> pedigreeId,
      Value<String> name,
      Value<String?> notes,
      Value<String?> version,
      Value<int> moons,
      Value<int> nextId,
      Value<int?> affected1DiagnosisId,
      Value<int?> affected2DiagnosisId,
      Value<int?> affected3DiagnosisId,
      Value<int?> affected4DiagnosisId,
    });

final class $$MetaTableReferences
    extends BaseReferences<_$AppDatabase, $MetaTable, MetaData> {
  $$MetaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PedigreesTable _pedigreeIdTable(_$AppDatabase db) => db.pedigrees
      .createAlias($_aliasNameGenerator(db.meta.pedigreeId, db.pedigrees.id));

  $$PedigreesTableProcessedTableManager get pedigreeId {
    final $_column = $_itemColumn<int>('pedigree_id')!;

    final manager = $$PedigreesTableTableManager(
      $_db,
      $_db.pedigrees,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pedigreeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DiagnosesTable _affected1DiagnosisIdTable(_$AppDatabase db) =>
      db.diagnoses.createAlias(
        $_aliasNameGenerator(db.meta.affected1DiagnosisId, db.diagnoses.id),
      );

  $$DiagnosesTableProcessedTableManager? get affected1DiagnosisId {
    final $_column = $_itemColumn<int>('affected1_diagnosis_id');
    if ($_column == null) return null;
    final manager = $$DiagnosesTableTableManager(
      $_db,
      $_db.diagnoses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _affected1DiagnosisIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DiagnosesTable _affected2DiagnosisIdTable(_$AppDatabase db) =>
      db.diagnoses.createAlias(
        $_aliasNameGenerator(db.meta.affected2DiagnosisId, db.diagnoses.id),
      );

  $$DiagnosesTableProcessedTableManager? get affected2DiagnosisId {
    final $_column = $_itemColumn<int>('affected2_diagnosis_id');
    if ($_column == null) return null;
    final manager = $$DiagnosesTableTableManager(
      $_db,
      $_db.diagnoses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _affected2DiagnosisIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DiagnosesTable _affected3DiagnosisIdTable(_$AppDatabase db) =>
      db.diagnoses.createAlias(
        $_aliasNameGenerator(db.meta.affected3DiagnosisId, db.diagnoses.id),
      );

  $$DiagnosesTableProcessedTableManager? get affected3DiagnosisId {
    final $_column = $_itemColumn<int>('affected3_diagnosis_id');
    if ($_column == null) return null;
    final manager = $$DiagnosesTableTableManager(
      $_db,
      $_db.diagnoses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _affected3DiagnosisIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DiagnosesTable _affected4DiagnosisIdTable(_$AppDatabase db) =>
      db.diagnoses.createAlias(
        $_aliasNameGenerator(db.meta.affected4DiagnosisId, db.diagnoses.id),
      );

  $$DiagnosesTableProcessedTableManager? get affected4DiagnosisId {
    final $_column = $_itemColumn<int>('affected4_diagnosis_id');
    if ($_column == null) return null;
    final manager = $$DiagnosesTableTableManager(
      $_db,
      $_db.diagnoses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _affected4DiagnosisIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MetaTableFilterComposer extends Composer<_$AppDatabase, $MetaTable> {
  $$MetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moons => $composableBuilder(
    column: $table.moons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextId => $composableBuilder(
    column: $table.nextId,
    builder: (column) => ColumnFilters(column),
  );

  $$PedigreesTableFilterComposer get pedigreeId {
    final $$PedigreesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableFilterComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableFilterComposer get affected1DiagnosisId {
    final $$DiagnosesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected1DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableFilterComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableFilterComposer get affected2DiagnosisId {
    final $$DiagnosesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected2DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableFilterComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableFilterComposer get affected3DiagnosisId {
    final $$DiagnosesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected3DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableFilterComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableFilterComposer get affected4DiagnosisId {
    final $$DiagnosesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected4DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableFilterComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MetaTableOrderingComposer extends Composer<_$AppDatabase, $MetaTable> {
  $$MetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moons => $composableBuilder(
    column: $table.moons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextId => $composableBuilder(
    column: $table.nextId,
    builder: (column) => ColumnOrderings(column),
  );

  $$PedigreesTableOrderingComposer get pedigreeId {
    final $$PedigreesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableOrderingComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableOrderingComposer get affected1DiagnosisId {
    final $$DiagnosesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected1DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableOrderingComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableOrderingComposer get affected2DiagnosisId {
    final $$DiagnosesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected2DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableOrderingComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableOrderingComposer get affected3DiagnosisId {
    final $$DiagnosesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected3DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableOrderingComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableOrderingComposer get affected4DiagnosisId {
    final $$DiagnosesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected4DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableOrderingComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MetaTable> {
  $$MetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get moons =>
      $composableBuilder(column: $table.moons, builder: (column) => column);

  GeneratedColumn<int> get nextId =>
      $composableBuilder(column: $table.nextId, builder: (column) => column);

  $$PedigreesTableAnnotationComposer get pedigreeId {
    final $$PedigreesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedigreeId,
      referencedTable: $db.pedigrees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedigreesTableAnnotationComposer(
            $db: $db,
            $table: $db.pedigrees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableAnnotationComposer get affected1DiagnosisId {
    final $$DiagnosesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected1DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableAnnotationComposer get affected2DiagnosisId {
    final $$DiagnosesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected2DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableAnnotationComposer get affected3DiagnosisId {
    final $$DiagnosesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected3DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DiagnosesTableAnnotationComposer get affected4DiagnosisId {
    final $$DiagnosesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.affected4DiagnosisId,
      referencedTable: $db.diagnoses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosesTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MetaTable,
          MetaData,
          $$MetaTableFilterComposer,
          $$MetaTableOrderingComposer,
          $$MetaTableAnnotationComposer,
          $$MetaTableCreateCompanionBuilder,
          $$MetaTableUpdateCompanionBuilder,
          (MetaData, $$MetaTableReferences),
          MetaData,
          PrefetchHooks Function({
            bool pedigreeId,
            bool affected1DiagnosisId,
            bool affected2DiagnosisId,
            bool affected3DiagnosisId,
            bool affected4DiagnosisId,
          })
        > {
  $$MetaTableTableManager(_$AppDatabase db, $MetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pedigreeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<int> moons = const Value.absent(),
                Value<int> nextId = const Value.absent(),
                Value<int?> affected1DiagnosisId = const Value.absent(),
                Value<int?> affected2DiagnosisId = const Value.absent(),
                Value<int?> affected3DiagnosisId = const Value.absent(),
                Value<int?> affected4DiagnosisId = const Value.absent(),
              }) => MetaCompanion(
                id: id,
                pedigreeId: pedigreeId,
                name: name,
                notes: notes,
                version: version,
                moons: moons,
                nextId: nextId,
                affected1DiagnosisId: affected1DiagnosisId,
                affected2DiagnosisId: affected2DiagnosisId,
                affected3DiagnosisId: affected3DiagnosisId,
                affected4DiagnosisId: affected4DiagnosisId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pedigreeId,
                Value<String> name = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<int> moons = const Value.absent(),
                Value<int> nextId = const Value.absent(),
                Value<int?> affected1DiagnosisId = const Value.absent(),
                Value<int?> affected2DiagnosisId = const Value.absent(),
                Value<int?> affected3DiagnosisId = const Value.absent(),
                Value<int?> affected4DiagnosisId = const Value.absent(),
              }) => MetaCompanion.insert(
                id: id,
                pedigreeId: pedigreeId,
                name: name,
                notes: notes,
                version: version,
                moons: moons,
                nextId: nextId,
                affected1DiagnosisId: affected1DiagnosisId,
                affected2DiagnosisId: affected2DiagnosisId,
                affected3DiagnosisId: affected3DiagnosisId,
                affected4DiagnosisId: affected4DiagnosisId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$MetaTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pedigreeId = false,
                affected1DiagnosisId = false,
                affected2DiagnosisId = false,
                affected3DiagnosisId = false,
                affected4DiagnosisId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pedigreeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pedigreeId,
                                    referencedTable: $$MetaTableReferences
                                        ._pedigreeIdTable(db),
                                    referencedColumn: $$MetaTableReferences
                                        ._pedigreeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (affected1DiagnosisId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.affected1DiagnosisId,
                                    referencedTable: $$MetaTableReferences
                                        ._affected1DiagnosisIdTable(db),
                                    referencedColumn: $$MetaTableReferences
                                        ._affected1DiagnosisIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (affected2DiagnosisId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.affected2DiagnosisId,
                                    referencedTable: $$MetaTableReferences
                                        ._affected2DiagnosisIdTable(db),
                                    referencedColumn: $$MetaTableReferences
                                        ._affected2DiagnosisIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (affected3DiagnosisId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.affected3DiagnosisId,
                                    referencedTable: $$MetaTableReferences
                                        ._affected3DiagnosisIdTable(db),
                                    referencedColumn: $$MetaTableReferences
                                        ._affected3DiagnosisIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (affected4DiagnosisId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.affected4DiagnosisId,
                                    referencedTable: $$MetaTableReferences
                                        ._affected4DiagnosisIdTable(db),
                                    referencedColumn: $$MetaTableReferences
                                        ._affected4DiagnosisIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$MetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MetaTable,
      MetaData,
      $$MetaTableFilterComposer,
      $$MetaTableOrderingComposer,
      $$MetaTableAnnotationComposer,
      $$MetaTableCreateCompanionBuilder,
      $$MetaTableUpdateCompanionBuilder,
      (MetaData, $$MetaTableReferences),
      MetaData,
      PrefetchHooks Function({
        bool pedigreeId,
        bool affected1DiagnosisId,
        bool affected2DiagnosisId,
        bool affected3DiagnosisId,
        bool affected4DiagnosisId,
      })
    >;
typedef $$RelationshipMembersTableCreateCompanionBuilder =
    RelationshipMembersCompanion Function({
      required int relationshipId,
      required int personId,
      required int roleIndex,
      Value<int> rowid,
    });
typedef $$RelationshipMembersTableUpdateCompanionBuilder =
    RelationshipMembersCompanion Function({
      Value<int> relationshipId,
      Value<int> personId,
      Value<int> roleIndex,
      Value<int> rowid,
    });

final class $$RelationshipMembersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationshipMembersTable,
          RelationshipMember
        > {
  $$RelationshipMembersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RelationshipsTable _relationshipIdTable(_$AppDatabase db) =>
      db.relationships.createAlias(
        $_aliasNameGenerator(
          db.relationshipMembers.relationshipId,
          db.relationships.id,
        ),
      );

  $$RelationshipsTableProcessedTableManager get relationshipId {
    final $_column = $_itemColumn<int>('relationship_id')!;

    final manager = $$RelationshipsTableTableManager(
      $_db,
      $_db.relationships,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relationshipIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people.createAlias(
    $_aliasNameGenerator(db.relationshipMembers.personId, db.people.id),
  );

  $$PeopleTableProcessedTableManager get personId {
    final $_column = $_itemColumn<int>('person_id')!;

    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationshipMembersTableFilterComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get roleIndex => $composableBuilder(
    column: $table.roleIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$RelationshipsTableFilterComposer get relationshipId {
    final $$RelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get roleIndex => $composableBuilder(
    column: $table.roleIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$RelationshipsTableOrderingComposer get relationshipId {
    final $$RelationshipsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableOrderingComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get roleIndex =>
      $composableBuilder(column: $table.roleIndex, builder: (column) => column);

  $$RelationshipsTableAnnotationComposer get relationshipId {
    final $$RelationshipsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableAnnotationComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationshipMembersTable,
          RelationshipMember,
          $$RelationshipMembersTableFilterComposer,
          $$RelationshipMembersTableOrderingComposer,
          $$RelationshipMembersTableAnnotationComposer,
          $$RelationshipMembersTableCreateCompanionBuilder,
          $$RelationshipMembersTableUpdateCompanionBuilder,
          (RelationshipMember, $$RelationshipMembersTableReferences),
          RelationshipMember,
          PrefetchHooks Function({bool relationshipId, bool personId})
        > {
  $$RelationshipMembersTableTableManager(
    _$AppDatabase db,
    $RelationshipMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationshipMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationshipMembersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationshipMembersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> relationshipId = const Value.absent(),
                Value<int> personId = const Value.absent(),
                Value<int> roleIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationshipMembersCompanion(
                relationshipId: relationshipId,
                personId: personId,
                roleIndex: roleIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int relationshipId,
                required int personId,
                required int roleIndex,
                Value<int> rowid = const Value.absent(),
              }) => RelationshipMembersCompanion.insert(
                relationshipId: relationshipId,
                personId: personId,
                roleIndex: roleIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationshipMembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({relationshipId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (relationshipId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.relationshipId,
                                referencedTable:
                                    $$RelationshipMembersTableReferences
                                        ._relationshipIdTable(db),
                                referencedColumn:
                                    $$RelationshipMembersTableReferences
                                        ._relationshipIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (personId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.personId,
                                referencedTable:
                                    $$RelationshipMembersTableReferences
                                        ._personIdTable(db),
                                referencedColumn:
                                    $$RelationshipMembersTableReferences
                                        ._personIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RelationshipMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationshipMembersTable,
      RelationshipMember,
      $$RelationshipMembersTableFilterComposer,
      $$RelationshipMembersTableOrderingComposer,
      $$RelationshipMembersTableAnnotationComposer,
      $$RelationshipMembersTableCreateCompanionBuilder,
      $$RelationshipMembersTableUpdateCompanionBuilder,
      (RelationshipMember, $$RelationshipMembersTableReferences),
      RelationshipMember,
      PrefetchHooks Function({bool relationshipId, bool personId})
    >;
typedef $$RelationshipDescendantsTableCreateCompanionBuilder =
    RelationshipDescendantsCompanion Function({
      required int relationshipId,
      required int personId,
      Value<int> rowid,
    });
typedef $$RelationshipDescendantsTableUpdateCompanionBuilder =
    RelationshipDescendantsCompanion Function({
      Value<int> relationshipId,
      Value<int> personId,
      Value<int> rowid,
    });

final class $$RelationshipDescendantsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationshipDescendantsTable,
          RelationshipDescendant
        > {
  $$RelationshipDescendantsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RelationshipsTable _relationshipIdTable(_$AppDatabase db) =>
      db.relationships.createAlias(
        $_aliasNameGenerator(
          db.relationshipDescendants.relationshipId,
          db.relationships.id,
        ),
      );

  $$RelationshipsTableProcessedTableManager get relationshipId {
    final $_column = $_itemColumn<int>('relationship_id')!;

    final manager = $$RelationshipsTableTableManager(
      $_db,
      $_db.relationships,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relationshipIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people.createAlias(
    $_aliasNameGenerator(db.relationshipDescendants.personId, db.people.id),
  );

  $$PeopleTableProcessedTableManager get personId {
    final $_column = $_itemColumn<int>('person_id')!;

    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationshipDescendantsTableFilterComposer
    extends Composer<_$AppDatabase, $RelationshipDescendantsTable> {
  $$RelationshipDescendantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RelationshipsTableFilterComposer get relationshipId {
    final $$RelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipDescendantsTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationshipDescendantsTable> {
  $$RelationshipDescendantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RelationshipsTableOrderingComposer get relationshipId {
    final $$RelationshipsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableOrderingComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipDescendantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationshipDescendantsTable> {
  $$RelationshipDescendantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RelationshipsTableAnnotationComposer get relationshipId {
    final $$RelationshipsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relationshipId,
      referencedTable: $db.relationships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipsTableAnnotationComposer(
            $db: $db,
            $table: $db.relationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipDescendantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationshipDescendantsTable,
          RelationshipDescendant,
          $$RelationshipDescendantsTableFilterComposer,
          $$RelationshipDescendantsTableOrderingComposer,
          $$RelationshipDescendantsTableAnnotationComposer,
          $$RelationshipDescendantsTableCreateCompanionBuilder,
          $$RelationshipDescendantsTableUpdateCompanionBuilder,
          (RelationshipDescendant, $$RelationshipDescendantsTableReferences),
          RelationshipDescendant,
          PrefetchHooks Function({bool relationshipId, bool personId})
        > {
  $$RelationshipDescendantsTableTableManager(
    _$AppDatabase db,
    $RelationshipDescendantsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationshipDescendantsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RelationshipDescendantsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationshipDescendantsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> relationshipId = const Value.absent(),
                Value<int> personId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationshipDescendantsCompanion(
                relationshipId: relationshipId,
                personId: personId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int relationshipId,
                required int personId,
                Value<int> rowid = const Value.absent(),
              }) => RelationshipDescendantsCompanion.insert(
                relationshipId: relationshipId,
                personId: personId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationshipDescendantsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({relationshipId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (relationshipId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.relationshipId,
                                referencedTable:
                                    $$RelationshipDescendantsTableReferences
                                        ._relationshipIdTable(db),
                                referencedColumn:
                                    $$RelationshipDescendantsTableReferences
                                        ._relationshipIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (personId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.personId,
                                referencedTable:
                                    $$RelationshipDescendantsTableReferences
                                        ._personIdTable(db),
                                referencedColumn:
                                    $$RelationshipDescendantsTableReferences
                                        ._personIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RelationshipDescendantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationshipDescendantsTable,
      RelationshipDescendant,
      $$RelationshipDescendantsTableFilterComposer,
      $$RelationshipDescendantsTableOrderingComposer,
      $$RelationshipDescendantsTableAnnotationComposer,
      $$RelationshipDescendantsTableCreateCompanionBuilder,
      $$RelationshipDescendantsTableUpdateCompanionBuilder,
      (RelationshipDescendant, $$RelationshipDescendantsTableReferences),
      RelationshipDescendant,
      PrefetchHooks Function({bool relationshipId, bool personId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PedigreesTableTableManager get pedigrees =>
      $$PedigreesTableTableManager(_db, _db.pedigrees);
  $$RelationshipsTableTableManager get relationships =>
      $$RelationshipsTableTableManager(_db, _db.relationships);
  $$PregnanciesTableTableManager get pregnancies =>
      $$PregnanciesTableTableManager(_db, _db.pregnancies);
  $$NletsTableTableManager get nlets =>
      $$NletsTableTableManager(_db, _db.nlets);
  $$PeopleTableTableManager get people =>
      $$PeopleTableTableManager(_db, _db.people);
  $$DiagnosesTableTableManager get diagnoses =>
      $$DiagnosesTableTableManager(_db, _db.diagnoses);
  $$MetaTableTableManager get meta => $$MetaTableTableManager(_db, _db.meta);
  $$RelationshipMembersTableTableManager get relationshipMembers =>
      $$RelationshipMembersTableTableManager(_db, _db.relationshipMembers);
  $$RelationshipDescendantsTableTableManager get relationshipDescendants =>
      $$RelationshipDescendantsTableTableManager(
        _db,
        _db.relationshipDescendants,
      );
}
