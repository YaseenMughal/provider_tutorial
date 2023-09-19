import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/favourite_provider.dart';
import 'package:provider_tutorial/screens/store_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorial"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StoreScreen()));
            },
            child: Icon(
              Icons.store,
              size: 30.0,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    productName.length, // Use the actual length of your data
                itemBuilder: (context, index) {
                  // final isItemSelected = selectedItem.contains(index);

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
