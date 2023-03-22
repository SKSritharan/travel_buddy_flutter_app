import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchableList extends StatefulWidget {
  const SearchableList({super.key});

  @override
  _SearchableListState createState() => _SearchableListState();
}

class _SearchableListState extends State<SearchableList> {
  TextEditingController _textEditingController = TextEditingController();
  List<dynamic> _data = [];
  List<dynamic> _filteredData = [];

  // Fetch country names from the API
  Future<void> _fetchCountryNames() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      final List<dynamic> countries = jsonDecode(response.body);
      final List<dynamic> countryNames =
          countries.map((country) => country['name']['common']).toList();
      setState(() {
        _data = countryNames;
        _filteredData = countryNames;
      });
    } else {
      throw Exception('Failed to fetch country names');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCountryNames();
  }

  // defining the search bar
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(16),
        ),
        onChanged: (value) {
          // filtering the data
          setState(() {
            _filteredData = _data
                .where((element) =>
                    element.toLowerCase().contains(value.toLowerCase()))
                .toList();
          });
        },
      ),
    );
  }

  // defining the list view
  Widget _buildListView() {
    // If the filteredData is empty then we will display the default data
    final data = _filteredData.isEmpty ? _data : _filteredData;
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data[index],
              style: const TextStyle(fontSize: 20),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searchable List'),
      ),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showing the search bar when user press the floating action button
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return _buildSearchBar();
              });
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
