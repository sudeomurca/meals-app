import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget{
const CategoryGridItem({super.key,
required this.category,
required this.onSelectCategory,
});
//keeping values
final Category category;
final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
   return InkWell(
    onTap: onSelectCategory,
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(16),
     child: Container(
      padding: const EdgeInsets.all(16),
       decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        colors: [category.color.withAlpha(140), // %55 Opaklık (0.55 * 255 ≈ 140)
    category.color.withAlpha(230), // %90 Opaklık (0.9 * 255 ≈ 230)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
       ),
       //Container's widget 
       child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
       ),
       ),
     ),
   );
  }
}