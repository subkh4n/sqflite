import 'package:flutter/material.dart';
import 'package:belajarsqflite/database/db_helper.dart';
import 'package:belajarsqflite/database/queries/country_query.dart';
import 'package:belajarsqflite/models/country.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final DbHelper _helper = DbHelper();

  @override
  void initState() {
    super.initState();
    // Open the database when initializing the screen.
    _helper.openDB().then((_) {
      // Insert a new country record.
      _helper.insert(CountryQuery.TABLE_NAME, {"name": "Singapura"});

      // Retrieve all records from the country table and print them to console.
      _helper.getData(CountryQuery.TABLE_NAME).then((value) {
        value.forEach((element) {
          Country country = Country.fromJson(element);
          print(country.toJson());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQFLITE Demo"),
      ),
    );
  }
}
