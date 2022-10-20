import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_sample/local_data/storage_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  int getCount() {
    _count = StorageRepository.getInt("count");
    return _count;
  }

  void increment() async {
    await StorageRepository.saveInt("count", _count);
  }

  @override
  void initState() {
    super.initState();
    getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared sample"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Text(_count.toString(), style: TextStyle(fontSize: 32)),
            TextButton(
                onPressed: () {
                  setState(() {
                    _count++;
                    increment();
                  });
                },
                child: Text("Add"))
          ],
        ));
  }
}
