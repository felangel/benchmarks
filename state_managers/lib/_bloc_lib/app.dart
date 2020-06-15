import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:benckmark/item.dart';
import 'package:benckmark/_bloc_lib/_blocs/items/items_bloc.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Lib Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Page(title: 'BLoC Lib Sample'),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  final _itemsBloc = ItemsBloc();

  @override
  void initState() {
    super.initState();
    fill();
  }

  @override
  void dispose() {
    _itemsBloc.close();
    super.dispose();
  }

  fill() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      _itemsBloc.add(AddItemEvent(Item(title: DateTime.now().toString())));
    }
    print("It's done. Print now!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<ItemsBloc, List<Item>>(
        bloc: _itemsBloc,
        builder: (context, items) {
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(items[index].title));
            },
          );
        },
      ),
    );
  }
}
