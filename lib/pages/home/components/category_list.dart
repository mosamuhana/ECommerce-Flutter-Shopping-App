import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/data.dart';
import '../../../models/models.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Category> categories = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final category = categories[index];
    final active = selectedIndex == index;
    final color = active ? kTextColor : kTextLightColor;
    final barColor = active ? Colors.black : Colors.transparent;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color: barColor,
            )
          ],
        ),
      ),
    );
  }

  Future<void> load() async {
    try {
      final items = await getCategories();
      categories = items ?? [];
      setState(() {});
    } catch (e) {}
  }
}
