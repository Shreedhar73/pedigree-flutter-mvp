import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/person.dart';
import '../../domain/entities/person_details_update.dart';
import '../bloc/pedigree_bloc.dart';

/// Proband-style "Main Details" editor (sidebar + Details tab; other tabs placeholder).
Future<void> showPersonMainDetailsDialog({
  required BuildContext context,
  required Person person,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) => PersonMainDetailsDialog(person: person),
  );
}

class PersonMainDetailsDialog extends StatefulWidget {
  const PersonMainDetailsDialog({super.key, required this.person});

  final Person person;

  @override
  State<PersonMainDetailsDialog> createState() =>
      _PersonMainDetailsDialogState();
}

class _PersonMainDetailsDialogState extends State<PersonMainDetailsDialog> {
  late final TextEditingController _nodeCtrl;
  late final TextEditingController _ageCtrl;
  late final TextEditingController _heightCtrl;
  late final TextEditingController _gestAgeCtrl;
  late final TextEditingController _causeDeathCtrl;
  late final TextEditingController _ageDeathCtrl;

  late String _sex;
  late bool _proband;
  late bool _donor;
  late bool _surrogate;

  /// Birth row: Live / P / TOP / SAB / SB
  late _BirthKey _birth;

  /// Status: A / A+W / D
  late _StatusKey _status;

  /// Adopted: none / in / out
  late _AdoptedKey _adopted;

  late String _ageUnits;
  late String _deathAgeUnits;

  int _railIndex = 0;

  @override
  void initState() {
    super.initState();
    final p = widget.person;
    _nodeCtrl = TextEditingController(text: p.nodeId == 0 ? '' : '${p.nodeId}');
    _ageCtrl = TextEditingController(text: p.age ?? '');
    _heightCtrl = TextEditingController(text: p.height ?? '');
    _gestAgeCtrl = TextEditingController(text: p.gestAge ?? '');
    _causeDeathCtrl = TextEditingController(text: p.causeOfDeath ?? '');
    _ageDeathCtrl = TextEditingController(text: p.ageAtDeath ?? '');

    _sex = (p.sex ?? 'U').toUpperCase();
    if (!{'M', 'F', 'U'}.contains(_sex)) _sex = 'U';

    _proband = p.proband;
    _donor = p.donor;
    _surrogate = p.surrogate;

    _birth = _birthFromFlags(p);
    _status = _statusFromFlags(p);
    _adopted = _adoptedFromFlags(p);

    _ageUnits = p.ageUnits ?? 'Y';
    _deathAgeUnits = p.ageAtDeathUnits ?? 'Y';
  }

  _BirthKey _birthFromFlags(Person p) {
    if (p.stillBirth) return _BirthKey.sb;
    if (p.sab) return _BirthKey.sab;
    if (p.top) return _BirthKey.top;
    if (p.p) return _BirthKey.p;
    return _BirthKey.live;
  }

  _StatusKey _statusFromFlags(Person p) {
    if (p.deceased) return _StatusKey.d;
    if (p.aw) return _StatusKey.aw;
    return _StatusKey.a;
  }

  _AdoptedKey _adoptedFromFlags(Person p) {
    if (p.adoptedIn) return _AdoptedKey.in_;
    if (p.adoptedOut) return _AdoptedKey.out;
    return _AdoptedKey.no;
  }

  @override
  void dispose() {
    _nodeCtrl.dispose();
    _ageCtrl.dispose();
    _heightCtrl.dispose();
    _gestAgeCtrl.dispose();
    _causeDeathCtrl.dispose();
    _ageDeathCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final node = int.tryParse(_nodeCtrl.text.trim()) ?? widget.person.nodeId;

    final birthFlags = _birthFlags(_birth);
    final statusFlags = _statusFlags(_status);
    final adoptedFlags = _adoptedFlags(_adopted);

    final update = PersonDetailsUpdate(
      personId: widget.person.id,
      sex: _sex,
      nodeId: node,
      age: _ageCtrl.text.trim().isEmpty ? null : _ageCtrl.text.trim(),
      ageUnits: _ageUnits,
      height: _heightCtrl.text.trim().isEmpty ? null : _heightCtrl.text.trim(),
      gestAge: _gestAgeCtrl.text.trim().isEmpty ? null : _gestAgeCtrl.text.trim(),
      note: widget.person.note,
      proband: _proband,
      deceased: statusFlags.deceased,
      aw: statusFlags.aw,
      stillBirth: birthFlags.stillBirth,
      sab: birthFlags.sab,
      top: birthFlags.top,
      p: birthFlags.p,
      donor: _donor,
      surrogate: _surrogate,
      adoptedIn: adoptedFlags.adoptedIn,
      adoptedOut: adoptedFlags.adoptedOut,
      causeOfDeath:
          _causeDeathCtrl.text.trim().isEmpty ? null : _causeDeathCtrl.text.trim(),
      ageAtDeath:
          _ageDeathCtrl.text.trim().isEmpty ? null : _ageDeathCtrl.text.trim(),
      ageAtDeathUnits: _deathAgeUnits,
    );

    context.read<PedigreeBloc>().add(PersonDetailsSaved(update));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deceased = _status == _StatusKey.d;

    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 920, maxHeight: 640),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationRail(
              backgroundColor: Colors.black87,
              selectedIndex: _railIndex,
              onDestinationSelected: (i) => setState(() => _railIndex = i),
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
              selectedLabelTextStyle: const TextStyle(color: Colors.white),
              unselectedLabelTextStyle: TextStyle(color: Colors.grey.shade500),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Details'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.opacity_outlined),
                  selectedIcon: Icon(Icons.opacity),
                  label: Text('Affected'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.medical_services_outlined),
                  selectedIcon: Icon(Icons.medical_services),
                  label: Text('Diagnoses'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.child_care_outlined),
                  selectedIcon: Icon(Icons.child_care),
                  label: Text('Fertility'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.note_outlined),
                  selectedIcon: Icon(Icons.note),
                  label: Text('Note'),
                ),
              ],
            ),
            Expanded(
              child: Material(
                color: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _railIndex == 0
                      ? _buildDetailsTab(theme, deceased)
                      : Center(
                          child: Text(
                            'Coming soon',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsTab(ThemeData theme, bool deceased) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Main Details',
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: 56,
              child: TextField(
                controller: _nodeCtrl,
                decoration: const InputDecoration(
                  labelText: 'N',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            _labeled(
              'Sex',
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'M', label: Text('M')),
                  ButtonSegment(value: 'F', label: Text('F')),
                  ButtonSegment(value: 'U', label: Text('U')),
                ],
                selected: {_sex},
                onSelectionChanged: (s) => setState(() => _sex = s.first),
              ),
            ),
            _labeled(
              'Birth',
              SegmentedButton<_BirthKey>(
                segments: const [
                  ButtonSegment(value: _BirthKey.live, label: Text('Live')),
                  ButtonSegment(value: _BirthKey.p, label: Text('P')),
                  ButtonSegment(value: _BirthKey.top, label: Text('TOP')),
                  ButtonSegment(value: _BirthKey.sab, label: Text('SAB')),
                  ButtonSegment(value: _BirthKey.sb, label: Text('SB')),
                ],
                selected: {_birth},
                onSelectionChanged: (s) => setState(() => _birth = s.first),
              ),
            ),
            SizedBox(
              width: 120,
              child: TextField(
                controller: _gestAgeCtrl,
                decoration: const InputDecoration(
                  labelText: 'G. age',
                  hintText: 'weeks',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Proband'),
                Switch(value: _proband, onChanged: (v) => setState(() => _proband = v)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _labeled(
              'Status',
              SegmentedButton<_StatusKey>(
                segments: const [
                  ButtonSegment(value: _StatusKey.a, label: Text('A')),
                  ButtonSegment(value: _StatusKey.aw, label: Text('A+W')),
                  ButtonSegment(value: _StatusKey.d, label: Text('D')),
                ],
                selected: {_status},
                onSelectionChanged: (s) => setState(() => _status = s.first),
              ),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                controller: _heightCtrl,
                decoration: const InputDecoration(
                  labelText: 'Height',
                  hintText: '5\'6"',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(
              width: 72,
              child: TextField(
                controller: _ageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            DropdownButton<String>(
              value: _ageUnits,
              items: const [
                DropdownMenuItem(value: 'Y', child: Text('Yrs')),
                DropdownMenuItem(value: 'M', child: Text('Mo')),
                DropdownMenuItem(value: 'W', child: Text('Wk')),
              ],
              onChanged: (v) => setState(() => _ageUnits = v ?? 'Y'),
            ),
            _labeled(
              'Adopted',
              SegmentedButton<_AdoptedKey>(
                segments: const [
                  ButtonSegment(value: _AdoptedKey.no, label: Text('No')),
                  ButtonSegment(value: _AdoptedKey.in_, label: Text('In')),
                  ButtonSegment(value: _AdoptedKey.out, label: Text('Out')),
                ],
                selected: {_adopted},
                onSelectionChanged: (s) => setState(() => _adopted = s.first),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _causeDeathCtrl,
                decoration: InputDecoration(
                  labelText: 'Cause of death',
                  border: const OutlineInputBorder(),
                  enabled: deceased,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 72,
              child: TextField(
                controller: _ageDeathCtrl,
                decoration: InputDecoration(
                  labelText: 'D. age',
                  border: const OutlineInputBorder(),
                  enabled: deceased,
                ),
              ),
            ),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: _deathAgeUnits,
              onChanged: deceased
                  ? (v) => setState(() => _deathAgeUnits = v ?? 'Y')
                  : null,
              items: const [
                DropdownMenuItem(value: 'Y', child: Text('Yrs')),
                DropdownMenuItem(value: 'M', child: Text('Mo')),
                DropdownMenuItem(value: 'W', child: Text('Wk')),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Surrogate'),
                Switch(
                  value: _surrogate,
                  onChanged: (v) => setState(() => _surrogate = v),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Donor'),
                Switch(value: _donor, onChanged: (v) => setState(() => _donor = v)),
              ],
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            FilledButton(onPressed: _save, child: const Text('Save')),
          ],
        ),
      ],
    );
  }

  Widget _labeled(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        child,
      ],
    );
  }
}

enum _BirthKey { live, p, top, sab, sb }

enum _StatusKey { a, aw, d }

enum _AdoptedKey { no, in_, out }

({bool stillBirth, bool sab, bool top, bool p}) _birthFlags(_BirthKey k) {
  return switch (k) {
    _BirthKey.live => (
        stillBirth: false,
        sab: false,
        top: false,
        p: false,
      ),
    _BirthKey.p => (
        stillBirth: false,
        sab: false,
        top: false,
        p: true,
      ),
    _BirthKey.top => (
        stillBirth: false,
        sab: false,
        top: true,
        p: false,
      ),
    _BirthKey.sab => (
        stillBirth: false,
        sab: true,
        top: false,
        p: false,
      ),
    _BirthKey.sb => (
        stillBirth: true,
        sab: false,
        top: false,
        p: false,
      ),
  };
}

({bool deceased, bool aw}) _statusFlags(_StatusKey k) {
  return switch (k) {
    _StatusKey.a => (deceased: false, aw: false),
    _StatusKey.aw => (deceased: false, aw: true),
    _StatusKey.d => (deceased: true, aw: false),
  };
}

({bool adoptedIn, bool adoptedOut}) _adoptedFlags(_AdoptedKey k) {
  return switch (k) {
    _AdoptedKey.no => (adoptedIn: false, adoptedOut: false),
    _AdoptedKey.in_ => (adoptedIn: true, adoptedOut: false),
    _AdoptedKey.out => (adoptedIn: false, adoptedOut: true),
  };
}
