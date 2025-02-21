import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});
//buildcontext's  reasons on stful widget ctx are global but on stles widget u cant use ctx without buildctx
  void _selectCategory(BuildContext context,Category category){
    //where is copy your picked at the list 
    //contains check list's values
    final filteredMeals=dummyMeals
    .where((meal) => meal.categories.contains(category.id),)
    .toList();
    //Navigator.of(ctx).push(route);
    Navigator.push(
      context,MaterialPageRoute(builder: (ctx) => 
    MealsScreen(
    title: category.title, 
    meals: filteredMeals
    ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title:const Text('Pick your category'),
      ),
      //main page content
      body: GridView(
        //should use gridview.builder for optimization 
        padding: const EdgeInsets.all(24),
        
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,//have 2 column
        childAspectRatio: 3/2,//aspect ratio(en-boy oranı)
        crossAxisSpacing: 20,//column space
        mainAxisSpacing: 20,//row space
        ),
        children:  [
          //availableCategories.map((category)=> CategoryGridItem(category: category)).toList() this is alternative for loop
          for (final category in availableCategories)
           CategoryGridItem(category: category,
           onSelectCategory: (){
            _selectCategory(context,category);
            },
            ),
          
      ],
      ),
     );
  }
}