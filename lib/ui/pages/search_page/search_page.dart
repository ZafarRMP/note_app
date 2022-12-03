import 'package:ProNote/domain/hive/hive_boxes.dart';
import 'package:ProNote/domain/hive/note_data.dart';
import 'package:ProNote/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:ProNote/ui/components/note_list_item/note_list_item.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  var filteredList = <NoteData>[];
  final searchController = TextEditingController();

  void _searchNote() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredList = _notes.where(
        (NoteData notesList) {
          return notesList.title.toLowerCase().contains(query.toLowerCase());
        },
      ).toList();
    } else {
      filteredList = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredList = _notes;
    searchController.addListener(_searchNote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadow(),
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.primaryDarkColor,
          style: AppTextStyles.appBarTitle,
          decoration: InputDecoration(
            hintText: 'Поиск...',
            hintStyle: AppTextStyles.appBarTitle,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (searchController.text.isEmpty) {
                Navigator.of(context).pop();
              } else {
                searchController.clear();
              }
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NoteData> box, child) {
          return ListView.separated(
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final noteItem = filteredList[index];

              return NoteListItem(
                index: index,
                title: noteItem.title,
                date: noteItem.date,
                note: noteItem.description,
              );
            },
          );
        },
      ),
    );
  }
}
