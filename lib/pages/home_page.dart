import 'package:flutter/material.dart';
import 'package:practica3/database/database_helper.dart';
import 'package:practica3/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseHelper.getTask(),
      builder:
          (BuildContext context, AsyncSnapshot<List<TaskModel>?> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Task List"),
                ),
                body: Center(
                  child: Text("${snapshot.data?.length}"),
                )),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
