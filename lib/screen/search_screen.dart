import 'package:flutter/material.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'db/models/dart_models.dart';
import 'db/models/details.dart';

ValueNotifier<List<StudentModel>> temp = ValueNotifier([]);
class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  get studentDeatails_screen => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: bodysearch(context),
    );
  }
  Bar() {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular((30)),
        ),
        child: TextField( 
          onTap: () {},
          onChanged: (String? value) {
            if (value == null || value.isEmpty) {
              temp.value.addAll(studentListNotifier.value);
              temp.notifyListeners();
            } else {
              temp.value.clear();
                for (StudentModel i in studentListNotifier.value) {
                if (i.name.toLowerCase().contains(value.toLowerCase())) {
                  temp.value.add(i);
                }
                temp.notifyListeners();
              }
            }
          },
          controller: searchController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'search'),
        ),
      ),
    );
  }
  bodysearch(BuildContext context) {
    return SafeArea(
        child: ValueListenableBuilder(
            valueListenable: temp,
            builder: (BuildContext ctx, List<StudentModel> searchData,
                Widget? child) {
              return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = searchData[index];
                    return ListTile(
                        title: Text(data.name),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Details(
                              name: data.name,
                              age: data.age,
                              guardion: data.guardion,
                              number: data.number,
                              image: data.image!,
                            ),
                          ));
                        });
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: searchData.length);
            }));
  }

}