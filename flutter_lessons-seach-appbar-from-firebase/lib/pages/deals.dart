import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_deal.dart';

class DealsPage extends StatefulWidget {
  final String searchText;
  const DealsPage(this.searchText, {super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  Widget buildList(context, docs) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          docs['title'],
        ),
        subtitle: Text(
          docs['description'],
        ),
        leading: Image.network(
          docs['image'],
        ),
        trailing: const Icon(
          Icons.arrow_right,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              var deal =
                  Deal(docs['title'], docs['description'], docs['image']);
              return AddDeal('Изменить/удалить', deal, true);
            },
          ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("deals").snapshots(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else {
          var list = snapshot.data.docs
              .where((x) => x['title']
                      .toLowerCase()
                      .contains(widget.searchText.toLowerCase())
                  ? true
                  : false)
              .toList();
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => buildList(
              context,
              list[index],
            ),
          );
        }
      },
    );
  }
}

class Deal {
  String? id;
  String title;
  String description;
  String image;

  Deal(this.title, this.description, this.image, {this.id});
}
