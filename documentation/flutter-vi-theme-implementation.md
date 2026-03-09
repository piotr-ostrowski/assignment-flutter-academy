# ViTheme Flutter — dane referencyjne

Plan zawiera wyłącznie surowe dane potrzebne do implementacji theme'u we Flutter na bazie ViCare Android.
Źródła: `ViColors.kt`, `BrandedColors.kt`, `BrandedFont.kt`, `BrandedTextCatalogue.kt`, `ViTypography.kt`.

---

## 1. Paleta kolorów bazowych (ViBaseColors)

Źródło: `ViColors.kt` linie 779–876.
Kolory brandowe (`Brand*`) pochodzą z `BrandedColors.kt` (moduł `brand/vicare`).

### 1.1 Brand (z BrandedColors.kt)

| Nazwa       | Hex                   |
|-------------|-----------------------|
| Brand30     | `#FFFAF9`             |
| Brand40     | `#FFF5F3`             |
| Brand50     | `#FFECE8`             |
| Brand60     | `#FFD8D1`             |
| Brand70     | `#FFB2A2`             |
| Brand80     | `#FF8B74`             |
| Brand90     | `#FF6545`             |
| Brand100    | `#FF3E17`             |
| Brand100a10 | `#FF3E17` @ 10% alpha |
| Brand110    | `#CF3415`             |
| Brand120    | `#9E2A13`             |
| Brand130    | `#6F1300`             |
| Brand140    | `#380900`             |

### 1.2 Base (neutralne szarości)

| Nazwa     | Hex                   |
|-----------|-----------------------|
| Base10    | `#FAFAFA`             |
| Base10a60 | `#FAFAFA` @ 60% alpha |
| Base20    | `#F6F6F6`             |
| Base30    | `#F0F0F0`             |
| Base30a60 | `#EEEFF1` @ 60% alpha |
| Base40    | `#DEDEDE`             |
| Base40a80 | `#DEDEDE` @ 80% alpha |
| Base50    | `#D0D0D0`             |
| Base60    | `#717171`             |
| Base60a60 | `#353535` @ 60% alpha |
| Base70    | `#545454`             |
| Base80    | `#404040`             |
| Base90    | `#353535`             |
| Base90a40 | `#353535` @ 40% alpha |
| Base90a60 | `#353535` @ 60% alpha |
| Base100   | `#242424`             |

### 1.3 Black / White

| Nazwa    | Hex                   |
|----------|-----------------------|
| Black    | `#000000`             |
| Black10  | `#000000` @ 10% alpha |
| White    | `#FFFFFF`             |
| White15a | `#FFFFFF` @ 15% alpha |
| White60a | `#FFFFFF` @ 60% alpha |
| White90a | `#FFFFFF` @ 90% alpha |
| Scrim    | `#000000` @ 10% alpha |

### 1.4 Blue

| Nazwa       | Hex       |
|-------------|-----------|
| Blue60      | `#D3EEFF` |
| Blue70      | `#A8DDFF` |
| Blue80      | `#7CCDFF` |
| Blue90      | `#51BCFF` |
| Blue100     | `#25ABFF` |
| Blue110     | `#1E89CC` |
| Blue120     | `#166799` |
| Blue130     | `#0F4466` |
| Blue140     | `#072233` |
| CoolBlue100 | `#2979FF` |

### 1.5 Red

| Nazwa     | Hex                   |
|-----------|-----------------------|
| Red30     | `#FFFAF9`             |
| Red40     | `#FFF5F3`             |
| Red50     | `#FFECE8`             |
| Red60     | `#FFD8D1`             |
| Red70     | `#FFB2A2`             |
| Red80     | `#FF8B74`             |
| Red90     | `#FF6545`             |
| Red100    | `#FF3E17`             |
| Red100a10 | `#FF3E17` @ 10% alpha |
| Red110    | `#CF3415`             |
| Red120    | `#9E2A13`             |
| Red130    | `#6F1300`             |
| Red140    | `#380900`             |

### 1.6 Green

| Nazwa    | Hex       |
|----------|-----------|
| Green10  | `#96E4A6` |
| Green20  | `#87D396` |
| Green30  | `#77C287` |
| Green40  | `#68B177` |
| Green50  | `#59A068` |
| Green60  | `#498F58` |
| Green70  | `#3A7E49` |
| Green80  | `#2B6D39` |
| Green90  | `#1B5C2A` |
| Green100 | `#0C4B1A` |

### 1.7 Electricity

| Nazwa            | Hex                   |
|------------------|-----------------------|
| Electricity80    | `#ACEEB9`             |
| Electricity80a60 | `#ACEEB9` @ 60% alpha |
| Electricity90    | `#96E4A6`             |
| Electricity100   | `#2CC84D`             |
| Electricity110   | `#166427`             |

### 1.8 Gas

| Nazwa  | Hex       |
|--------|-----------|
| Gas10  | `#EBFEFF` |
| Gas80  | `#D2F2F4` |
| Gas90  | `#C3EDEF` |
| Gas100 | `#87DADF` |
| Gas110 | `#436D70` |

### 1.9 Solar / Orange / Yellow

| Nazwa     | Hex       |
|-----------|-----------|
| Solar90   | `#FFE89F` |
| Solar100  | `#FFD13F` |
| Solar110  | `#80691F` |
| Orange90  | `#F5BA44` |
| Orange100 | `#FF9142` |
| Orange130 | `#75411A` |
| Yellow100 | `#FBC640` |

### 1.10 Air Quality

| Nazwa                   | Hex       |
|-------------------------|-----------|
| AirQualityGood          | `#B3D171` |
| AirQualityModerate      | `#F6D862` |
| AirQualityHigh          | `#EB9E64` |
| AirQualityUnhealthy     | `#E1716E` |
| AirQualityVeryUnhealthy | `#A17CB1` |
| AirQualityHazardous     | `#A17683` |

### 1.11 Pozostałe

| Nazwa                     | Hex       |
|---------------------------|-----------|
| GeofencingStatusHomeLight | `#AFAFAF` |
| Toast100                  | `#969AA5` |
| Violet100                 | `#A63A84` |
| Violet110                 | `#7E3A84` |

---

## 2. Kolory adaptacyjne light / dark (ViColors)

Źródło: `ViLightThemeColors` (linie 24–96) i `ViDarkThemeColors` (linie 108–180) w `ViColors.kt`.

Konwencja: `nazwaLight_nazwaDark`. Gdy kolor jest identyczny w obu trybach — sama nazwa.

| Pole (Android snake_case)      | Light → ViBaseColors.     | Dark → ViBaseColors. |
|--------------------------------|---------------------------|----------------------|
| `base10a60_base60a60`          | Base10a60                 | Base60a60            |
| `base20_base90`                | Base20                    | Base90               |
| `base20_base80`                | Base20                    | Base80               |
| `base20_base100`               | Base20                    | Base100              |
| `base40_base70`                | Base40                    | Base70               |
| `base40a80_base70`             | Base40a80                 | Base70               |
| `base40_base80`                | Base40                    | Base80               |
| `base50_base60`                | Base50                    | Base60               |
| `base50_base70`                | Base50                    | Base70               |
| `base20_base70`                | Base20                    | Base70               |
| `base30_base70`                | Base30                    | Base70               |
| `base30_base90`                | Base30                    | Base90               |
| `base30_base100`               | Base30                    | Base100              |
| `base60_base90`                | Base60                    | Base90               |
| `base60_white`                 | Base60                    | White                |
| `base60_base50`                | Base60                    | Base50               |
| `base60_base30`                | Base60                    | Base30               |
| `base70_base30`                | Base70                    | Base30               |
| `base70_base40`                | Base70                    | Base40               |
| `base90_base10`                | Base90                    | Base10               |
| `base90_base30`                | Base90                    | Base30               |
| `base90_base50`                | Base90                    | Base50               |
| `base90_base60`                | Base90                    | Base60               |
| `base90_base70`                | Base90                    | Base70               |
| `base90_white`                 | Base90                    | White                |
| `base100_white`                | Base100                   | White                |
| `black10_base90`               | Black10                   | Base90               |
| `black_white`                  | Black                     | White                |
| `brand80`                      | Brand80                   | Brand80              |
| `brand90`                      | Brand90                   | Brand90              |
| `brand100`                     | Brand100                  | Brand100             |
| `brand110`                     | Brand110                  | Brand110             |
| `brand110_brand80`             | Brand110                  | Brand80              |
| `brand120`                     | Brand120                  | Brand120             |
| `brand60_brand120`             | Brand60                   | Brand120             |
| `brand120_brand60`             | Brand120                  | Brand60              |
| `brand50_brand60`              | Brand50                   | Brand60              |
| `electricity100`               | Electricity100            | Electricity100       |
| `electricity80a60_green100`    | Electricity80a60          | Green100             |
| `electricity110_electricity80` | Electricity110            | Electricity80        |
| `electricity80_green100`       | Electricity80             | Green100             |
| `green100_electricity80`       | Green100                  | Electricity80        |
| `green100_electricity80a60`    | Green100                  | Electricity80a60     |
| `white`                        | White                     | White                |
| `white_base70`                 | White                     | Base70               |
| `white_base80`                 | White                     | Base80               |
| `white_base90`                 | White                     | Base90               |
| `white_base100`                | White                     | Base100              |
| `red100`                       | Red100                    | Red100               |
| `red110`                       | Red110                    | Red110               |
| `red120`                       | Red120                    | Red120               |
| `red90`                        | Red90                     | Red90                |
| `red50_red60`                  | Red50                     | Red60                |
| `red60_red120`                 | Red60                     | Red120               |
| `red120_red60`                 | Red120                    | Red60                |
| `blue60`                       | Blue60                    | Blue60               |
| `blue70`                       | Blue70                    | Blue70               |
| `blue100`                      | Blue100                   | Blue100              |
| `blue110`                      | Blue110                   | Blue110              |
| `blue60_coolBlue100`           | Blue60                    | CoolBlue100          |
| `coolBlue100_blue60`           | CoolBlue100               | Blue60               |
| `geofencingStatusHome`         | GeofencingStatusHomeLight | White                |
| `geofencingStatusAway`         | Green10                   | Green10              |
| `solar90_orange130`            | Solar90                   | Orange130            |
| `solar90_yellow100`            | Solar90                   | Yellow100            |
| `orange130`                    | Orange130                 | Orange130            |
| `orange90`                     | Orange90                  | Orange90             |
| `yellow100`                    | Yellow100                 | Yellow100            |

Dodatkowe computed property: `brand100a10` = Brand100 z 10% alpha (nie jest parametrem konstruktora, wynika z `brand100`).

---

## 3. Material ColorScheme mapping

Źródło: `ViLightColorMaterialPalette` (linie 692–729) i `ViDarkColorMaterialPalette` (linie 735–772) w `ViColors.kt`.

| ColorScheme property      | Light → ViBaseColors. | Dark → ViBaseColors. |
|---------------------------|-----------------------|----------------------|
| `primary`                 | Base90                | Base30               |
| `onPrimary`               | Base30                | Base90               |
| `primaryContainer`        | Base30                | Base90               |
| `onPrimaryContainer`      | Base90                | White                |
| `inversePrimary`          | Base30                | Base90               |
| `secondary`               | Brand90               | Brand90              |
| `onSecondary`             | White                 | White                |
| `secondaryContainer`      | Brand30               | Brand30              |
| `onSecondaryContainer`    | White                 | White                |
| `tertiary`                | Brand120              | Brand120             |
| `onTertiary`              | White                 | White                |
| `tertiaryContainer`       | Brand40               | Brand40              |
| `onTertiaryContainer`     | White                 | White                |
| `background`              | Base20                | Base100              |
| `onBackground`            | Base90                | White                |
| `surface`                 | White                 | Base90               |
| `onSurface`               | Base90                | Base60               |
| `surfaceVariant`          | Base20                | Base100              |
| `onSurfaceVariant`        | Base60                | Base50               |
| `surfaceTint`             | Base90                | Base30               |
| `inverseSurface`          | Base90                | White                |
| `inverseOnSurface`        | Base40                | Base70               |
| `error`                   | Red90                 | Red90                |
| `onError`                 | White                 | White                |
| `errorContainer`          | Base30                | Base90               |
| `onErrorContainer`        | Base90                | White                |
| `outline`                 | Brand100              | Brand100             |
| `outlineVariant`          | Brand120              | Brand120             |
| `scrim`                   | Scrim                 | Scrim                |
| `surfaceBright`           | White                 | Base100              |
| `surfaceContainer`        | Base10                | Base90               |
| `surfaceContainerHigh`    | Base20                | Base70               |
| `surfaceContainerHighest` | Base10                | Base80               |
| `surfaceContainerLow`     | Base30                | Base90               |
| `surfaceContainerLowest`  | Base40                | Base100              |
| `surfaceDim`              | Base90a60             | Base10a60            |

---

## 4. Fonty

Źródło: `BrandedFont.kt`.

Font family: `ViessmannBrand` (nazwa do rejestracji w `pubspec.yaml`).

| Plik fontu        | FontWeight      |
|-------------------|-----------------|
| `brand_light`     | w300 (Light)    |
| `brand_regular`   | w400 (Normal)   |
| `brand_medium`    | w500 (Medium)   |
| `brand_semi_bold` | w600 (SemiBold) |
| `brand_bold`      | w700 (Bold)     |

---

## 5. Typografia (ViTypography / BrandedTextCatalogue)

Źródło: `BrandedTextCatalogue.kt` (definicje stylów), `ViTypography.kt` (klasa eksponująca).

Font family dla wszystkich stylów: `ViessmannBrand`.

Feature `fontFeatureSettings: "'pnum' 1"` → we Flutterze: `fontFeatures: [FontFeature.proportionalFigures()]`.

`lineHeight` z Compose (np. `24.sp`) → we Flutterze: `height = lineHeight / fontSize` (np. `24/18 ≈ 1.33`).

### 5.1 Display

| Styl | Rozmiar (sp) | FontWeight    | lineHeight | pnum |
|------|--------------|---------------|------------|------|
| d1   | 130          | w400 (Normal) | –          | ✅    |
| d2   | 100          | w400 (Normal) | –          | ✅    |
| d3   | 56           | w400 (Normal) | –          | ✅    |

### 5.2 Heading

| Styl | Rozmiar (sp) | FontWeight      | lineHeight | pnum |
|------|--------------|-----------------|------------|------|
| h1   | 28           | w500 (Medium)   | –          | ✅    |
| h2   | 24           | w600 (SemiBold) | –          | ✅    |
| h3   | 18           | w600 (SemiBold) | –          | ❌    |
| h4   | 16           | w600 (SemiBold) | –          | ❌    |
| h5   | 16           | w500 (Medium)   | –          | ❌    |

### 5.3 Body

| Styl  | Rozmiar (sp) | FontWeight    | lineHeight (sp) | pnum |
|-------|--------------|---------------|-----------------|------|
| body1 | 18           | w400 (Normal) | 24              | ❌    |
| body2 | 16           | w400 (Normal) | 24              | ✅    |

### 5.4 Tile

| Styl  | Rozmiar (sp) | FontWeight      | lineHeight | pnum |
|-------|--------------|-----------------|------------|------|
| tile1 | 40           | w500 (Medium)   | –          | ✅    |
| tile2 | 40           | w400 (Normal)   | –          | ✅    |
| tile7 | 16           | w600 (SemiBold) | –          | ✅    |

### 5.5 Note

| Styl  | Rozmiar (sp) | FontWeight    | lineHeight | pnum |
|-------|--------------|---------------|------------|------|
| note1 | 14           | w500 (Medium) | –          | ✅    |
| note2 | 14           | w400 (Normal) | –          | ✅    |
| note3 | 12           | w400 (Normal) | –          | ✅    |
| note4 | 12           | w500 (Medium) | –          | ✅    |
| note5 | 10           | w400 (Normal) | –          | ✅    |

### 5.6 Label

| Styl    | Rozmiar (sp) | FontWeight    | lineHeight | pnum |
|---------|--------------|---------------|------------|------|
| label1  | 32           | w400 (Normal) | –          | ✅    |
| label2  | 28           | w400 (Normal) | –          | ✅    |
| label3  | 24           | w400 (Normal) | –          | ✅    |
| label4  | 24           | w400 (Normal) | –          | ✅    |
| label5  | 20           | w400 (Normal) | –          | ✅    |
| label6  | 18           | w400 (Normal) | –          | ❌    |
| label7  | 16           | w400 (Normal) | –          | ✅    |
| label8  | 16           | w400 (Normal) | –          | ✅    |
| label9  | 14           | w400 (Normal) | –          | ✅    |
| label10 | 10           | w500 (Medium) | –          | ✅    |

### 5.7 Material Typography mapping

Źródło: `ViMaterialTypography` w `ViTypography.kt` (linie 136–152).

| Material slot    | → BrandedTextCatalogue styl |
|------------------|-----------------------------|
| `displayLarge`   | d1                          |
| `displayMedium`  | d2                          |
| `displaySmall`   | d3                          |
| `headlineLarge`  | h1                          |
| `headlineMedium` | h2                          |
| `headlineSmall`  | h3                          |
| `titleLarge`     | h4                          |
| `titleMedium`    | h5                          |
| `titleSmall`     | label7                      |
| `bodyLarge`      | body1                       |
| `bodyMedium`     | body2                       |
| `bodySmall`      | note3                       |
| `labelLarge`     | note1                       |
| `labelMedium`    | note2                       |
| `labelSmall`     | note3                       |

