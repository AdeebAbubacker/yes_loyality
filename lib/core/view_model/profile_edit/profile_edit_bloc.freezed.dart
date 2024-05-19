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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  dynamic get register =>
      throw _privateConstructorUsedError; // Change type to dynamic
  Option<Either<MainFailure, dynamic>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      dynamic register,
      Option<Either<MainFailure, dynamic>> successorFailure});
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? register = freezed,
    Object? successorFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as dynamic,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEditStateImplCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$$ProfileEditStateImplCopyWith(_$ProfileEditStateImpl value,
          $Res Function(_$ProfileEditStateImpl) then) =
      __$$ProfileEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      dynamic register,
      Option<Either<MainFailure, dynamic>> successorFailure});
}

/// @nodoc
class __$$ProfileEditStateImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$ProfileEditStateImpl>
    implements _$$ProfileEditStateImplCopyWith<$Res> {
  __$$ProfileEditStateImplCopyWithImpl(_$ProfileEditStateImpl _value,
      $Res Function(_$ProfileEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? register = freezed,
    Object? successorFailure = null,
  }) {
    return _then(_$ProfileEditStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as dynamic,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ProfileEditStateImpl implements _ProfileEditState {
  const _$ProfileEditStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.register,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final dynamic register;
// Change type to dynamic
  @override
  final Option<Either<MainFailure, dynamic>> successorFailure;

  @override
  String toString() {
    return 'ProfileEditState(isLoading: $isLoading, isError: $isError, register: $register, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other.register, register) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(register), successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      __$$ProfileEditStateImplCopyWithImpl<_$ProfileEditStateImpl>(
          this, _$identity);
}

abstract class _ProfileEditState implements ProfileEditState {
  const factory _ProfileEditState(
      {required final bool isLoading,
      required final bool isError,
      required final dynamic register,
      required final Option<Either<MainFailure, dynamic>>
          successorFailure}) = _$ProfileEditStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  dynamic get register;
  @override // Change type to dynamic
  Option<Either<MainFailure, dynamic>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
