// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String initDate;
  final String endDate;
  final String task;
  final bool isComplete;
  Task(
      {@required this.id,
      @required this.initDate,
      this.endDate,
      @required this.task,
      @required this.isComplete});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      initDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}init_date']),
      endDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      task: stringType.mapFromDatabaseResponse(data['${effectivePrefix}task']),
      isComplete: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_complete']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || initDate != null) {
      map['init_date'] = Variable<String>(initDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    if (!nullToAbsent || task != null) {
      map['task'] = Variable<String>(task);
    }
    if (!nullToAbsent || isComplete != null) {
      map['is_complete'] = Variable<bool>(isComplete);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      initDate: initDate == null && nullToAbsent
          ? const Value.absent()
          : Value(initDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      task: task == null && nullToAbsent ? const Value.absent() : Value(task),
      isComplete: isComplete == null && nullToAbsent
          ? const Value.absent()
          : Value(isComplete),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      initDate: serializer.fromJson<String>(json['initDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
      task: serializer.fromJson<String>(json['task']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'initDate': serializer.toJson<String>(initDate),
      'endDate': serializer.toJson<String>(endDate),
      'task': serializer.toJson<String>(task),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  ///Create a instance of this object with the same values and just updaated the
  ///parameters fill in
  Task copyWith(
          {String id,
          String initDate,
          String endDate,
          String task,
          bool isComplete}) =>
      Task(
        id: id ?? this.id,
        initDate: initDate ?? this.initDate,
        endDate: endDate ?? this.endDate,
        task: task ?? this.task,
        isComplete: isComplete ?? this.isComplete,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('initDate: $initDate, ')
          ..write('endDate: $endDate, ')
          ..write('task: $task, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(initDate.hashCode,
          $mrjc(endDate.hashCode, $mrjc(task.hashCode, isComplete.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.initDate == this.initDate &&
          other.endDate == this.endDate &&
          other.task == this.task &&
          other.isComplete == this.isComplete);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> initDate;
  final Value<String> endDate;
  final Value<String> task;
  final Value<bool> isComplete;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.initDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.task = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  TasksCompanion.insert({
    @required String id,
    this.initDate = const Value.absent(),
    this.endDate = const Value.absent(),
    @required String task,
    this.isComplete = const Value.absent(),
  })  : id = Value(id),
        task = Value(task);
  static Insertable<Task> custom({
    Expression<String> id,
    Expression<String> initDate,
    Expression<String> endDate,
    Expression<String> task,
    Expression<bool> isComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (initDate != null) 'init_date': initDate,
      if (endDate != null) 'end_date': endDate,
      if (task != null) 'task': task,
      if (isComplete != null) 'is_complete': isComplete,
    });
  }

  TasksCompanion copyWith(
      {Value<String> id,
      Value<String> initDate,
      Value<String> endDate,
      Value<String> task,
      Value<bool> isComplete}) {
    return TasksCompanion(
      id: id ?? this.id,
      initDate: initDate ?? this.initDate,
      endDate: endDate ?? this.endDate,
      task: task ?? this.task,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (initDate.present) {
      map['init_date'] = Variable<String>(initDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    return map;
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _initDateMeta = const VerificationMeta('initDate');
  GeneratedTextColumn _initDate;
  @override
  GeneratedTextColumn get initDate => _initDate ??= _constructInitDate();
  GeneratedTextColumn _constructInitDate() {
    return GeneratedTextColumn('init_date', $tableName, false,
        defaultValue: Constant(getDate()));
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedTextColumn _endDate;
  @override
  GeneratedTextColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedTextColumn _constructEndDate() {
    return GeneratedTextColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _taskMeta = const VerificationMeta('task');
  GeneratedTextColumn _task;
  @override
  GeneratedTextColumn get task => _task ??= _constructTask();
  GeneratedTextColumn _constructTask() {
    return GeneratedTextColumn(
      'task',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isCompleteMeta = const VerificationMeta('isComplete');
  GeneratedBoolColumn _isComplete;
  @override
  GeneratedBoolColumn get isComplete => _isComplete ??= _constructIsComplete();
  GeneratedBoolColumn _constructIsComplete() {
    return GeneratedBoolColumn('is_complete', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, initDate, endDate, task, isComplete];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('init_date')) {
      context.handle(_initDateMeta,
          initDate.isAcceptableOrUnknown(data['init_date'], _initDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task'], _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete'], _isCompleteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, isComplete};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String initDate;
  final String note;
  final bool isHide;
  Note(
      {@required this.id,
      @required this.initDate,
      @required this.note,
      @required this.isHide});
  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Note(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      initDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}init_date']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      isHide:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_hide']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || initDate != null) {
      map['init_date'] = Variable<String>(initDate);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || isHide != null) {
      map['is_hide'] = Variable<bool>(isHide);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      initDate: initDate == null && nullToAbsent
          ? const Value.absent()
          : Value(initDate),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      isHide:
          isHide == null && nullToAbsent ? const Value.absent() : Value(isHide),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      initDate: serializer.fromJson<String>(json['initDate']),
      note: serializer.fromJson<String>(json['note']),
      isHide: serializer.fromJson<bool>(json['isHide']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'initDate': serializer.toJson<String>(initDate),
      'note': serializer.toJson<String>(note),
      'isHide': serializer.toJson<bool>(isHide),
    };
  }

  Note copyWith({String id, String initDate, String note, bool isHide}) => Note(
        id: id ?? this.id,
        initDate: initDate ?? this.initDate,
        note: note ?? this.note,
        isHide: isHide ?? this.isHide,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('initDate: $initDate, ')
          ..write('note: $note, ')
          ..write('isHide: $isHide')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(initDate.hashCode, $mrjc(note.hashCode, isHide.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.initDate == this.initDate &&
          other.note == this.note &&
          other.isHide == this.isHide);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> initDate;
  final Value<String> note;
  final Value<bool> isHide;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.initDate = const Value.absent(),
    this.note = const Value.absent(),
    this.isHide = const Value.absent(),
  });
  NotesCompanion.insert({
    @required String id,
    this.initDate = const Value.absent(),
    @required String note,
    this.isHide = const Value.absent(),
  })  : id = Value(id),
        note = Value(note);
  static Insertable<Note> custom({
    Expression<String> id,
    Expression<String> initDate,
    Expression<String> note,
    Expression<bool> isHide,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (initDate != null) 'init_date': initDate,
      if (note != null) 'note': note,
      if (isHide != null) 'is_hide': isHide,
    });
  }

  NotesCompanion copyWith(
      {Value<String> id,
      Value<String> initDate,
      Value<String> note,
      Value<bool> isHide}) {
    return NotesCompanion(
      id: id ?? this.id,
      initDate: initDate ?? this.initDate,
      note: note ?? this.note,
      isHide: isHide ?? this.isHide,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (initDate.present) {
      map['init_date'] = Variable<String>(initDate.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isHide.present) {
      map['is_hide'] = Variable<bool>(isHide.value);
    }
    return map;
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  
  final GeneratedDatabase _db;
  final String _alias;
  $NotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _initDateMeta = const VerificationMeta('initDate');
  GeneratedTextColumn _initDate;
  @override
  GeneratedTextColumn get initDate => _initDate ??= _constructInitDate();
  GeneratedTextColumn _constructInitDate() {
    return GeneratedTextColumn('init_date', $tableName, false,
        defaultValue: Constant(getDate()));
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isHideMeta = const VerificationMeta('isHide');
  GeneratedBoolColumn _isHide;
  @override
  GeneratedBoolColumn get isHide => _isHide ??= _constructIsHide();
  GeneratedBoolColumn _constructIsHide() {
    return GeneratedBoolColumn('is_hide', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, initDate, note, isHide];
  @override
  $NotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notes';
  @override
  final String actualTableName = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('init_date')) {
      context.handle(_initDateMeta,
          initDate.isAcceptableOrUnknown(data['init_date'], _initDateMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('is_hide')) {
      context.handle(_isHideMeta,
          isHide.isAcceptableOrUnknown(data['is_hide'], _isHideMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, isHide};
  @override
  Note map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Note.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(_db, alias);
  }
}


///This name was created by the command. If you want to avoid this error. You can use an annotation with database name
class UserDataData extends DataClass implements Insertable<UserDataData> {
  final String id;
  final bool isDarkMode;
  final bool isGoogleSignIn;
  UserDataData(
      {@required this.id,
      @required this.isDarkMode,
      @required this.isGoogleSignIn});
  factory UserDataData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return UserDataData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isDarkMode: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_dark_mode']),
      isGoogleSignIn: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_google_sign_in']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || isDarkMode != null) {
      map['is_dark_mode'] = Variable<bool>(isDarkMode);
    }
    if (!nullToAbsent || isGoogleSignIn != null) {
      map['is_google_sign_in'] = Variable<bool>(isGoogleSignIn);
    }
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      isDarkMode: isDarkMode == null && nullToAbsent
          ? const Value.absent()
          : Value(isDarkMode),
      isGoogleSignIn: isGoogleSignIn == null && nullToAbsent
          ? const Value.absent()
          : Value(isGoogleSignIn),
    );
  }

  factory UserDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserDataData(
      id: serializer.fromJson<String>(json['id']),
      isDarkMode: serializer.fromJson<bool>(json['isDarkMode']),
      isGoogleSignIn: serializer.fromJson<bool>(json['isGoogleSignIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'isDarkMode': serializer.toJson<bool>(isDarkMode),
      'isGoogleSignIn': serializer.toJson<bool>(isGoogleSignIn),
    };
  }

  UserDataData copyWith({String id, bool isDarkMode, bool isGoogleSignIn}) =>
      UserDataData(
        id: id ?? this.id,
        isDarkMode: isDarkMode ?? this.isDarkMode,
        isGoogleSignIn: isGoogleSignIn ?? this.isGoogleSignIn,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataData(')
          ..write('id: $id, ')
          ..write('isDarkMode: $isDarkMode, ')
          ..write('isGoogleSignIn: $isGoogleSignIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(isDarkMode.hashCode, isGoogleSignIn.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserDataData &&
          other.id == this.id &&
          other.isDarkMode == this.isDarkMode &&
          other.isGoogleSignIn == this.isGoogleSignIn);
}

class UserDataCompanion extends UpdateCompanion<UserDataData> {
  final Value<String> id;
  final Value<bool> isDarkMode;
  final Value<bool> isGoogleSignIn;
  const UserDataCompanion({
    this.id = const Value.absent(),
    this.isDarkMode = const Value.absent(),
    this.isGoogleSignIn = const Value.absent(),
  });
  UserDataCompanion.insert({
    this.id = const Value.absent(),
    this.isDarkMode = const Value.absent(),
    this.isGoogleSignIn = const Value.absent(),
  });
  static Insertable<UserDataData> custom({
    Expression<String> id,
    Expression<bool> isDarkMode,
    Expression<bool> isGoogleSignIn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDarkMode != null) 'is_dark_mode': isDarkMode,
      if (isGoogleSignIn != null) 'is_google_sign_in': isGoogleSignIn,
    });
  }

  UserDataCompanion copyWith(
      {Value<String> id, Value<bool> isDarkMode, Value<bool> isGoogleSignIn}) {
    return UserDataCompanion(
      id: id ?? this.id,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isGoogleSignIn: isGoogleSignIn ?? this.isGoogleSignIn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (isDarkMode.present) {
      map['is_dark_mode'] = Variable<bool>(isDarkMode.value);
    }
    if (isGoogleSignIn.present) {
      map['is_google_sign_in'] = Variable<bool>(isGoogleSignIn.value);
    }
    return map;
  }
}

class $UserDataTable extends UserData
    with TableInfo<$UserDataTable, UserDataData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserDataTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        defaultValue: Constant('user_${getDate()}'));
  }

  final VerificationMeta _isDarkModeMeta = const VerificationMeta('isDarkMode');
  GeneratedBoolColumn _isDarkMode;
  @override
  GeneratedBoolColumn get isDarkMode => _isDarkMode ??= _constructIsDarkMode();
  GeneratedBoolColumn _constructIsDarkMode() {
    return GeneratedBoolColumn('is_dark_mode', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isGoogleSignInMeta =
      const VerificationMeta('isGoogleSignIn');
  GeneratedBoolColumn _isGoogleSignIn;
  @override
  GeneratedBoolColumn get isGoogleSignIn =>
      _isGoogleSignIn ??= _constructIsGoogleSignIn();
  GeneratedBoolColumn _constructIsGoogleSignIn() {
    return GeneratedBoolColumn('is_google_sign_in', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, isDarkMode, isGoogleSignIn];
  @override
  $UserDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_data';
  @override
  final String actualTableName = 'user_data';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('is_dark_mode')) {
      context.handle(
          _isDarkModeMeta,
          isDarkMode.isAcceptableOrUnknown(
              data['is_dark_mode'], _isDarkModeMeta));
    }
    if (data.containsKey('is_google_sign_in')) {
      context.handle(
          _isGoogleSignInMeta,
          isGoogleSignIn.isAcceptableOrUnknown(
              data['is_google_sign_in'], _isGoogleSignInMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, isDarkMode};
  @override
  UserDataData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserDataData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $NotesTable _notes;
  $NotesTable get notes => _notes ??= $NotesTable(this);
  $UserDataTable _userData;
  $UserDataTable get userData => _userData ??= $UserDataTable(this);
  ///This means the acces to whole entire Database
  UserDAO _userDAO;
  UserDAO get userDAO => _userDAO ??= UserDAO(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks, notes, userData];
}
