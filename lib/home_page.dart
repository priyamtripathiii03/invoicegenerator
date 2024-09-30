import 'package:flutter/material.dart';
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
          }, icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),),
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('/search');
          }, icon:const Icon( Icons.search,color: Colors.white,),)
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Star Market',
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
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categories
                      .map(
                        (category) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FilterChip(
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
                        ),
                  )
                      .toList(),
                ),
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
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      leading: Image(
                        image: AssetImage(product.img.toString()),
                      ),
                      title: Text(
                        product.name.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        product.price.toString(),
                        style: const TextStyle(color: Colors.grey),
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