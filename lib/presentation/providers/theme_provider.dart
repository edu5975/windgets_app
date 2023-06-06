import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windgets_app/config/theme/app_theme.dart';

//Un simple boolean
final isDarModeProvider = StateProvider((ref) => false);

//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple int
final selectedIndexColorProvider = StateProvider((ref) => 0);
