// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createTaskLoading,
    required TResult Function(TaskModel task) createTaskSuccess,
    required TResult Function(String error) createTaskError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createTaskLoading,
    TResult? Function(TaskModel task)? createTaskSuccess,
    TResult? Function(String error)? createTaskError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createTaskLoading,
    TResult Function(TaskModel task)? createTaskSuccess,
    TResult Function(String error)? createTaskError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateTaskLoading value) createTaskLoading,
    required TResult Function(_CreateTaskSuccess value) createTaskSuccess,
    required TResult Function(_CreateTaskError value) createTaskError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateTaskLoading value)? createTaskLoading,
    TResult? Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult? Function(_CreateTaskError value)? createTaskError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateTaskLoading value)? createTaskLoading,
    TResult Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult Function(_CreateTaskError value)? createTaskError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskStateCopyWith<$Res> {
  factory $AddTaskStateCopyWith(
          AddTaskState value, $Res Function(AddTaskState) then) =
      _$AddTaskStateCopyWithImpl<$Res, AddTaskState>;
}

/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res, $Val extends AddTaskState>
    implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._value, this._then);

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
    extends _$AddTaskStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AddTaskState.initial()';
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
    required TResult Function() createTaskLoading,
    required TResult Function(TaskModel task) createTaskSuccess,
    required TResult Function(String error) createTaskError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createTaskLoading,
    TResult? Function(TaskModel task)? createTaskSuccess,
    TResult? Function(String error)? createTaskError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createTaskLoading,
    TResult Function(TaskModel task)? createTaskSuccess,
    TResult Function(String error)? createTaskError,
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
    required TResult Function(_CreateTaskLoading value) createTaskLoading,
    required TResult Function(_CreateTaskSuccess value) createTaskSuccess,
    required TResult Function(_CreateTaskError value) createTaskError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateTaskLoading value)? createTaskLoading,
    TResult? Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult? Function(_CreateTaskError value)? createTaskError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateTaskLoading value)? createTaskLoading,
    TResult Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult Function(_CreateTaskError value)? createTaskError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddTaskState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CreateTaskLoadingImplCopyWith<$Res> {
  factory _$$CreateTaskLoadingImplCopyWith(_$CreateTaskLoadingImpl value,
          $Res Function(_$CreateTaskLoadingImpl) then) =
      __$$CreateTaskLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateTaskLoadingImplCopyWithImpl<$Res>
    extends _$AddTaskStateCopyWithImpl<$Res, _$CreateTaskLoadingImpl>
    implements _$$CreateTaskLoadingImplCopyWith<$Res> {
  __$$CreateTaskLoadingImplCopyWithImpl(_$CreateTaskLoadingImpl _value,
      $Res Function(_$CreateTaskLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateTaskLoadingImpl implements _CreateTaskLoading {
  const _$CreateTaskLoadingImpl();

  @override
  String toString() {
    return 'AddTaskState.createTaskLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateTaskLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createTaskLoading,
    required TResult Function(TaskModel task) createTaskSuccess,
    required TResult Function(String error) createTaskError,
  }) {
    return createTaskLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createTaskLoading,
    TResult? Function(TaskModel task)? createTaskSuccess,
    TResult? Function(String error)? createTaskError,
  }) {
    return createTaskLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createTaskLoading,
    TResult Function(TaskModel task)? createTaskSuccess,
    TResult Function(String error)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskLoading != null) {
      return createTaskLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateTaskLoading value) createTaskLoading,
    required TResult Function(_CreateTaskSuccess value) createTaskSuccess,
    required TResult Function(_CreateTaskError value) createTaskError,
  }) {
    return createTaskLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateTaskLoading value)? createTaskLoading,
    TResult? Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult? Function(_CreateTaskError value)? createTaskError,
  }) {
    return createTaskLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateTaskLoading value)? createTaskLoading,
    TResult Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult Function(_CreateTaskError value)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskLoading != null) {
      return createTaskLoading(this);
    }
    return orElse();
  }
}

abstract class _CreateTaskLoading implements AddTaskState {
  const factory _CreateTaskLoading() = _$CreateTaskLoadingImpl;
}

/// @nodoc
abstract class _$$CreateTaskSuccessImplCopyWith<$Res> {
  factory _$$CreateTaskSuccessImplCopyWith(_$CreateTaskSuccessImpl value,
          $Res Function(_$CreateTaskSuccessImpl) then) =
      __$$CreateTaskSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task});
}

/// @nodoc
class __$$CreateTaskSuccessImplCopyWithImpl<$Res>
    extends _$AddTaskStateCopyWithImpl<$Res, _$CreateTaskSuccessImpl>
    implements _$$CreateTaskSuccessImplCopyWith<$Res> {
  __$$CreateTaskSuccessImplCopyWithImpl(_$CreateTaskSuccessImpl _value,
      $Res Function(_$CreateTaskSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$CreateTaskSuccessImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$CreateTaskSuccessImpl implements _CreateTaskSuccess {
  const _$CreateTaskSuccessImpl({required this.task});

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'AddTaskState.createTaskSuccess(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskSuccessImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskSuccessImplCopyWith<_$CreateTaskSuccessImpl> get copyWith =>
      __$$CreateTaskSuccessImplCopyWithImpl<_$CreateTaskSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createTaskLoading,
    required TResult Function(TaskModel task) createTaskSuccess,
    required TResult Function(String error) createTaskError,
  }) {
    return createTaskSuccess(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createTaskLoading,
    TResult? Function(TaskModel task)? createTaskSuccess,
    TResult? Function(String error)? createTaskError,
  }) {
    return createTaskSuccess?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createTaskLoading,
    TResult Function(TaskModel task)? createTaskSuccess,
    TResult Function(String error)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskSuccess != null) {
      return createTaskSuccess(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateTaskLoading value) createTaskLoading,
    required TResult Function(_CreateTaskSuccess value) createTaskSuccess,
    required TResult Function(_CreateTaskError value) createTaskError,
  }) {
    return createTaskSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateTaskLoading value)? createTaskLoading,
    TResult? Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult? Function(_CreateTaskError value)? createTaskError,
  }) {
    return createTaskSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateTaskLoading value)? createTaskLoading,
    TResult Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult Function(_CreateTaskError value)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskSuccess != null) {
      return createTaskSuccess(this);
    }
    return orElse();
  }
}

abstract class _CreateTaskSuccess implements AddTaskState {
  const factory _CreateTaskSuccess({required final TaskModel task}) =
      _$CreateTaskSuccessImpl;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$CreateTaskSuccessImplCopyWith<_$CreateTaskSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTaskErrorImplCopyWith<$Res> {
  factory _$$CreateTaskErrorImplCopyWith(_$CreateTaskErrorImpl value,
          $Res Function(_$CreateTaskErrorImpl) then) =
      __$$CreateTaskErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CreateTaskErrorImplCopyWithImpl<$Res>
    extends _$AddTaskStateCopyWithImpl<$Res, _$CreateTaskErrorImpl>
    implements _$$CreateTaskErrorImplCopyWith<$Res> {
  __$$CreateTaskErrorImplCopyWithImpl(
      _$CreateTaskErrorImpl _value, $Res Function(_$CreateTaskErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CreateTaskErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateTaskErrorImpl implements _CreateTaskError {
  const _$CreateTaskErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AddTaskState.createTaskError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskErrorImplCopyWith<_$CreateTaskErrorImpl> get copyWith =>
      __$$CreateTaskErrorImplCopyWithImpl<_$CreateTaskErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createTaskLoading,
    required TResult Function(TaskModel task) createTaskSuccess,
    required TResult Function(String error) createTaskError,
  }) {
    return createTaskError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createTaskLoading,
    TResult? Function(TaskModel task)? createTaskSuccess,
    TResult? Function(String error)? createTaskError,
  }) {
    return createTaskError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createTaskLoading,
    TResult Function(TaskModel task)? createTaskSuccess,
    TResult Function(String error)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskError != null) {
      return createTaskError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateTaskLoading value) createTaskLoading,
    required TResult Function(_CreateTaskSuccess value) createTaskSuccess,
    required TResult Function(_CreateTaskError value) createTaskError,
  }) {
    return createTaskError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateTaskLoading value)? createTaskLoading,
    TResult? Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult? Function(_CreateTaskError value)? createTaskError,
  }) {
    return createTaskError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateTaskLoading value)? createTaskLoading,
    TResult Function(_CreateTaskSuccess value)? createTaskSuccess,
    TResult Function(_CreateTaskError value)? createTaskError,
    required TResult orElse(),
  }) {
    if (createTaskError != null) {
      return createTaskError(this);
    }
    return orElse();
  }
}

abstract class _CreateTaskError implements AddTaskState {
  const factory _CreateTaskError({required final String error}) =
      _$CreateTaskErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$CreateTaskErrorImplCopyWith<_$CreateTaskErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
