import 'package:flutter/material.dart';

import 'package:invoicegenerator/textbox.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final List<String> categories = [
    'Food',
    'Fruits',
    'Electronics',
    'Sports',
  ];
  final List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final filterProducts = productList.where((product) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(product.category);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('/edit');
          }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,),),
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('/search');
          }, icon:Icon( Icons.search,color: Colors.white,),)
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: categories
                    .map(
                      (category) => FilterChip(
                    selected: selectedCategories.contains(category),
                    label: Text(category),
                    onSelected: (selected) {
                      setState(
                            () {
                          if (selected) {
                            selectedCategories.add(category);
                          } else {
                            selectedCategories.remove(category);
                          }
                        },
                      );
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterProducts.length,
              itemBuilder: (context, index) {
                final product = filterProducts[index];
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      leading: Image(
                        image: AssetImage(product.img.toString()),
                      ),
                      title: Text(
                        product.name.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: Text(
                        product.price.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          showItemsList.add(product);
                          addItems.add(product);
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}