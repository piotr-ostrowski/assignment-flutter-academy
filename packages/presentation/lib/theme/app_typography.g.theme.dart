// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_typography.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$AppTypographyExtensionMixin on ThemeExtension<AppTypographyExtension> {
  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? headingSmall,
    TextStyle? titleXLarge,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? labelXXLarge,
    TextStyle? labelXLarge,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? labelXXLargeLight,
    TextStyle? bodyXLarge,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? textSizePopup,
  }) {
    final _this = (this as AppTypographyExtension);

    return AppTypographyExtension(
      headingLarge: headingLarge ?? _this.headingLarge,
      headingMedium: headingMedium ?? _this.headingMedium,
      headingSmall: headingSmall ?? _this.headingSmall,
      titleXLarge: titleXLarge ?? _this.titleXLarge,
      titleLarge: titleLarge ?? _this.titleLarge,
      titleMedium: titleMedium ?? _this.titleMedium,
      titleSmall: titleSmall ?? _this.titleSmall,
      labelXXLarge: labelXXLarge ?? _this.labelXXLarge,
      labelXLarge: labelXLarge ?? _this.labelXLarge,
      labelLarge: labelLarge ?? _this.labelLarge,
      labelMedium: labelMedium ?? _this.labelMedium,
      labelSmall: labelSmall ?? _this.labelSmall,
      labelXXLargeLight: labelXXLargeLight ?? _this.labelXXLargeLight,
      bodyXLarge: bodyXLarge ?? _this.bodyXLarge,
      bodyLarge: bodyLarge ?? _this.bodyLarge,
      bodyMedium: bodyMedium ?? _this.bodyMedium,
      bodySmall: bodySmall ?? _this.bodySmall,
      textSizePopup: textSizePopup ?? _this.textSizePopup,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
    ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) {
      return this;
    }

    final _this = (this as AppTypographyExtension);

    return AppTypographyExtension(
      headingLarge: TextStyle.lerp(_this.headingLarge, other.headingLarge, t)!,
      headingMedium: TextStyle.lerp(
        _this.headingMedium,
        other.headingMedium,
        t,
      )!,
      headingSmall: TextStyle.lerp(_this.headingSmall, other.headingSmall, t)!,
      titleXLarge: TextStyle.lerp(_this.titleXLarge, other.titleXLarge, t)!,
      titleLarge: TextStyle.lerp(_this.titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(_this.titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(_this.titleSmall, other.titleSmall, t)!,
      labelXXLarge: TextStyle.lerp(_this.labelXXLarge, other.labelXXLarge, t)!,
      labelXLarge: TextStyle.lerp(_this.labelXLarge, other.labelXLarge, t)!,
      labelLarge: TextStyle.lerp(_this.labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(_this.labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(_this.labelSmall, other.labelSmall, t)!,
      labelXXLargeLight: TextStyle.lerp(
        _this.labelXXLargeLight,
        other.labelXXLargeLight,
        t,
      )!,
      bodyXLarge: TextStyle.lerp(_this.bodyXLarge, other.bodyXLarge, t)!,
      bodyLarge: TextStyle.lerp(_this.bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(_this.bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(_this.bodySmall, other.bodySmall, t)!,
      textSizePopup: TextStyle.lerp(
        _this.textSizePopup,
        other.textSizePopup,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as AppTypographyExtension);
    final _other = (other as AppTypographyExtension);

    return _other.headingLarge == _this.headingLarge &&
        _other.headingMedium == _this.headingMedium &&
        _other.headingSmall == _this.headingSmall &&
        _other.titleXLarge == _this.titleXLarge &&
        _other.titleLarge == _this.titleLarge &&
        _other.titleMedium == _this.titleMedium &&
        _other.titleSmall == _this.titleSmall &&
        _other.labelXXLarge == _this.labelXXLarge &&
        _other.labelXLarge == _this.labelXLarge &&
        _other.labelLarge == _this.labelLarge &&
        _other.labelMedium == _this.labelMedium &&
        _other.labelSmall == _this.labelSmall &&
        _other.labelXXLargeLight == _this.labelXXLargeLight &&
        _other.bodyXLarge == _this.bodyXLarge &&
        _other.bodyLarge == _this.bodyLarge &&
        _other.bodyMedium == _this.bodyMedium &&
        _other.bodySmall == _this.bodySmall &&
        _other.textSizePopup == _this.textSizePopup;
  }

  @override
  int get hashCode {
    final _this = (this as AppTypographyExtension);

    return Object.hash(
      runtimeType,
      _this.headingLarge,
      _this.headingMedium,
      _this.headingSmall,
      _this.titleXLarge,
      _this.titleLarge,
      _this.titleMedium,
      _this.titleSmall,
      _this.labelXXLarge,
      _this.labelXLarge,
      _this.labelLarge,
      _this.labelMedium,
      _this.labelSmall,
      _this.labelXXLargeLight,
      _this.bodyXLarge,
      _this.bodyLarge,
      _this.bodyMedium,
      _this.bodySmall,
      _this.textSizePopup,
    );
  }
}

extension AppTypographyExtensionBuildContext on BuildContext {
  AppTypographyExtension get appTypography =>
      Theme.of(this).extension<AppTypographyExtension>()!;
}
