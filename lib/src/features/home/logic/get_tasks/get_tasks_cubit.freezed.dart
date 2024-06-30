// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tasks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetTasksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getTasksLoading,
    required TResult Function(List<TaskModel> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getTasksLoading,
    TResult? Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getTasksLoading,
    TResult Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetTasksLoading value) getTasksLoading,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksError value) getTasksError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetTasksLoading value)? getTasksLoading,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksError value)? getTasksError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetTasksLoading value)? getTasksLoading,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksError value)? getTasksError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTasksStateCopyWith<$Res> {
  factory $GetTasksStateCopyWith(
          GetTasksState value, $Res Function(GetTasksState) then) =
      _$GetTasksStateCopyWithImpl<$Res, GetTasksState>;
}

/// @nodoc
class _$GetTasksStateCopyWithImpl<$Res, $Val extends GetTasksState>
    implements $GetTasksStateCopyWith<$Res> {
  _$GetTasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetTasksStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetTasksState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getTasksLoading,
    required TResult Function(List<TaskModel> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getTasksLoading,
    TResult? Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getTasksLoading,
    TResult Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetTasksLoading value) getTasksLoading,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksError value) getTasksError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetTasksLoading value)? getTasksLoading,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksError value)? getTasksError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetTasksLoading value)? getTasksLoading,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksError value)? getTasksError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetTasksState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetTasksLoadingImplCopyWith<$Res> {
  factory _$$GetTasksLoadingImplCopyWith(_$GetTasksLoadingImpl value,
          $Res Function(_$GetTasksLoadingImpl) then) =
      __$$GetTasksLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTasksLoadingImplCopyWithImpl<$Res>
    extends _$GetTasksStateCopyWithImpl<$Res, _$GetTasksLoadingImpl>
    implements _$$GetTasksLoadingImplCopyWith<$Res> {
  __$$GetTasksLoadingImplCopyWithImpl(
      _$GetTasksLoadingImpl _value, $Res Function(_$GetTasksLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTasksLoadingImpl implements _GetTasksLoading {
  const _$GetTasksLoadingImpl();

  @override
  String toString() {
    return 'GetTasksState.getTasksLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTasksLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getTasksLoading,
    required TResult Function(List<TaskModel> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksError,
  }) {
    return getTasksLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getTasksLoading,
    TResult? Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksError,
  }) {
    return getTasksLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getTasksLoading,
    TResult Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksLoading != null) {
      return getTasksLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetTasksLoading value) getTasksLoading,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksError value) getTasksError,
  }) {
    return getTasksLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetTasksLoading value)? getTasksLoading,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksError value)? getTasksError,
  }) {
    return getTasksLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetTasksLoading value)? getTasksLoading,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksError value)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksLoading != null) {
      return getTasksLoading(this);
    }
    return orElse();
  }
}

abstract class _GetTasksLoading implements GetTasksState {
  const factory _GetTasksLoading() = _$GetTasksLoadingImpl;
}

/// @nodoc
abstract class _$$GetTasksSuccessImplCopyWith<$Res> {
  factory _$$GetTasksSuccessImplCopyWith(_$GetTasksSuccessImpl value,
          $Res Function(_$GetTasksSuccessImpl) then) =
      __$$GetTasksSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel> tasks});
}

/// @nodoc
class __$$GetTasksSuccessImplCopyWithImpl<$Res>
    extends _$GetTasksStateCopyWithImpl<$Res, _$GetTasksSuccessImpl>
    implements _$$GetTasksSuccessImplCopyWith<$Res> {
  __$$GetTasksSuccessImplCopyWithImpl(
      _$GetTasksSuccessImpl _value, $Res Function(_$GetTasksSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$GetTasksSuccessImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$GetTasksSuccessImpl implements _GetTasksSuccess {
  const _$GetTasksSuccessImpl({required final List<TaskModel> tasks})
      : _tasks = tasks;

  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'GetTasksState.getTasksSuccess(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksSuccessImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksSuccessImplCopyWith<_$GetTasksSuccessImpl> get copyWith =>
      __$$GetTasksSuccessImplCopyWithImpl<_$GetTasksSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getTasksLoading,
    required TResult Function(List<TaskModel> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksError,
  }) {
    return getTasksSuccess(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getTasksLoading,
    TResult? Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksError,
  }) {
    return getTasksSuccess?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getTasksLoading,
    TResult Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksSuccess != null) {
      return getTasksSuccess(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetTasksLoading value) getTasksLoading,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksError value) getTasksError,
  }) {
    return getTasksSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetTasksLoading value)? getTasksLoading,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksError value)? getTasksError,
  }) {
    return getTasksSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetTasksLoading value)? getTasksLoading,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksError value)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksSuccess != null) {
      return getTasksSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetTasksSuccess implements GetTasksState {
  const factory _GetTasksSuccess({required final List<TaskModel> tasks}) =
      _$GetTasksSuccessImpl;

  List<TaskModel> get tasks;
  @JsonKey(ignore: true)
  _$$GetTasksSuccessImplCopyWith<_$GetTasksSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksErrorImplCopyWith<$Res> {
  factory _$$GetTasksErrorImplCopyWith(
          _$GetTasksErrorImpl value, $Res Function(_$GetTasksErrorImpl) then) =
      __$$GetTasksErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetTasksErrorImplCopyWithImpl<$Res>
    extends _$GetTasksStateCopyWithImpl<$Res, _$GetTasksErrorImpl>
    implements _$$GetTasksErrorImplCopyWith<$Res> {
  __$$GetTasksErrorImplCopyWithImpl(
      _$GetTasksErrorImpl _value, $Res Function(_$GetTasksErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetTasksErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTasksErrorImpl implements _GetTasksError {
  const _$GetTasksErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetTasksState.getTasksError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksErrorImplCopyWith<_$GetTasksErrorImpl> get copyWith =>
      __$$GetTasksErrorImplCopyWithImpl<_$GetTasksErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getTasksLoading,
    required TResult Function(List<TaskModel> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksError,
  }) {
    return getTasksError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getTasksLoading,
    TResult? Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksError,
  }) {
    return getTasksError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getTasksLoading,
    TResult Function(List<TaskModel> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksError != null) {
      return getTasksError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetTasksLoading value) getTasksLoading,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksError value) getTasksError,
  }) {
    return getTasksError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetTasksLoading value)? getTasksLoading,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksError value)? getTasksError,
  }) {
    return getTasksError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetTasksLoading value)? getTasksLoading,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksError value)? getTasksError,
    required TResult orElse(),
  }) {
    if (getTasksError != null) {
      return getTasksError(this);
    }
    return orElse();
  }
}

abstract class _GetTasksError implements GetTasksState {
  const factory _GetTasksError({required final String error}) =
      _$GetTasksErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$GetTasksErrorImplCopyWith<_$GetTasksErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
