import 'package:flutter/material.dart';
import 'package:foodie_ui_app/data/dummy_data.dart';
import 'package:foodie_ui_app/screens/meals.dart';
import 'package:foodie_ui_app/widgets/category_grid_item.dart';
import 'package:foodie_ui_app/models/category_class.dart';

import '../models/meal.dart';

class Categories extends StatefulWidget {
  final List<Meal> availableMeals;
  const Categories(
      {super.key,
      //required this.onToggleFavorite,
      required this.availableMeals});

  @override
  State<Categories> createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  //final void Function(Meal meal) onToggleFavorite;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Categorys category) {
    List<Meal> mealsList = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title: category.title,
              meals: mealsList,
              //onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2),
        children: [
          //availableCategories.map((category) => CategoryGridItem(category: category)).toList();
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onTap: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
    );
  }
}
