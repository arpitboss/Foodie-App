import 'package:flutter/material.dart';
import 'package:foodie_ui_app/models/meal.dart';
import 'package:foodie_ui_app/widgets/meal_item.dart';
import 'package:page_transition/page_transition.dart';
import 'meals_data.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  //required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  //final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        child: MealsData(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MeatItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              },
            )));

    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'No meals there!!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try Some other Category!!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ]),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
