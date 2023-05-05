import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("ReOrderable List"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "List Of Big Tech Companies",
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          SizedBox(height: 20),
          ReOrderableList(),
          SizedBox(height: 20),
          Text("Reorder these tiles by draging")
        ],
      ),
    );
  }
}

class ReOrderableList extends StatefulWidget {
  const ReOrderableList({super.key});

  @override
  State<ReOrderableList> createState() => _ReOrderableListState();
}

class _ReOrderableListState extends State<ReOrderableList> {
  List<String> _companiesList = [
    'Apple',
    'Google',
    'Microsoft',
    'Facebook',
    'Amazaon',
    'Netflix'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(_companiesList[index]),
            child: ListTile(
              title: Text(_companiesList[index]),
            ),
          );
        },
        itemCount: _companiesList.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }
            final element = _companiesList.removeAt(oldIndex);
            _companiesList.insert(newIndex, element);
          });
        },
      ),
    );
  }
}
