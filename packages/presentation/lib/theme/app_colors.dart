import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

import 'app_color_primitives.dart';

part 'app_colors.g.theme.dart';

// ─── Facade value classes ─────────────────────────────────────────────────────

@immutable
class BasicSurfaceColors {
  const BasicSurfaceColors({
    required this.default_,
    required this.secondary,
    required this.tertiary,
  });
  final Color default_;
  final Color secondary;
  final Color tertiary;
}

@immutable
class BasicBorderColors {
  const BasicBorderColors({
    required this.default_,
    required this.secondary,
    required this.tertiary,
  });
  final Color default_;
  final Color secondary;
  final Color tertiary;
}

@immutable
class BasicContentColors {
  const BasicContentColors({
    required this.default_,
    required this.secondary,
    required this.disabled,
    required this.inverted,
  });
  final Color default_;
  final Color secondary;
  final Color disabled;
  final Color inverted;
}

@immutable
class BasicBackgroundColors {
  const BasicBackgroundColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class BasicColors {
  const BasicColors({
    required this.surface,
    required this.border,
    required this.content,
    required this.background,
  });
  final BasicSurfaceColors surface;
  final BasicBorderColors border;
  final BasicContentColors content;
  final BasicBackgroundColors background;
}

@immutable
class ActionSurfaceColors {
  const ActionSurfaceColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class ActionBorderColors {
  const ActionBorderColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class ActionContentColors {
  const ActionContentColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class ActionColors {
  const ActionColors({
    required this.surface,
    required this.border,
    required this.content,
  });
  final ActionSurfaceColors surface;
  final ActionBorderColors border;
  final ActionContentColors content;
}

@immutable
class CriticalSurfaceColors {
  const CriticalSurfaceColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class CriticalBorderColors {
  const CriticalBorderColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class CriticalContentColors {
  const CriticalContentColors({
    required this.default_,
    required this.secondary,
  });
  final Color default_;
  final Color secondary;
}

@immutable
class CriticalColors {
  const CriticalColors({
    required this.surface,
    required this.border,
    required this.content,
  });
  final CriticalSurfaceColors surface;
  final CriticalBorderColors border;
  final CriticalContentColors content;
}

@immutable
class SpecialColors {
  const SpecialColors({
    required this.electricity,
    required this.electricityBackground,
    required this.gas,
    required this.gasBackground,
    required this.solar,
    required this.solarBackground,
    required this.blue,
    required this.blueBackground,
  });
  final Color electricity;
  final Color electricityBackground;
  final Color gas;
  final Color gasBackground;
  final Color solar;
  final Color solarBackground;
  final Color blue;
  final Color blueBackground;
}

// ─── AppColorsExtension ───────────────────────────────────────────────────────

@themeExtensions
class AppColorsExtension extends ThemeExtension<AppColorsExtension>
    with _$AppColorsExtensionMixin {
  const AppColorsExtension({
    // Basic Surface
    required this.basicSurfaceDefault,
    required this.basicSurfaceSecondary,
    required this.basicSurfaceTertiary,
    // Basic Border
    required this.basicBorderDefault,
    required this.basicBorderSecondary,
    required this.basicBorderTertiary,
    // Basic Content
    required this.basicContentDefault,
    required this.basicContentSecondary,
    required this.basicContentDisabled,
    required this.basicContentInverted,
    // Basic Background
    required this.basicBackgroundDefault,
    required this.basicBackgroundSecondary,
    // Action Surface
    required this.actionSurfaceDefault,
    required this.actionSurfaceSecondary,
    // Action Border
    required this.actionBorderDefault,
    required this.actionBorderSecondary,
    // Action Content
    required this.actionContentDefault,
    required this.actionContentSecondary,
    // Critical Surface
    required this.criticalSurfaceDefault,
    required this.criticalSurfaceSecondary,
    // Critical Border
    required this.criticalBorderDefault,
    required this.criticalBorderSecondary,
    // Critical Content
    required this.criticalContentDefault,
    required this.criticalContentSecondary,
    // Special
    required this.specialElectricity,
    required this.specialElectricityBackground,
    required this.specialGas,
    required this.specialGasBackground,
    required this.specialSolar,
    required this.specialSolarBackground,
    required this.specialBlue,
    required this.specialBlueBackground,
  });

  // Basic Surface
  final Color basicSurfaceDefault;
  final Color basicSurfaceSecondary;
  final Color basicSurfaceTertiary;
  // Basic Border
  final Color basicBorderDefault;
  final Color basicBorderSecondary;
  final Color basicBorderTertiary;
  // Basic Content
  final Color basicContentDefault;
  final Color basicContentSecondary;
  final Color basicContentDisabled;
  final Color basicContentInverted;
  // Basic Background
  final Color basicBackgroundDefault;
  final Color basicBackgroundSecondary;
  // Action Surface
  final Color actionSurfaceDefault;
  final Color actionSurfaceSecondary;
  // Action Border
  final Color actionBorderDefault;
  final Color actionBorderSecondary;
  // Action Content
  final Color actionContentDefault;
  final Color actionContentSecondary;
  // Critical Surface
  final Color criticalSurfaceDefault;
  final Color criticalSurfaceSecondary;
  // Critical Border
  final Color criticalBorderDefault;
  final Color criticalBorderSecondary;
  // Critical Content
  final Color criticalContentDefault;
  final Color criticalContentSecondary;
  // Special
  final Color specialElectricity;
  final Color specialElectricityBackground;
  final Color specialGas;
  final Color specialGasBackground;
  final Color specialSolar;
  final Color specialSolarBackground;
  final Color specialBlue;
  final Color specialBlueBackground;

  // ─── Static instances ───────────────────────────────────────────────────────

  static const light = AppColorsExtension(
    basicSurfaceDefault: AppColorPrimitives.white,
    basicSurfaceSecondary: AppColorPrimitives.base10,
    basicSurfaceTertiary: AppColorPrimitives.base20,
    basicBorderDefault: AppColorPrimitives.base40,
    basicBorderSecondary: AppColorPrimitives.base50,
    basicBorderTertiary: AppColorPrimitives.base20,
    basicContentDefault: AppColorPrimitives.base90,
    basicContentSecondary: AppColorPrimitives.base60,
    basicContentDisabled: AppColorPrimitives.base40,
    basicContentInverted: AppColorPrimitives.white,
    basicBackgroundDefault: AppColorPrimitives.base20,
    basicBackgroundSecondary: AppColorPrimitives.base30,
    actionSurfaceDefault: AppColorPrimitives.brand50,
    actionSurfaceSecondary: AppColorPrimitives.brand30,
    actionBorderDefault: AppColorPrimitives.brand100,
    actionBorderSecondary: AppColorPrimitives.brand120,
    actionContentDefault: AppColorPrimitives.brand110,
    actionContentSecondary: AppColorPrimitives.brand100,
    criticalSurfaceDefault: AppColorPrimitives.red50,
    criticalSurfaceSecondary: AppColorPrimitives.base30,
    criticalBorderDefault: AppColorPrimitives.red100,
    criticalBorderSecondary: AppColorPrimitives.red120,
    criticalContentDefault: AppColorPrimitives.red120,
    criticalContentSecondary: AppColorPrimitives.red100,
    specialElectricity: AppColorPrimitives.electricity100,
    specialElectricityBackground: AppColorPrimitives.electricity80,
    specialGas: AppColorPrimitives.gas100,
    specialGasBackground: AppColorPrimitives.gas80,
    specialSolar: AppColorPrimitives.solar100,
    specialSolarBackground: AppColorPrimitives.solar90,
    specialBlue: AppColorPrimitives.blue100,
    specialBlueBackground: AppColorPrimitives.blue60,
  );

  static const dark = AppColorsExtension(
    basicSurfaceDefault: AppColorPrimitives.base90,
    basicSurfaceSecondary: AppColorPrimitives.base90,
    basicSurfaceTertiary: AppColorPrimitives.base80,
    basicBorderDefault: AppColorPrimitives.base70,
    basicBorderSecondary: AppColorPrimitives.base60,
    basicBorderTertiary: AppColorPrimitives.base70,
    basicContentDefault: AppColorPrimitives.base10,
    basicContentSecondary: AppColorPrimitives.base50,
    basicContentDisabled: AppColorPrimitives.base70,
    basicContentInverted: AppColorPrimitives.base90,
    basicBackgroundDefault: AppColorPrimitives.base100,
    basicBackgroundSecondary: AppColorPrimitives.base90,
    actionSurfaceDefault: AppColorPrimitives.brand60,
    actionSurfaceSecondary: AppColorPrimitives.brand120,
    actionBorderDefault: AppColorPrimitives.brand100,
    actionBorderSecondary: AppColorPrimitives.brand60,
    actionContentDefault: AppColorPrimitives.brand80,
    actionContentSecondary: AppColorPrimitives.brand100,
    criticalSurfaceDefault: AppColorPrimitives.red60,
    criticalSurfaceSecondary: AppColorPrimitives.base90,
    criticalBorderDefault: AppColorPrimitives.red100,
    criticalBorderSecondary: AppColorPrimitives.red60,
    criticalContentDefault: AppColorPrimitives.red60,
    criticalContentSecondary: AppColorPrimitives.red100,
    specialElectricity: AppColorPrimitives.electricity100,
    specialElectricityBackground: AppColorPrimitives.green100,
    specialGas: AppColorPrimitives.gas100,
    specialGasBackground: AppColorPrimitives.gas80,
    specialSolar: AppColorPrimitives.solar100,
    specialSolarBackground: AppColorPrimitives.solar90,
    specialBlue: AppColorPrimitives.blue100,
    specialBlueBackground: AppColorPrimitives.coolBlue100,
  );

  // ─── Hierarchical facade getters ────────────────────────────────────────────

  BasicColors get basic => BasicColors(
    surface: BasicSurfaceColors(
      default_: basicSurfaceDefault,
      secondary: basicSurfaceSecondary,
      tertiary: basicSurfaceTertiary,
    ),
    border: BasicBorderColors(
      default_: basicBorderDefault,
      secondary: basicBorderSecondary,
      tertiary: basicBorderTertiary,
    ),
    content: BasicContentColors(
      default_: basicContentDefault,
      secondary: basicContentSecondary,
      disabled: basicContentDisabled,
      inverted: basicContentInverted,
    ),
    background: BasicBackgroundColors(
      default_: basicBackgroundDefault,
      secondary: basicBackgroundSecondary,
    ),
  );

  ActionColors get action => ActionColors(
    surface: ActionSurfaceColors(
      default_: actionSurfaceDefault,
      secondary: actionSurfaceSecondary,
    ),
    border: ActionBorderColors(
      default_: actionBorderDefault,
      secondary: actionBorderSecondary,
    ),
    content: ActionContentColors(
      default_: actionContentDefault,
      secondary: actionContentSecondary,
    ),
  );

  CriticalColors get critical => CriticalColors(
    surface: CriticalSurfaceColors(
      default_: criticalSurfaceDefault,
      secondary: criticalSurfaceSecondary,
    ),
    border: CriticalBorderColors(
      default_: criticalBorderDefault,
      secondary: criticalBorderSecondary,
    ),
    content: CriticalContentColors(
      default_: criticalContentDefault,
      secondary: criticalContentSecondary,
    ),
  );

  SpecialColors get special => SpecialColors(
    electricity: specialElectricity,
    electricityBackground: specialElectricityBackground,
    gas: specialGas,
    gasBackground: specialGasBackground,
    solar: specialSolar,
    solarBackground: specialSolarBackground,
    blue: specialBlue,
    blueBackground: specialBlueBackground,
  );
}
