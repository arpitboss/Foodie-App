import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filter_provider.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

//   final Map<Filter, bool> currentFilters;

//   @override
//   State<StatefulWidget> createState() {
//     return _FilterScreenState();
//   }
// }

// class _FilterScreenState extends State<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

//   @override
//   void initState() {
//     super.initState();
//     _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
//     _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
//     _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
//     _veganFilterSet = widget.currentFilters[Filter.vegan]!;
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.pop(context);
      //   if (identifier == 'meals') {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => const TabsScreen()));
      //   }
      // }),
      // body: WillPopScope(
      // onWillPop: () async {
      //   Navigator.of(context).pop({
      //     Filter.glutenFree: _glutenFreeFilterSet,
      //     Filter.lactoseFree: _lactoseFreeFilterSet,
      //     Filter.vegetarian: _vegetarianFilterSet,
      //     Filter.vegan: _veganFilterSet,
      //   });
      //   return false;
      // },
      body: Column(children: [
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          value: filters[Filter.glutenFree]!,
          title: Text(
            'Gluten-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only include gluten-free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          value: filters[Filter.lactoseFree]!,
          title: Text(
            'Lactose-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only include lactose-free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.vegetarian, isChecked);
          },
          value: filters[Filter.vegetarian]!,
          title: Text(
            'Vegetarian',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only include vegetarian meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          value: filters[Filter.vegan]!,
          title: Text(
            'Vegan',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only include vegan meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
    );
  }
}
