// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddToDoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createToDoLoading,
    required TResult Function(ToDoModel todo) createToDoSuccess,
    required TResult Function(String error) createToDoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createToDoLoading,
    TResult? Function(ToDoModel todo)? createToDoSuccess,
    TResult? Function(String error)? createToDoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createToDoLoading,
    TResult Function(ToDoModel todo)? createToDoSuccess,
    TResult Function(String error)? createToDoError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateToDoLoading value) createToDoLoading,
    required TResult Function(_CreateToDoSuccess value) createToDoSuccess,
    required TResult Function(_CreateToDoError value) createToDoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateToDoLoading value)? createToDoLoading,
    TResult? Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult? Function(_CreateToDoError value)? createToDoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateToDoLoading value)? createToDoLoading,
    TResult Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult Function(_CreateToDoError value)? createToDoError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToDoStateCopyWith<$Res> {
  factory $AddToDoStateCopyWith(
          AddToDoState value, $Res Function(AddToDoState) then) =
      _$AddToDoStateCopyWithImpl<$Res, AddToDoState>;
}

/// @nodoc
class _$AddToDoStateCopyWithImpl<$Res, $Val extends AddToDoState>
    implements $AddToDoStateCopyWith<$Res> {
  _$AddToDoStateCopyWithImpl(this._value, this._then);

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
    extends _$AddToDoStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AddToDoState.initial()';
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
    required TResult Function() createToDoLoading,
    required TResult Function(ToDoModel todo) createToDoSuccess,
    required TResult Function(String error) createToDoError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createToDoLoading,
    TResult? Function(ToDoModel todo)? createToDoSuccess,
    TResult? Function(String error)? createToDoError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createToDoLoading,
    TResult Function(ToDoModel todo)? createToDoSuccess,
    TResult Function(String error)? createToDoError,
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
    required TResult Function(_CreateToDoLoading value) createToDoLoading,
    required TResult Function(_CreateToDoSuccess value) createToDoSuccess,
    required TResult Function(_CreateToDoError value) createToDoError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateToDoLoading value)? createToDoLoading,
    TResult? Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult? Function(_CreateToDoError value)? createToDoError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateToDoLoading value)? createToDoLoading,
    TResult Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult Function(_CreateToDoError value)? createToDoError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddToDoState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CreateToDoLoadingImplCopyWith<$Res> {
  factory _$$CreateToDoLoadingImplCopyWith(_$CreateToDoLoadingImpl value,
          $Res Function(_$CreateToDoLoadingImpl) then) =
      __$$CreateToDoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateToDoLoadingImplCopyWithImpl<$Res>
    extends _$AddToDoStateCopyWithImpl<$Res, _$CreateToDoLoadingImpl>
    implements _$$CreateToDoLoadingImplCopyWith<$Res> {
  __$$CreateToDoLoadingImplCopyWithImpl(_$CreateToDoLoadingImpl _value,
      $Res Function(_$CreateToDoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateToDoLoadingImpl implements _CreateToDoLoading {
  const _$CreateToDoLoadingImpl();

  @override
  String toString() {
    return 'AddToDoState.createToDoLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateToDoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createToDoLoading,
    required TResult Function(ToDoModel todo) createToDoSuccess,
    required TResult Function(String error) createToDoError,
  }) {
    return createToDoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createToDoLoading,
    TResult? Function(ToDoModel todo)? createToDoSuccess,
    TResult? Function(String error)? createToDoError,
  }) {
    return createToDoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createToDoLoading,
    TResult Function(ToDoModel todo)? createToDoSuccess,
    TResult Function(String error)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoLoading != null) {
      return createToDoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateToDoLoading value) createToDoLoading,
    required TResult Function(_CreateToDoSuccess value) createToDoSuccess,
    required TResult Function(_CreateToDoError value) createToDoError,
  }) {
    return createToDoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateToDoLoading value)? createToDoLoading,
    TResult? Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult? Function(_CreateToDoError value)? createToDoError,
  }) {
    return createToDoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateToDoLoading value)? createToDoLoading,
    TResult Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult Function(_CreateToDoError value)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoLoading != null) {
      return createToDoLoading(this);
    }
    return orElse();
  }
}

abstract class _CreateToDoLoading implements AddToDoState {
  const factory _CreateToDoLoading() = _$CreateToDoLoadingImpl;
}

/// @nodoc
abstract class _$$CreateToDoSuccessImplCopyWith<$Res> {
  factory _$$CreateToDoSuccessImplCopyWith(_$CreateToDoSuccessImpl value,
          $Res Function(_$CreateToDoSuccessImpl) then) =
      __$$CreateToDoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ToDoModel todo});
}

/// @nodoc
class __$$CreateToDoSuccessImplCopyWithImpl<$Res>
    extends _$AddToDoStateCopyWithImpl<$Res, _$CreateToDoSuccessImpl>
    implements _$$CreateToDoSuccessImplCopyWith<$Res> {
  __$$CreateToDoSuccessImplCopyWithImpl(_$CreateToDoSuccessImpl _value,
      $Res Function(_$CreateToDoSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$CreateToDoSuccessImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDoModel,
    ));
  }
}

/// @nodoc

class _$CreateToDoSuccessImpl implements _CreateToDoSuccess {
  const _$CreateToDoSuccessImpl({required this.todo});

  @override
  final ToDoModel todo;

  @override
  String toString() {
    return 'AddToDoState.createToDoSuccess(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateToDoSuccessImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateToDoSuccessImplCopyWith<_$CreateToDoSuccessImpl> get copyWith =>
      __$$CreateToDoSuccessImplCopyWithImpl<_$CreateToDoSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createToDoLoading,
    required TResult Function(ToDoModel todo) createToDoSuccess,
    required TResult Function(String error) createToDoError,
  }) {
    return createToDoSuccess(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createToDoLoading,
    TResult? Function(ToDoModel todo)? createToDoSuccess,
    TResult? Function(String error)? createToDoError,
  }) {
    return createToDoSuccess?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createToDoLoading,
    TResult Function(ToDoModel todo)? createToDoSuccess,
    TResult Function(String error)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoSuccess != null) {
      return createToDoSuccess(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateToDoLoading value) createToDoLoading,
    required TResult Function(_CreateToDoSuccess value) createToDoSuccess,
    required TResult Function(_CreateToDoError value) createToDoError,
  }) {
    return createToDoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateToDoLoading value)? createToDoLoading,
    TResult? Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult? Function(_CreateToDoError value)? createToDoError,
  }) {
    return createToDoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateToDoLoading value)? createToDoLoading,
    TResult Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult Function(_CreateToDoError value)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoSuccess != null) {
      return createToDoSuccess(this);
    }
    return orElse();
  }
}

abstract class _CreateToDoSuccess implements AddToDoState {
  const factory _CreateToDoSuccess({required final ToDoModel todo}) =
      _$CreateToDoSuccessImpl;

  ToDoModel get todo;
  @JsonKey(ignore: true)
  _$$CreateToDoSuccessImplCopyWith<_$CreateToDoSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateToDoErrorImplCopyWith<$Res> {
  factory _$$CreateToDoErrorImplCopyWith(_$CreateToDoErrorImpl value,
          $Res Function(_$CreateToDoErrorImpl) then) =
      __$$CreateToDoErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CreateToDoErrorImplCopyWithImpl<$Res>
    extends _$AddToDoStateCopyWithImpl<$Res, _$CreateToDoErrorImpl>
    implements _$$CreateToDoErrorImplCopyWith<$Res> {
  __$$CreateToDoErrorImplCopyWithImpl(
      _$CreateToDoErrorImpl _value, $Res Function(_$CreateToDoErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CreateToDoErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateToDoErrorImpl implements _CreateToDoError {
  const _$CreateToDoErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AddToDoState.createToDoError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateToDoErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateToDoErrorImplCopyWith<_$CreateToDoErrorImpl> get copyWith =>
      __$$CreateToDoErrorImplCopyWithImpl<_$CreateToDoErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createToDoLoading,
    required TResult Function(ToDoModel todo) createToDoSuccess,
    required TResult Function(String error) createToDoError,
  }) {
    return createToDoError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createToDoLoading,
    TResult? Function(ToDoModel todo)? createToDoSuccess,
    TResult? Function(String error)? createToDoError,
  }) {
    return createToDoError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createToDoLoading,
    TResult Function(ToDoModel todo)? createToDoSuccess,
    TResult Function(String error)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoError != null) {
      return createToDoError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CreateToDoLoading value) createToDoLoading,
    required TResult Function(_CreateToDoSuccess value) createToDoSuccess,
    required TResult Function(_CreateToDoError value) createToDoError,
  }) {
    return createToDoError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CreateToDoLoading value)? createToDoLoading,
    TResult? Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult? Function(_CreateToDoError value)? createToDoError,
  }) {
    return createToDoError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CreateToDoLoading value)? createToDoLoading,
    TResult Function(_CreateToDoSuccess value)? createToDoSuccess,
    TResult Function(_CreateToDoError value)? createToDoError,
    required TResult orElse(),
  }) {
    if (createToDoError != null) {
      return createToDoError(this);
    }
    return orElse();
  }
}

abstract class _CreateToDoError implements AddToDoState {
  const factory _CreateToDoError({required final String error}) =
      _$CreateToDoErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$CreateToDoErrorImplCopyWith<_$CreateToDoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
