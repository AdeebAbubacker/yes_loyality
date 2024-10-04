// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String name, String email, String phone, dynamic? image)
        profileEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProfileEdit value) profileEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileEdit value)? profileEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileEdit value)? profileEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditEventCopyWith<$Res> {
  factory $ProfileEditEventCopyWith(
          ProfileEditEvent value, $Res Function(ProfileEditEvent) then) =
      _$ProfileEditEventCopyWithImpl<$Res, ProfileEditEvent>;
}

/// @nodoc
class _$ProfileEditEventCopyWithImpl<$Res, $Val extends ProfileEditEvent>
    implements $ProfileEditEventCopyWith<$Res> {
  _$ProfileEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ProfileEditEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String name, String email, String phone, dynamic? image)
        profileEdit,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProfileEdit value) profileEdit,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileEdit value)? profileEdit,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileEdit value)? profileEdit,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileEditEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ProfileEditImplCopyWith<$Res> {
  factory _$$ProfileEditImplCopyWith(
          _$ProfileEditImpl value, $Res Function(_$ProfileEditImpl) then) =
      __$$ProfileEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email, String phone, dynamic? image});
}

/// @nodoc
class __$$ProfileEditImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$ProfileEditImpl>
    implements _$$ProfileEditImplCopyWith<$Res> {
  __$$ProfileEditImplCopyWithImpl(
      _$ProfileEditImpl _value, $Res Function(_$ProfileEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? image = freezed,
  }) {
    return _then(_$ProfileEditImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc

class _$ProfileEditImpl implements _ProfileEdit {
  const _$ProfileEditImpl(
      {required this.name,
      required this.email,
      required this.phone,
      this.image});

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final dynamic? image;

  @override
  String toString() {
    return 'ProfileEditEvent.profileEdit(name: $name, email: $email, phone: $phone, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone,
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditImplCopyWith<_$ProfileEditImpl> get copyWith =>
      __$$ProfileEditImplCopyWithImpl<_$ProfileEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String name, String email, String phone, dynamic? image)
        profileEdit,
  }) {
    return profileEdit(name, email, phone, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
  }) {
    return profileEdit?.call(name, email, phone, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String phone, dynamic? image)?
        profileEdit,
    required TResult orElse(),
  }) {
    if (profileEdit != null) {
      return profileEdit(name, email, phone, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProfileEdit value) profileEdit,
  }) {
    return profileEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileEdit value)? profileEdit,
  }) {
    return profileEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileEdit value)? profileEdit,
    required TResult orElse(),
  }) {
    if (profileEdit != null) {
      return profileEdit(this);
    }
    return orElse();
  }
}

abstract class _ProfileEdit implements ProfileEditEvent {
  const factory _ProfileEdit(
      {required final String name,
      required final String email,
      required final String phone,
      final dynamic? image}) = _$ProfileEditImpl;

  String get name;
  String get email;
  String get phone;
  dynamic? get image;
  @JsonKey(ignore: true)
  _$$ProfileEditImplCopyWith<_$ProfileEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

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
    extends _$ProfileEditStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProfileEditState.initial()';
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
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileEditState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfileEditState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProfileEditState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.response);

  @override
  final dynamic response;

  @override
  String toString() {
    return 'ProfileEditState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProfileEditState {
  const factory _Success(final dynamic response) = _$SuccessImpl;

  dynamic get response;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileEditState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ProfileEditState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {dynamic nameError,
      dynamic emailError,
      dynamic phoneError,
      dynamic passwordError,
      dynamic passwordConfirmError});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameError = freezed,
    Object? emailError = freezed,
    Object? phoneError = freezed,
    Object? passwordError = freezed,
    Object? passwordConfirmError = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneError: freezed == phoneError
          ? _value.phoneError
          : phoneError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordConfirmError: freezed == passwordConfirmError
          ? _value.passwordConfirmError
          : passwordConfirmError // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ValidationErrorImpl implements _ValidationError {
  const _$ValidationErrorImpl(
      {this.nameError,
      this.emailError,
      this.phoneError,
      this.passwordError,
      this.passwordConfirmError});

  @override
  final dynamic nameError;
  @override
  final dynamic emailError;
  @override
  final dynamic phoneError;
  @override
  final dynamic passwordError;
  @override
  final dynamic passwordConfirmError;

  @override
  String toString() {
    return 'ProfileEditState.validationError(nameError: $nameError, emailError: $emailError, phoneError: $phoneError, passwordError: $passwordError, passwordConfirmError: $passwordConfirmError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            const DeepCollectionEquality().equals(other.nameError, nameError) &&
            const DeepCollectionEquality()
                .equals(other.emailError, emailError) &&
            const DeepCollectionEquality()
                .equals(other.phoneError, phoneError) &&
            const DeepCollectionEquality()
                .equals(other.passwordError, passwordError) &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirmError, passwordConfirmError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nameError),
      const DeepCollectionEquality().hash(emailError),
      const DeepCollectionEquality().hash(phoneError),
      const DeepCollectionEquality().hash(passwordError),
      const DeepCollectionEquality().hash(passwordConfirmError));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
    required TResult Function(
            dynamic nameError,
            dynamic emailError,
            dynamic phoneError,
            dynamic passwordError,
            dynamic passwordConfirmError)
        validationError,
  }) {
    return validationError(
        nameError, emailError, phoneError, passwordError, passwordConfirmError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
    TResult? Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
  }) {
    return validationError?.call(
        nameError, emailError, phoneError, passwordError, passwordConfirmError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    TResult Function(dynamic nameError, dynamic emailError, dynamic phoneError,
            dynamic passwordError, dynamic passwordConfirmError)?
        validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(nameError, emailError, phoneError, passwordError,
          passwordConfirmError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ValidationError value) validationError,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ValidationError value)? validationError,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ValidationError value)? validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class _ValidationError implements ProfileEditState {
  const factory _ValidationError(
      {final dynamic nameError,
      final dynamic emailError,
      final dynamic phoneError,
      final dynamic passwordError,
      final dynamic passwordConfirmError}) = _$ValidationErrorImpl;

  dynamic get nameError;
  dynamic get emailError;
  dynamic get phoneError;
  dynamic get passwordError;
  dynamic get passwordConfirmError;
  @JsonKey(ignore: true)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
