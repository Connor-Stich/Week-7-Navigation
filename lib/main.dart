import 'package:flutter/material.dart';

import 'Models/globalItems.dart';
import 'Models/item.dart';

import 'package:stich_week7_/Views/editItemPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stich Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [
    Item(1, "Doge", "Dogecoin"),
    Item(2, "Baseball", "Sport"),
    Item(3, "Soccer", "Sport"),
    Item(4, "Television", "Electronics"),
    Item(5, "Dog Food", "Pet"),
    Item(6, "Nail", "Hardware"),
    Item(7, "Christmas Tree" , "Holiday"),
    Item(8, "Desk", "Supplies"),
    Item(9, "Oven", "Kitchen"),
    Item(10, "Pool", "Summer"),
  ];

  void _editItem(Item item) {
    setState(() {
      if(!GlobalItems().items.contains(item))
      {
        GlobalItems().items.add(item);
      }
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditItemPage(item: item))).then(((value) => {setState(() => item = GlobalItems().items.firstWhere((index) => index.id == item.id))}));
      
    });
  }

  void _deleteItem(int itemId) {
    setState(() {
      items.removeWhere((item) => item.id == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Stich Week 7'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Item item = items[index];
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(item.name),
                onTap: () {
                  _editItem(item); 
                },
              ),
              Divider(), 
              ElevatedButton(
                onPressed: () {
                  _deleteItem(item.id); 
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              Divider(), 
            ],
          );
        },
      ),
    );
  }
}
