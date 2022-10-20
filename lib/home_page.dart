import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  SharedPreferences? _pref;

  Future<int> getCount() async {
    _pref = await SharedPreferences.getInstance();
    _count = _pref?.getInt("count") ?? 0;
    return _count;
  }

  void increment() async {
    _pref = await SharedPreferences.getInstance();
    _pref?.setInt("count", _count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared sample"),
      ),
      body: FutureBuilder<int>(
        future: getCount(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var count = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Text(count.toString(), style: TextStyle(fontSize: 32)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _count++;
                        increment();
                      });
                    },
                    child: Text("Add"))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
