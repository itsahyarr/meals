import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

// TUTORIAL ==================>
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavorite(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((item) => item.id != meal.id).toList();
      // debugPrint('favorite false,${state.length}');
      return false;
    } else {
      state = [...state, meal];
      // debugPrint('favorite true, ${state.length}');
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

