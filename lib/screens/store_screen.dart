import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/favourite_provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<String> productName = [
    "Mango",
    "Orange",
    "Grapes",
    "Banana",
    "Cherry",
    "Peach",
    "Fruit Basket"
  ];
  List<String> productUnit = [
    "( Kg )",
    "( Dozen )",
    "( Kg )",
    "( Dozen )",
    "( Kg )",
    "( Kg )",
    "( Kg ) "
  ];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    'assets/images/mangologo.png',
    'assets/images/orangelogo.png',
    'assets/images/grapeslogo.png',
    'assets/images/bananalogo.png',
    'assets/images/cherrylogo.png',
    'assets/images/peachlogo.png',
    'assets/images/fruitbascet.png'
  ];
  @override
  Widget build(BuildContext context) {
    print("build");
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorial"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.selecteditem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return Card(
                        color: Colors.grey[300],
                        elevation: 3.0,
                        child: ListTile(
                          onTap: () {
                            if (value.selecteditem.contains(index)) {
                              value.removeItem(index);
                            } else {
                              value.addItem(index);
                            }
                          },
                          title: Row(
                            children: [
                              Text(
                                productName[index] + " " + productUnit[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          subtitle: Text(productPrice[index].toString(),
                              style: TextStyle(fontSize: 20)),
                          leading: Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(productImage[index],
                                fit: BoxFit.fill),
                          ),
                          trailing: Icon(
                              value.selecteditem.contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                              size: 30),
                          iconColor: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
