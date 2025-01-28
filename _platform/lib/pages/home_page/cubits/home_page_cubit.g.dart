// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomePageStateCWProxy {
  HomePageState selectedDesignIndex(int selectedDesignIndex);

  HomePageState designs(List<DesignModel> designs);

  HomePageState fetchingDesigns(bool fetchingDesigns);

  HomePageState fetchingFailed(bool fetchingFailed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomePageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomePageState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomePageState call({
    int selectedDesignIndex,
    List<DesignModel> designs,
    bool fetchingDesigns,
    bool fetchingFailed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomePageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomePageState.copyWith.fieldName(...)`
class _$HomePageStateCWProxyImpl implements _$HomePageStateCWProxy {
  const _$HomePageStateCWProxyImpl(this._value);

  final HomePageState _value;

  @override
  HomePageState selectedDesignIndex(int selectedDesignIndex) =>
      this(selectedDesignIndex: selectedDesignIndex);

  @override
  HomePageState designs(List<DesignModel> designs) => this(designs: designs);

  @override
  HomePageState fetchingDesigns(bool fetchingDesigns) =>
      this(fetchingDesigns: fetchingDesigns);

  @override
  HomePageState fetchingFailed(bool fetchingFailed) =>
      this(fetchingFailed: fetchingFailed);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomePageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomePageState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomePageState call({
    Object? selectedDesignIndex = const $CopyWithPlaceholder(),
    Object? designs = const $CopyWithPlaceholder(),
    Object? fetchingDesigns = const $CopyWithPlaceholder(),
    Object? fetchingFailed = const $CopyWithPlaceholder(),
  }) {
    return HomePageState(
      selectedDesignIndex: selectedDesignIndex == const $CopyWithPlaceholder()
          ? _value.selectedDesignIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedDesignIndex as int,
      designs: designs == const $CopyWithPlaceholder()
          ? _value.designs
          // ignore: cast_nullable_to_non_nullable
          : designs as List<DesignModel>,
      fetchingDesigns: fetchingDesigns == const $CopyWithPlaceholder()
          ? _value.fetchingDesigns
          // ignore: cast_nullable_to_non_nullable
          : fetchingDesigns as bool,
      fetchingFailed: fetchingFailed == const $CopyWithPlaceholder()
          ? _value.fetchingFailed
          // ignore: cast_nullable_to_non_nullable
          : fetchingFailed as bool,
    );
  }
}

extension $HomePageStateCopyWith on HomePageState {
  /// Returns a callable class that can be used as follows: `instanceOfHomePageState.copyWith(...)` or like so:`instanceOfHomePageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomePageStateCWProxy get copyWith => _$HomePageStateCWProxyImpl(this);
}
