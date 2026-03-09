import 'package:flutter/material.dart';
import 'package:presentation/screens/home/model/home_tile_data.dart';

abstract final class HomeMockTiles {
  static List<HomeTileData> get tiles => const [
    HomeTileData(
      topRightLabel: '⊙ 2',
      centerText: '--',
      bottomLabel: 'Heat pump\ndiagnostic',
    ),
    HomeTileData(
      topIcons: [Icons.power],
      topRightLabel: '⊙ 3',
      centerText: '55°',
      bottomLabel: 'Heat pump\ndiagnostic',
    ),
    HomeTileData(centerText: '--', bottomLabel: 'Boiler status'),
    HomeTileData(centerText: '30°', bottomLabel: 'Boiler status'),
    HomeTileData(
      topIcons: [Icons.flag_outlined],
      centerText: '55°',
      bottomLabel: 'Boiler status',
    ),
    HomeTileData(
      topIcons: [Icons.power, Icons.air],
      topRightLabel: '⊙ 4',
      centerText: '55°',
      bottomLabel: 'Heat pump\ndiagnostic',
    ),
    HomeTileData(
      topIcons: [Icons.play_circle_outline, Icons.power, Icons.air],
      topRightLabel: '⊙ 5',
      centerText: '55°',
      bottomLabel: 'Heat pump\ndiagnostic',
    ),
  ];
}
