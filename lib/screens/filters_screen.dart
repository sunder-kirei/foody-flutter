import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  static const String routeName = "/filter";
  final List<Map<String, bool>> filterList;
  final Function toggleFilters;

  const Filters(
      {super.key, required this.filterList, required this.toggleFilters});

  Widget buildSwitchTile(
    BuildContext context,
    String title,
    bool currentValue,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: SwitchListTile(
          value: currentValue,
          onChanged: (currentValue) {
            toggleFilters(title, currentValue);
          },
          title: Text(
            title,
          ),
          controlAffinity: ListTileControlAffinity.platform,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> switchList(BuildContext context) {
    return filterList
        .map(
          (item) => buildSwitchTile(
            context,
            item.keys.toList()[0],
            item.values.toList()[0],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          ...switchList(context),
        ],
      ),
    );
  }
}
