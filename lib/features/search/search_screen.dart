import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width:
                        isSearching
                            ? MediaQuery.of(context).size.width * 0.86
                            : MediaQuery.of(context).size.width * 0.94,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: searchController,
                      onTap: () {
                        // TextField 클릭 시 실행
                        isSearching = !isSearching;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  isSearching ? Icon(Icons.close) : SizedBox(),
                ],
              ),
            ),
            ),
          isSearching ? Text("data") : Text("asd"),
        ],
      ),
    );
  }
}
