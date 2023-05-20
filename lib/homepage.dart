import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/API.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder(
        future: getAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data['products'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data['products'][index]['title']),
                  leading: Image.network(
                      snapshot.data['products'][index]['thumbnail'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover),
                  subtitle: Text(snapshot.data['products'][index]['brand']),
                  trailing: Text(snapshot.data['products'][index]['price'].toString()),
                   

                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
