import 'package:flutter/material.dart';

import '../models/category.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;
  CategoriesScreen(this.callBack);
  @override
  Widget build(BuildContext context) {
    var categories = Category.getCategories();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Your Category',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      callBack(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
