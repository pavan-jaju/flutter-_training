import 'dart:math';

import 'package:e_comm_app/features/model/product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var arrayOfNames = <String>[
  //   "Batman",
  //   "Spiderman",
  //   "Dr. X",
  //   "Magneto",
  //   "Batman",
  //   "Spiderman",
  //   "Dr. X",
  //   "Magneto",
  //   "Batman",
  //   "Spiderman",
  //   "Dr. X",
  //   "Magneto"
  // ];

  var arrayOfCategory = <String>["All", "Marvel", "DC", "Others"];

  // var _selectedNames = <int>{};

  var _currentCategory = "All";

  var selectedProducts = <int, int>{};

  var products = Product.GetProducts();

  addItemToCart(int productId) {
    setState(() {
      //_selectedNames.add(productId);
      var cartItem = selectedProducts[productId];
      selectedProducts[productId] = cartItem == null ? 1 : ++cartItem;
      debugPrint(selectedProducts.toString());
      // selectedProducts.addEntries([MapEntry(productId, 1)]);
    });
    // debugPrint(_selectedNames.toString());
  }

  removeItemToCart(int productId) {
    var cartItemCheck = selectedProducts[productId];
    if (cartItemCheck == null) return;

    int cartItem = cartItemCheck - 1;

    setState(() {
      if (cartItem <= 0) {
        selectedProducts.remove(productId);
      } else {
        selectedProducts[productId] = max(cartItem, 0);
      }
      debugPrint(selectedProducts.toString());
    });
  }

  double calculateCartCost() {
    double price = 0;
    //_selectedNames.add(productId);
    // var itemRate = products[productId].rate;
    // price = price + itemRate;
    selectedProducts.forEach((key, value) {
      price += value * products[key].rate;
    });
    // selectedProducts.addEntries([MapEntry(productId, 1)]);
    return price;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building...");
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey!"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  selectedProducts.clear();
                });
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey.shade100,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  var isSelected = _currentCategory == arrayOfCategory[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: () {
                        if (!isSelected) {
                          setState(() {
                            _currentCategory = arrayOfCategory[index];
                          });
                        }
                      },
                      child: Chip(
                        label: Text(
                          arrayOfCategory[index],
                          style: isSelected
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)
                              : TextStyle(),
                        ),
                        backgroundColor:
                            isSelected ? Colors.teal : Colors.grey.shade300,
                      ),
                    ),
                  );
                },
                itemCount: arrayOfCategory.length,
              ),
              // child: Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         setState(() {
              //           _currentCategory = "All";
              //         });
              //       },
              //       child: Chip(
              //         label: Text(
              //           "All",
              //           style: _currentCategory == "All"
              //               ? TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold)
              //               : TextStyle(),
              //         ),
              //         backgroundColor: _currentCategory == "All"
              //             ? Colors.teal
              //             : Colors.grey,
              //       ),
              //     ),
              //     SizedBox(width: 8),
              //     InkWell(
              //       child: Chip(label: Text("Marvel")),
              //       onTap: () {
              //         setState(() {
              //           _currentCategory = "Marvel";
              //         });
              //       },
              //     ),
              //     SizedBox(width: 8),
              //     Chip(label: Text("DC")),
              //     SizedBox(width: 8),
              //     Chip(label: Text("Any other")),
              //   ],
              // ),
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 10,
          //         color: Colors.green,
          //       ),
          //     ),
          //     Container(
          //       color: Colors.teal,
          //       width: 50,
          //       height: 50,
          //     ),
          //     Icon(Icons.ac_unit),
          //     SizedBox(
          //       width: 30,
          //       height: 30,
          //       child: Container(
          //         color: Colors.blue,
          //         width: 150,
          //         height: 50,
          //       ),
          //     ),
          //     Icon(Icons.ac_unit),
          //   ],
          // ),
          // SizedBox(height: 8),
          Expanded(
            flex: 6,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              // physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                var product = products[index];
                return Card(
                  child: ListTile(
                    // leading: Image.asset('images/products/placeholder.png'),
                    leading: Image.network(product.imageUrl),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            addItemToCart(product.id);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text('${selectedProducts[product.id] ?? 0}'),
                        IconButton(
                          onPressed: () {
                            removeItemToCart(product.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    title: Text(product.name),
                    subtitle: Text('${product.description ?? '-'}'),
                  ),
                );
              },
              // separatorBuilder: (_, index) => Divider(),
              itemCount: products.length,
            ),
          ),
          SizedBox(height: 8),
          // ElevatedButton(
          //     onPressed: () {}, child: Text("$counter Items in cart")),
          Offstage(
            offstage: selectedProducts.isEmpty,
            child: InkWell(
              onTap: () {
                debugPrint("Clicked");
              },
              child: Container(
                height: 60,
                color: Colors.teal,
                child: Center(
                    child: Text(
                        "${selectedProducts.length} items in cart: INR ${calculateCartCost().toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
              ),
            ),
          )
        ],
      ),

      // body: ListView(
      //   shrinkWrap: true,
      //   children: [
      //     ListTile(
      //       title: Text("Item 1"),
      //       leading: Icon(
      //         Icons.ac_unit,
      //         color: Colors.red,
      //       ),
      //       trailing: IconButton(
      //         icon: Icon(Icons.plus_one),
      //         onPressed: () {},
      //       ),
      //       onTap: () {
      //         debugPrint("Clicked");
      //       },
      //     ),
      //     Divider(),
      //     ListTile(
      //         title: Text(
      //       "Item 1",
      //       style: TextStyle(color: Colors.teal),
      //     )),
      //     Divider(),
      //     ListView(
      //       shrinkWrap: true,
      //       primary: false,
      //       children: [
      //         Text("data 1"),
      //         Text("data 2"),
      //         Text("data 3"),
      //         Text("data 4"),
      //         Text("data 5"),
      //       ],
      //     ),
      //     Divider(),
      //     ListTile(title: Text("Item 1")),
      //     Divider(),
      //     ListTile(title: Text("Item 1")),
      //     Divider(),
      //     ListTile(title: Text("Item 1")),
      //     Divider(),
      //     ListTile(title: Text("Item 1")),
      //     Divider(),
      //   ],
      // ),
    );
  }
}
