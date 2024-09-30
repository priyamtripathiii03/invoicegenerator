import 'package:flutter/material.dart';
import 'global.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Cart Page",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              showItemsList.length,
              (index) => Card(
                elevation: 8.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    title: Text(
                      showItemsList[index].name.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      showItemsList[index].price.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: SizedBox(
                      width: 160,
                      child: Row(
                        children: [
                          Container(
                            width: 112,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addItems[index].quantity--;
                                      addItems.remove(showItemsList[index]);
                                      if (addItems[index].quantity == 0) {
                                        showItemsList
                                            .remove(showItemsList[index]);
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                const Spacer(),
                                Text(
                                  addItems[index].quantity.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addItems[index].quantity++;
                                      addItems.add(showItemsList[index]);
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                showItemsList.remove(showItemsList[index]);
                                addItems.remove(addItems[index]);
                              });
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/PDF');
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${payment().toInt()} pay',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
